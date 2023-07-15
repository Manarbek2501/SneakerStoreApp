//
//  SignInScreenView.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 15.07.2023.
//

import UIKit
import SnapKit

class SignInScreenView: UIViewController {
    let circleImage: UIImageView = build {
        $0.image = UIImage(named: "circleImage")
        $0.layer.masksToBounds = false
        $0.clipsToBounds = true
    }
    let titleText: UILabel = build {
        $0.text = "Sign In"
        $0.font = UIFont.systemFont(ofSize: 25, weight: .black)
    }
    let underTitleText: UILabel = build {
        $0.text = "Sign in to your account"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        $0.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
    }
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
        $0.isSecureTextEntry = true
    }
    let button: CustomButton = build {
        $0.setTitle("Sign In", for: .normal)
        $0.snp.makeConstraints {$0.height.equalTo(54)}
    }
    let forgotPassText: UILabel = build {
        $0.text = "Forgot Password?"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        $0.textColor = .black
        $0.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
    }
    var selectedTextField: UITextField?
    
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
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        circleImage.layer.cornerRadius = self.circleImage.frame.width / 2
    }
    
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
    private func setupUI() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        selectedTextField = emailTextField
        selectedTextField?.layer.borderColor = UIColor.black.cgColor
        selectedTextField?.layer.borderWidth = 0.0
        
        [emailTextField, passwordTextField, button, circleImage, titleText, underTitleText, forgotPassText].forEach {
            view.addSubview($0)
        }
        circleImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.height.width.equalTo(120)
        }
        titleText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(circleImage.snp.bottom).offset(15)
        }
        underTitleText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleText.snp.bottom).offset(10)
        }
        emailTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalTo(underTitleText.snp.bottom).offset(25)
            $0.height.equalTo(48)
        }
        passwordTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalTo(emailTextField.snp.bottom).offset(16)
            $0.height.equalTo(48)
        }
        forgotPassText.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.right.equalToSuperview().offset(-16)
        }
        button.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-24)
        }
    }
}

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
