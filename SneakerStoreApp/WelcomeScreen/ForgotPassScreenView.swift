//
//  ForgotPassScreenView.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 15.07.2023.
//

import UIKit
import SnapKit

class ForgotPassScreenView: UIViewController {
    //MARK: - UI Components
    private let headerView = AuthHeaderView(title: "Forgot Password", subTitle: "Reset your password")
    
    private let resetTextField = CustomTextField(fieldType: .email)

    let button = CustomButton(title: "Sign Up", fontSize: .medium)
    
    var selectedTextField: UITextField?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    //MARK: - SetupUI
    private func setupUI() {
        resetTextField.delegate = self
        selectedTextField = resetTextField
        selectedTextField?.layer.borderColor = UIColor.black.cgColor
        selectedTextField?.layer.borderWidth = 0.0
        [headerView, resetTextField, button].forEach {
            view.addSubview($0)
        }
        headerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(222)
        }
        resetTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(headerView.snp.bottom).offset(12)
            $0.height.equalTo(48)
            $0.width.equalToSuperview().multipliedBy(0.92)
        }
        button.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalTo(resetTextField.snp.bottom).offset(24)
            $0.height.equalTo(54)
        }
    }
}

extension ForgotPassScreenView: UITextFieldDelegate {
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
