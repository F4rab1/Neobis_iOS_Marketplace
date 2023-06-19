//
//  PasswordViewController.swift
//  Neobis_iOS_Marketplace
//
//  Created by Фараби Иса on 14.06.2023.
//

import Foundation
import UIKit
import SnapKit

class PasswordViewController: UIViewController {
    
    var username: String?
    var email: String?
    var registrationViewModel: RegistrationViewModelProtocol!
    
    init(userViewModel: RegistrationViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.registrationViewModel = userViewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let minLengthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "Минимальная длина — 8 символов."
        label.isHidden = true
        return label
    }()
    
    private let notEqualLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "Пароли не совпадают."
        label.isHidden = true
        return label
    }()
    
    private let lockImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "lock_image_purple")
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Придумайте пароль"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let descryptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#C0C0C0")
        label.textAlignment = .center
        label.text = "Минимальная длина — 8 символов. \nДля надежности пароль должен \nсодержать буквы и цифры."
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.backgroundColor = .clear
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 24)
        tf.textAlignment = .center
        tf.delegate = tf
        return tf
    }()
    
    private let secondPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.backgroundColor = .clear
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 24)
        tf.textAlignment = .center
        tf.delegate = tf
        return tf
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hexString: "#5458EA")
        button.layer.cornerRadius = 22
        button.setTitle("Готово", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Регистрация"
        
        let backButton = UIBarButtonItem(image: UIImage(named: "backButton")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backPressed))
        
        let visibilityButton: UIButton = {
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: "eye-disable"), for: .normal)
            button.setImage(UIImage(named: "eye"), for: .selected)
            button.addTarget(self, action: #selector(changePasswordVisibility), for: .touchUpInside)
            return button
        }()
        
        let visibilityBarButtonItem = UIBarButtonItem(customView: visibilityButton)
        
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.rightBarButtonItem = visibilityBarButtonItem
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(lockImageView)
        view.addSubview(titleLabel)
        view.addSubview(descryptionLabel)
        view.addSubview(passwordTextField)
        view.addSubview(secondPasswordTextField)
        view.addSubview(signUpButton)
        view.addSubview(minLengthLabel)
        view.addSubview(notEqualLabel)
    }
    
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func changePasswordVisibility(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        secondPasswordTextField.isSecureTextEntry = !secondPasswordTextField.isSecureTextEntry
    }
    
    @objc private func signUpPressed() {
        if passwordTextField.text!.count < 8 {
            notEqualLabel.isHidden = true
            minLengthLabel.isHidden = false
            return
        } else if secondPasswordTextField.text! != passwordTextField.text! {
            minLengthLabel.isHidden = true
            notEqualLabel.isHidden = false
        } else {
            minLengthLabel.isHidden = true
            notEqualLabel.isHidden = true
            
            registrationViewModel.registerUser(username: username!,
                                               email: email!,
                                               password: passwordTextField.text!,
                                               confirmPassword: secondPasswordTextField.text!)
            let vc = ProfileViewController()
            navigationController?.pushViewController(vc, animated: true)
            print("Sign Up > Next")
        }
    }
    
    func setupConstraints() {
        lockImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((UIScreen.main.bounds.height / 812) * 105)
            make.centerX.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(lockImageView.snp.bottom).offset((UIScreen.main.bounds.height / 812) * 8)
            make.centerX.equalToSuperview()
        }
        
        descryptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset((UIScreen.main.bounds.height / 812) * 8)
            make.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(descryptionLabel.snp.bottom).offset((UIScreen.main.bounds.height / 812) * 28)
            make.leading.trailing.equalToSuperview().inset((UIScreen.main.bounds.width / 375) * 20)
            make.height.equalTo(34)
        }
        
        secondPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset((UIScreen.main.bounds.height / 812) * 8)
            make.leading.trailing.equalToSuperview().inset((UIScreen.main.bounds.width / 375) * 20)
            make.height.equalTo(34)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(secondPasswordTextField.snp.bottom).offset((UIScreen.main.bounds.height / 812) * 40)
            make.leading.trailing.equalToSuperview().inset((UIScreen.main.bounds.width / 375) * 20)
            make.height.equalTo(44)
        }
        
        minLengthLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(secondPasswordTextField.snp.bottom).offset(10)
        }
        
        notEqualLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(secondPasswordTextField.snp.bottom).offset(10)
        }
    }
}
