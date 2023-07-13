//
//  CatalogCollectionViewCell.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 01.07.2023.
//

import UIKit
import Kingfisher
import SnapKit

class CatalogCollectionViewCell: UICollectionViewCell {
    var buttonAction: ((CatalogData) -> Void)?
    var model: CatalogData?
    
    let image: UIImageView = build {
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
    let button: UIButton = build {
        $0.tintColor = .white
        $0.setTitle("Add to cart", for: .normal)
        $0.setTitle("Remove", for: .selected)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 18
        $0.addTarget(self, action: #selector(getTapped), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setAction()
    }
    override func layoutSubviews() {
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
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
        price.text = "$\(model.price)"
    }
    @objc func getTapped() {
        setAction()
    }
    func setAction() {
        guard let model = model else {return}
        buttonAction?(model)
    }
    private func setupUI() {
        [title, image, descriptionOfCatalog, price, button].forEach {
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
            $0.top.equalToSuperview().offset(4)
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
        button.snp.makeConstraints {
            $0.top.equalTo(price.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(4)
            $0.right.equalToSuperview().offset(-4)
            $0.height.equalTo(36)
        }
    }
}
