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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureSubscription()
        updateStatus()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        cancelSubscription()
    }
    
    private lazy var dataSource: DataSource = { [weak self] in
        guard let collectionView = self?.collectionView else { fatalError() }
        let dataSource = DataSource(collectionView: collectionView) { [weak self] (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let self = self else { return nil }
            return self.collectionView.dequeueConfiguredReusableCell(using: self.cellRegistration, for: indexPath, item: item)
        }
        
        dataSource.supplementaryViewProvider = { [weak self] (collectionView, kind, indexPath) in
            guard let supplementaryRegistration = self?.chooseSupplementaryRegistration(kind: kind) else {
                return UICollectionViewCell()
            }
            
            let currentSnapshot = dataSource.snapshot()
            let section = currentSnapshot.sectionIdentifiers[indexPath.section]
            
            let cell = collectionView.dequeueConfiguredReusableSupplementary(
                using: supplementaryRegistration, for: indexPath)
            cell.updateUI(kind: kind, with: section)
            
            return cell
        }
        
        return dataSource
    }()
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        actionForCell(on: indexPath)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    private func actionForCell(on indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        if item.isGroup {
            settingDelegate?.provideSettingPage(of: item) { [weak self] settingPage in
                guard let settingPage = settingPage else { return }
                let viewController = settingPage.viewController
                viewController.navigationItem.largeTitleDisplayMode = .never
                self?.navigationController?.pushViewController(viewController, animated: true)
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
    
    private func chooseSupplementaryRegistration(kind: String) -> SuppementaryCellRegistration {
        (kind == UICollectionView.elementKindSectionHeader) ? headerRegistration : footerRegistration
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

/// MARK : Setting Combine Subscription
fileprivate extension SettingsCollectionViewController {
    
    private func configureSubscription() {
        subscription = NotificationCenter.default.publisher(
            for: UserDefaults.didChangeNotification
        ).sink { [weak self] _ in
            self?.updateStatus()
        }
    }
    
    private func cancelSubscription() {
        subscription?.cancel()
    }
    
}
