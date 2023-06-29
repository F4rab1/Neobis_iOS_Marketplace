//
//  ProfileViewController.swift
//  Neobis_iOS_Marketplace
//
//  Created by Фараби Иса on 14.06.2023.
//

import Foundation
import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Профиль"
        
        let changeProfileButton: UIButton = {
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "changeButton"), for: .normal)
            button.addTarget(self, action: #selector(changeProfilePressed), for: .touchUpInside)
            return button
        }()
        
        let detailBarButtonItem = UIBarButtonItem(customView: changeProfileButton)
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = detailBarButtonItem
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = UIColor(hexString: "#F7F6F9")
    }
    
    @objc private func changeProfilePressed() {
        let vc = ProfileDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupConstraints() {
        
    }
}
