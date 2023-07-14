//
//  CartTableViewCell.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 14.07.2023.
//

import UIKit
import SnapKit
import Kingfisher

class CartTableViewCell: UITableViewCell {
    var model: CatalogData?
    
    let cellImage: UIImageView = build {
        $0.contentMode = .scaleToFill
    }
    let cellTitle: UILabel = build {
        $0.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
    }
    let cellDescription: UILabel = build {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
    }
    let cellPrice: UILabel = build {
        $0.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
    }
    let cellCount: UILabel = build {
        $0.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureCell(model: CatalogData) {
        self.model = model
        let url = URL(string: model.image)
        cellImage.kf.setImage(with: url, placeholder: UIImage(systemName: "rays"))
        cellCount.text = model.quantity
        cellPrice.text = model.price
        cellTitle.text = model.title
        cellDescription.text = model.description
    }
    private func setupCellUI() {
        [cellImage, cellCount, cellPrice, cellTitle, cellDescription].forEach {
            contentView.addSubview($0)
        }
        cellImage.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(10)
            $0.width.height.equalTo(140)
        }
        cellTitle.snp.makeConstraints {
            $0.left.equalTo(cellImage.snp.right).offset(16)
            $0.top.equalToSuperview().offset(25)
        }
        cellDescription.snp.makeConstraints {
            $0.left.equalTo(cellImage.snp.right).offset(16)
            $0.top.equalTo(cellTitle.snp.bottom).offset(6)
        }
        cellPrice.snp.makeConstraints {
            $0.left.equalTo(cellImage.snp.right).offset(16)
            $0.top.equalTo(cellDescription.snp.bottom).offset(10)
        }
        cellCount.snp.makeConstraints {
            $0.left.equalTo(cellPrice.snp.right).offset(16)
            $0.top.equalTo(cellDescription.snp.bottom).offset(10)
        }
    }
}
