//
//  AuthHeaderView.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 15.07.2023.
//

import UIKit
import SnapKit

class AuthHeaderView: UIView {

    //MARK: - UI Components
    let circleImage: UIImageView = build {
        $0.image = UIImage(named: "circleImage")
        $0.layer.masksToBounds = false
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    let titleText: UILabel = build {
        $0.text = "Forgot Password"
        $0.font = UIFont.systemFont(ofSize: 25, weight: .black)
    }
    let subTitleText: UILabel = build {
        $0.text = "Reset your password"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        $0.textColor = .secondaryLabel
    }
    
    //MARK: - Lifecycle
    init(title: String, subTitle: String) {
        super.init(frame: .zero)
        self.titleText.text = title
        self.subTitleText.text = subTitle
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImage.layer.cornerRadius = self.circleImage.frame.width / 2 
    }
    //MARK: - Setup UI
    private func setupUI() {
        [circleImage, titleText, subTitleText].forEach {
            self.addSubview($0)
        }
        circleImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(30)
            $0.height.width.equalTo(120)
        }
        titleText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(circleImage.snp.bottom).offset(15)
        }
        subTitleText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleText.snp.bottom).offset(10)
        }
    }
}
