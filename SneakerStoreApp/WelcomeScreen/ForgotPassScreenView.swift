//
//  ForgotPassScreenView.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 15.07.2023.
//

import UIKit
import SnapKit

class ForgotPassScreenView: UIViewController {
    
    let circleImage: UIImageView = build {
        $0.image = UIImage(named: "circleImage")
        $0.layer.masksToBounds = false
        $0.clipsToBounds = true
    }
    let titleText: UILabel = build {
        $0.text = "Forgot Password"
        $0.font = UIFont.systemFont(ofSize: 25, weight: .black)
    }
    let underTitleText: UILabel = build {
        $0.text = "Reset your password"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        $0.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
    }
    
    let resetTextField: UITextField = build {
        $0.placeholder = "Email address"
        $0.borderStyle = .none
        $0.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        $0.keyboardType = .emailAddress
        $0.layer.cornerRadius = 4
        $0.borderStyle = .roundedRect
    }
    let button: CustomButton = build {
        $0.setTitle("Sign Up", for: .normal)
        $0.layer.cornerRadius = 10
        $0.snp.makeConstraints {$0.height.equalTo(54)}
    }
    var selectedTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        circleImage.layer.cornerRadius = self.circleImage.frame.width / 2
    }
    
    private func setupUI() {
        resetTextField.delegate = self
        selectedTextField = resetTextField
        selectedTextField?.layer.borderColor = UIColor.black.cgColor
        selectedTextField?.layer.borderWidth = 0.0
        [circleImage, titleText, underTitleText, resetTextField, button].forEach {
            view.addSubview($0)
        }
        circleImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
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
        resetTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalTo(underTitleText.snp.bottom).offset(25)
            $0.height.equalTo(48)
        }
        button.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalTo(resetTextField.snp.bottom).offset(24)
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
