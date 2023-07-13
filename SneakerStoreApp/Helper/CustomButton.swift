//
//  CustomButton.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 14.07.2023.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupButton() {
        self.tintColor = .white
        self.backgroundColor = .black
        self.layer.cornerRadius = 18
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
}
