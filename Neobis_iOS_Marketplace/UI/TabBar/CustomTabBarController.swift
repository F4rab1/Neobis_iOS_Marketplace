//
//  CustomTabBarController.swift
//  Neobis_iOS_Marketplace
//
//  Created by Фараби Иса on 28.06.2023.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    private let addButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(hexString: "#5458EA")
        button.layer.cornerRadius = 25
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor(hexString: "#5458EA")
        tabBar.barTintColor = .gray
        
        setupVCs()
        
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        tabBar.addSubview(addButton)
    }
    
    func setupVCs () {
        viewControllers = [
            createNavController(for: HomeViewController(), title: NSLocalizedString("Главная", comment: ""),
                                 image: UIImage(systemName: "house.fill")!),
            createNavController(for: WalletViewController(), title: NSLocalizedString ("Кошелок", comment: ""),
                                image: UIImage(systemName: "wallet.pass.fill")!),
            createNavController (for: ChatsViewController(), title: NSLocalizedString ("Чаты", comment: ""),
                                 image: UIImage(systemName: "chart.bar.doc.horizontal.fill" )!),
            createNavController (for: ProfileViewController(), title: NSLocalizedString ("Профиль", comment: ""),
                                 image: UIImage(systemName: "person.fill" )!)
        ]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let tabBarSize = tabBar.bounds.size
        let buttonSize = CGSize(width: Int(computedWidth(50)), height: Int(computedHeight(50)))
        addButton.frame = CGRect(x: (tabBarSize.width - buttonSize.width) / 2,
                                 y: (tabBarSize.height - buttonSize.height) / 2 - 35,
                                 width: buttonSize.width,
                                 height: buttonSize.height)
        
        tabBar.bringSubviewToFront(addButton)
    }
    
    @objc private func addButtonTapped() {
        print("Add button tapped")
    }
    
    fileprivate func createNavController (for rootViewController: UIViewController,
                                          title: String,
                                          image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
