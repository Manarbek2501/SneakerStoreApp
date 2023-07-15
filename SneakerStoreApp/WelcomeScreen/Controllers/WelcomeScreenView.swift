//
//  WelcomeScreenView.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 14.07.2023.
//

import UIKit
import SnapKit

class WelcomeScreenView: UIViewController {
    
    //MARK: - UI Components
    
    let image: UIImageView = build {
        $0.contentMode = .scaleToFill
        $0.image = UIImage(named: "welcomePage")
        $0.clipsToBounds = true
    }
    let mainText: UILabel = build {
        $0.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.text = "Welcome to the biggest sneakers store app"
    }
    
    let button = CustomButton(title: "Sign Up",hasBackground: true, fontSize: .big)
    let signInText = CustomButton(title: "I already have an account", fontSize: .medium)
    
    //MARK: - UI Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        setupUI()
        setupLabelTap()
    }
    
    
    //MARK: - Setup UI
    
    private func setupUI() {
        [image, mainText, button, signInText].forEach {
            view.addSubview($0)
        }
        image.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
        }
        mainText.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).offset(18)
            $0.left.right.equalToSuperview().inset(16)
        }
        button.snp.makeConstraints {
            $0.top.equalTo(mainText.snp.bottom).offset(24)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        signInText.snp.makeConstraints {
            $0.top.equalTo(button.snp.bottom).offset(24)
            $0.left.right.equalToSuperview().inset(16)
        }

    }
    
    //MARK: - Selector
    
    @objc private func signUpAction() {
        let vc = SignUpScreenView()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupLabelTap() {
        let labelTapped = UITapGestureRecognizer(target: self, action: #selector(labelIsTapped))
        self.signInText.isUserInteractionEnabled = true
        self.signInText.addGestureRecognizer(labelTapped)
    }
    
    @objc private func labelIsTapped() {
        let vc = SignInScreenView()
        navigationController?.pushViewController(vc, animated: true)
    }
     
}
