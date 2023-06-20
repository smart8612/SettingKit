import SwiftUI

struct SettingsView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UINavigationController
    
    private let mainPage = MainSettingPage()
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        mainPage.viewControllerEmbeddedInNavigationController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        context.coordinator
    }
    
}


struct SettingKit_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsView()
    }
    
}
