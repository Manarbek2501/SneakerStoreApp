//
//  CatalogCardsView.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 28.06.2023.
//

import UIKit
import SnapKit
import Kingfisher

class CatalogCardsView: UIView {
    
    let image: UIImageView = build {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 12
    }
    let title: UILabel = build {
        $0.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
    }
    let descriptionOfCatalog: UILabel = build {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
    }
    let price: UILabel = build {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    }
    let containerView: UIView = build {
        $0.backgroundColor = .white
    }
    
    var model: CatalogData?
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureCatalogCards(model: CatalogData) {
        self.model = model
        let url = URL(string: model.image)
        image.kf.setImage(with: url, placeholder: UIImage(systemName: "rays"))
        title.text = model.title
        descriptionOfCatalog.text = model.description
        price.text = model.price
    }
    
    private func setupUI() {
        [title, image, descriptionOfCatalog, price].forEach {
            containerView.addSubview($0)
        }
        addSubview(containerView)
        
        containerView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        image.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(4)
            $0.right.equalToSuperview().offset(-4)
            $0.height.equalTo(166)
            $0.width.equalTo(166)
        }
        title.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).offset(2)
            $0.left.equalToSuperview().offset(4)
            $0.right.equalToSuperview()
        }
        descriptionOfCatalog.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(2)
            $0.left.equalToSuperview().offset(4)
            $0.right.equalToSuperview()
        }
        price.snp.makeConstraints {
            $0.top.equalTo(descriptionOfCatalog.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(4)
            $0.right.equalToSuperview()
        }
    }
}
