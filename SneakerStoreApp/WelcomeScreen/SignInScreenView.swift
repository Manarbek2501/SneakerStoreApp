//
//  SignInScreenView.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 15.07.2023.
//

import UIKit
import SnapKit

class SignInScreenView: UIViewController {
    //MARK: - UI Components
    private let headerView = AuthHeaderView(title: "Sign In", subTitle: "Sign in to your account")
    private let emailTextField = CustomTextField(fieldType: .email)
    private let passTextField = CustomTextField(fieldType: .password)
    
    let button = CustomButton(title: "Sign In", fontSize: .medium)
    
    let forgotPassText: UILabel = build {
        $0.text = "Forgot Password?"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        $0.textColor = .black
        $0.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
    }
    var selectedTextField: UITextField?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Welcome back!"
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(backButton))
        self.navigationController?.navigationBar.tintColor = .black
        setupUI()
        handleLabelTap()
    }
    
    //MARK: - SetupUI
    
    private func setupUI() {
        emailTextField.delegate = self
        passTextField.delegate = self
        selectedTextField = emailTextField
        selectedTextField?.layer.borderColor = UIColor.black.cgColor
        selectedTextField?.layer.borderWidth = 0.0
        
        [headerView, emailTextField, passTextField, button, forgotPassText].forEach {
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
        forgotPassText.snp.makeConstraints {
            $0.top.equalTo(passTextField.snp.bottom).offset(10)
            $0.right.equalToSuperview().offset(-16)
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
    private func handleLabelTap() {
        let labelTapped = UITapGestureRecognizer(target: self, action: #selector(labelIsTapped))
        self.forgotPassText.isUserInteractionEnabled = true
        self.forgotPassText.addGestureRecognizer(labelTapped)
    }
    
    @objc private func labelIsTapped() {
        let vc = ForgotPassScreenView()
        navigationController?.present(vc, animated: true)
    }
}

    //MARK: - Extension

extension SignInScreenView: UITextFieldDelegate {
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
