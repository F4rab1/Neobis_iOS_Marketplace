//
//  RegistrationViewController.swift
//  Neobis_iOS_Marketplace
//
//  Created by Фараби Иса on 14.06.2023.
//

import Foundation
import UIKit
import SnapKit

class RegistrationViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Registration view"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Регистрация"
        
        let backButton = UIBarButtonItem(image: UIImage(named: "backButton")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backPressed))
        self.navigationItem.leftBarButtonItem = backButton
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
