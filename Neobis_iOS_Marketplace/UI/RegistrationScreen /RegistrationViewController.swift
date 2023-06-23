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
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "shopping-cart 1")
        return iv
    }()
    
    private let logoTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "MOBI MARKET"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.backgroundColor = .clear
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.placeholder = "Имя пользователя"
        tf.delegate = tf
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor(hexString: "#C7C7C8")
        lineView.translatesAutoresizingMaskIntoConstraints = false
        tf.addSubview(lineView)
        lineView.leadingAnchor.constraint(equalTo: tf.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: tf.trailingAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: tf.bottomAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return tf
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.backgroundColor = .clear
        tf.placeholder = "Почта"
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.delegate = tf
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor(hexString: "#C7C7C8")
        lineView.translatesAutoresizingMaskIntoConstraints = false
        tf.addSubview(lineView)
        lineView.leadingAnchor.constraint(equalTo: tf.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: tf.trailingAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: tf.bottomAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return tf
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hexString: "#C0C0C0")
        button.layer.cornerRadius = 22
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    private let redLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        view.addSubview(logoImageView)
        view.addSubview(logoTitleLabel)
        view.addSubview(usernameTextField)
        view.addSubview(emailTextField)
        view.addSubview(signUpButton)
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func signUpPressed() {
        if usernameTextField.text!.isEmpty {
            usernameTextField.addSubview(redLine)
            redLine.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor).isActive = true
            redLine.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor).isActive = true
            redLine.bottomAnchor.constraint(equalTo: usernameTextField.bottomAnchor).isActive = true
            redLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
            return
        } else if emailTextField.text!.isEmpty {
            emailTextField.addSubview(redLine)
            redLine.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
            redLine.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
            redLine.bottomAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
            redLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
            return
        } else {
            usernameTextField.subviews.forEach { subview in
                if subview.backgroundColor == UIColor.red {
                    subview.removeFromSuperview()
                }
            }
            
            emailTextField.subviews.forEach { subview in
                if subview.backgroundColor == UIColor.red {
                    subview.removeFromSuperview()
                }
            }
        }
        
        let vm = PasswordViewModel()
        let vc = PasswordViewController(viewModel: vm)
        vc.username = usernameTextField.text
        vc.email = emailTextField.text
        navigationController?.pushViewController(vc, animated: true)
        print("Sign Up > password")
    }
    
    func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(computedHeight(112))
            make.trailing.equalTo(view.snp.centerX).offset(computedWidth(25))
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        logoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(computedHeight(8))
            make.centerX.equalToSuperview()
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(logoTitleLabel.snp.bottom).offset(computedHeight(68))
            make.leading.trailing.equalToSuperview().inset(computedWidth(20))
            make.height.equalTo(35)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(computedHeight(50))
            make.leading.trailing.equalToSuperview().inset(computedWidth(20))
            make.height.equalTo(35)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(computedHeight(50))
            make.leading.trailing.equalToSuperview().inset(computedWidth(20))
            make.height.equalTo(44)
        }
    }
}
