//
//  SignUpScreenView.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 14.07.2023.
//

import UIKit
import SnapKit

class SignUpScreenView: UIViewController {
    let emailTextField: UITextField = build {
        $0.placeholder = "Email"
        $0.borderStyle = .none
        $0.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        $0.keyboardType = .emailAddress
        $0.layer.cornerRadius = 4
        $0.borderStyle = .roundedRect
    }
    let passwordTextField: UITextField = build {
        $0.placeholder = "Password"
        $0.borderStyle = .none
        $0.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        $0.layer.cornerRadius = 4
        $0.borderStyle = .roundedRect
    }
    let repeatPassTextField: UITextField = build {
        $0.placeholder = "Repeat password"
        $0.borderStyle = .none
        $0.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        $0.layer.cornerRadius = 4
        $0.borderStyle = .roundedRect
    }
    let button: CustomButton = build {
        $0.setTitle("Sign Up", for: .normal)
        $0.snp.makeConstraints {$0.height.equalTo(54)}
    }
    var selectedTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "New User"
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(backButton))
        self.navigationController?.navigationBar.tintColor = .black
        setupUI()
    }
    
    @objc private func backButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    private func setupUI() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPassTextField.delegate = self
        selectedTextField = emailTextField
        selectedTextField?.layer.borderColor = UIColor.black.cgColor
        selectedTextField?.layer.borderWidth = 0.0
        
        [emailTextField, passwordTextField, repeatPassTextField, button].forEach {
            view.addSubview($0)
        }
        emailTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(52)
            $0.height.equalTo(48)
        }
        passwordTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalTo(emailTextField.snp.bottom).offset(16)
            $0.height.equalTo(48)
        }
        repeatPassTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(16)
            $0.height.equalTo(48)
        }
        button.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-24)
        }
    }
    
}

extension SignUpScreenView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField?.layer.borderWidth = 0.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        selectedTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0.0
    }
}
