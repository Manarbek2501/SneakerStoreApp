//
//  CustomButton.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 14.07.2023.
//

import UIKit

class CustomButton: UIButton {
    
    enum FontSize {
        case big, medium, small
    }
    
    init(title: String, hasBackground: Bool = false, fontSize: FontSize) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = hasBackground ? .black : .clear
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        let titleColor: UIColor = hasBackground ? .white : .black
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        case .medium:
            self.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
