//
//  MainScreenTabBarController.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 28.06.2023.
//

import UIKit

class MainScreenTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    func setupTabBar() {
        let catalogTabBar = self.createNav(title: "Catalog", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"), viewController: CatalogViewController(), navigationTitle: "Hello, Sneakerhead!")
        
        let cartTabBar = self.createNav(title: "Cart", image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart.fill"), viewController: CartViewController(), navigationTitle: "Cart")
        
        let profileTabBar = self.createNav(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"), viewController: ProfileViewController(), navigationTitle: "Profile")
        self.setViewControllers([catalogTabBar, cartTabBar, profileTabBar], animated: true)
        
        self.tabBar.isTranslucent = false
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().unselectedItemTintColor = .gray
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.borderWidth = 0.50
        self.tabBar.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    private func createNav(title: String, image: UIImage?, selectedImage: UIImage?, viewController: UIViewController, navigationTitle: String) -> UINavigationController {
        let nav = UINavigationController(rootViewController: viewController)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.tabBarItem.selectedImage = selectedImage
        nav.viewControllers.first?.navigationItem.title = navigationTitle
        return nav
    }
    
}

