//
//  LoginViewController.swift
//  Neobis_iOS_Marketplace
//
//  Created by Фараби Иса on 13.06.2023.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
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
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor(hexString: "#C7C7C8")
        lineView.translatesAutoresizingMaskIntoConstraints = false
        tf.addSubview(lineView)
        lineView.leadingAnchor.constraint(equalTo: tf.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: tf.trailingAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: tf.bottomAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        tf.placeholder = "Имя пользователя"
        tf.delegate = tf
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.backgroundColor = .clear
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor(hexString: "#C7C7C8")
        lineView.translatesAutoresizingMaskIntoConstraints = false
        tf.addSubview(lineView)
        lineView.leadingAnchor.constraint(equalTo: tf.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: tf.trailingAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: tf.bottomAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        tf.placeholder = "Пароль"
        tf.delegate = tf
        return tf
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hexString: "#C0C0C0")
        button.layer.cornerRadius = 22
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor(hexString: "#5458EA"), for: .normal)
        button.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        view.addSubview(logoTitleLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
    }
    
    @objc private func signInPressed() {
//        let vc = HomeViewController()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true, completion: nil)
        print("Sign In")
    }
    
    @objc private func signUpPressed() {
        let vc = RegistrationViewController()
        navigationController?.pushViewController(vc, animated: true)
        print("Sign Up")
    }
    
    func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((UIScreen.main.bounds.height / 812) * 60)
            make.trailing.equalTo(view.snp.centerX).offset((UIScreen.main.bounds.width / 375) * 25)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        logoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset((UIScreen.main.bounds.height / 812) * 8)
            make.centerX.equalToSuperview()
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(logoTitleLabel.snp.bottom).offset((UIScreen.main.bounds.height / 812) * 120)
            make.leading.trailing.equalToSuperview().inset((UIScreen.main.bounds.width / 375) * 20)
            make.height.equalTo(35)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset((UIScreen.main.bounds.height / 812) * 50)
            make.leading.trailing.equalToSuperview().inset((UIScreen.main.bounds.width / 375) * 20)
            make.height.equalTo(35)
        }
        
        signInButton.snp.makeConstraints { make in
            make.bottom.equalTo(signUpButton.snp.top).offset((UIScreen.main.bounds.height / 812) * -183)
            make.leading.trailing.equalToSuperview().inset((UIScreen.main.bounds.width / 375) * 20)
            make.height.equalTo(44)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset((UIScreen.main.bounds.height / 812) * 44)
            make.leading.trailing.equalToSuperview().inset((UIScreen.main.bounds.width / 375) * 20)
            make.height.equalTo(44)
        }
    }
}

extension UITextField: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        movePlaceholder(for: textField)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if textField.text == "" {
            print("Typed text: Is Empty")
        } else {
            if let typedText = textField.text {
                print("Typed text: \(typedText)")
            }
        }
        
        return true
    }
    
    private func movePlaceholder(for textField: UITextField) {
        
        let placeholderText = textField.placeholder ?? ""
        textField.placeholder = ""
        
        let placeholderLabel = UILabel()
        placeholderLabel.text = placeholderText
        placeholderLabel.font = UIFont.systemFont(ofSize: 12)
        placeholderLabel.textColor = UIColor.gray
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addSubview(placeholderLabel)
        placeholderLabel.topAnchor.constraint(equalTo: textField.topAnchor, constant: -10).isActive = true
        placeholderLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
        placeholderLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
        
        UIView.animate(withDuration: 0.3) {
            placeholderLabel.alpha = 1
        }
    }
}
