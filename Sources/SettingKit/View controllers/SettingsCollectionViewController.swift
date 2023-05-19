//
//  SettingsCollectionViewController.swift
//  
//
//  Created by JeongTaek Han on 2023/05/15.
//

import UIKit
import Combine


final class SettingsCollectionViewController<ViewModelType: SettingPresentable>: UICollectionViewController {
    
    private let viewModel: ViewModelType
    private var subscription: Cancellable?
    
    weak var settingDelegate: (any SettingCollectionViewControllerDelegate)?
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: Self.listLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        updateStatus()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureSubscriber()
    }
    
    private func configureSubscriber() {
        subscription = NotificationCenter.default.publisher(
            for: UserDefaults.didChangeNotification
        ).sink { [weak self] _ in
            self?.updateStatus()
        }
    }
    
    private lazy var dataSource: DataSource = {
        let dataSource = DataSource(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            collectionView.dequeueConfiguredReusableCell(using: self.cellRegistration, for: indexPath, item: item)
        }
        
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            let currentSnapshot = dataSource.snapshot()
            let section = currentSnapshot.sectionIdentifiers[indexPath.section]
            
            let cell = collectionView.dequeueConfiguredReusableSupplementary(
                using: (kind == UICollectionView.elementKindSectionHeader) ? self.headerRegistration:self.footerRegistration,
                for: indexPath)
            cell.updateUI(kind: kind, with: section)
            
            return cell
        }
        
        return dataSource
    }()
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellOnTouched(on: indexPath)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    private func cellOnTouched(on indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        if item.isGroup {
            settingDelegate?.provideSettingPage(of: item) { settingPage in
                guard let settingPage = settingPage else { return }
                let viewController = settingPage.viewController
                viewController.navigationItem.largeTitleDisplayMode = .never
                navigationController?.pushViewController(viewController, animated: true)
            }
        } else {
            settingDelegate?.action(for: item)
        }
    }
    
    private let cellRegistration = CellRegistration { (cell: Cell, indexPath: IndexPath, item: Item) in
        cell.updateUI(with: item)
    }
    
    private let headerRegistration = SuppementaryCellRegistration(
        elementKind: UICollectionView.elementKindSectionHeader,
        handler: { (_, _, _) in })
    
    private let footerRegistration = SuppementaryCellRegistration(
        elementKind: UICollectionView.elementKindSectionFooter,
        handler: { (_, _, _) in })

}

/// MARK : Typealisas
fileprivate extension SettingsCollectionViewController {
    
    typealias Section = ViewModelType.Section
    typealias Item = ViewModelType.Item
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    typealias Cell = SettingCollectionViewCell<Item>
    typealias SupplementaryCell = SettingSupplementaryCollectionViewCell<Section>
    
    typealias CellRegistration = UICollectionView.CellRegistration<Cell, Item>
    typealias SuppementaryCellRegistration = UICollectionView.SupplementaryRegistration<SupplementaryCell>
    
}

/// MARK : Manage UI hierarchy presentation
fileprivate extension SettingsCollectionViewController {
    
    private static func listLayout() -> UICollectionViewLayout {
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.headerMode = .supplementary
        config.footerMode = .supplementary
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    private func configureUI() {
        collectionView.setCollectionViewLayout(Self.listLayout(), animated: false)
    }
    
}

/// MARK : Manage UI status data
fileprivate extension SettingsCollectionViewController {
    
    private var snapshot: Snapshot {
        var snapshot = Snapshot()
        
        let settingItems = viewModel.items
        settingItems.forEach { item in
            guard let section = item.section as? Section else { return }
            if snapshot.indexOfSection(section) == .none {
                snapshot.appendSections([section])
            }
            snapshot.appendItems([item], toSection: section)
        }
        
        return snapshot
    }
    
    private func updateStatus() {
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}
