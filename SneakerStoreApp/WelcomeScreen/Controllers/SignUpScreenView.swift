//
//  SignUpScreenView.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 14.07.2023.
//

import UIKit
import SnapKit

class SignUpScreenView: UIViewController {
    
    //MARK: - UI Components
    
    private let headerView = AuthHeaderView(title: "Sign Up", subTitle: "Create your account")
    private let emailTextField = CustomTextField(fieldType: .email)
    private let passTextField = CustomTextField(fieldType: .password)
    private let repeatPassTextField = CustomTextField(fieldType: .repeatPassword)
    
    let button = CustomButton(title: "Sign Up",hasBackground: true, fontSize: .medium)
    
    var selectedTextField: UITextField?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "New User"
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(backButton))
        self.navigationController?.navigationBar.tintColor = .black
        setupUI()
        button.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
    }
    
    
    //MARK: - SetupUI
    
    private func setupUI() {
        emailTextField.delegate = self
        passTextField.delegate = self
        repeatPassTextField.delegate = self
        selectedTextField = emailTextField
        selectedTextField?.layer.borderColor = UIColor.black.cgColor
        selectedTextField?.layer.borderWidth = 0.0
        
        [headerView ,emailTextField, passTextField, repeatPassTextField, button].forEach {
            view.addSubview($0)
        }
        headerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(222)
        }
        emailTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(headerView.snp.bottom).offset(12)
            $0.height.equalTo(48)
            $0.width.equalToSuperview().multipliedBy(0.92)
        }
        passTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailTextField.snp.bottom).offset(12)
            $0.height.equalTo(48)
            $0.width.equalToSuperview().multipliedBy(0.92)
        }
        repeatPassTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passTextField.snp.bottom).offset(12)
            $0.height.equalTo(48)
            $0.width.equalToSuperview().multipliedBy(0.92)
        }
        button.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-24)
            $0.height.equalTo(54)
        }
    }
    
    //MARK: - Selector
    
    @objc private func backButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapSignUp() {
        print("Sign up button is tapped")
    }
}

    //MARK: - Extension

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
