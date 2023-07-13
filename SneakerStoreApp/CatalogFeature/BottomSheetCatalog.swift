//
//  BottomSheetCatalog.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 04.07.2023.
//

import SnapKit
import UIKit
import Kingfisher

class BottomSheetCatalog: UIViewController {
    var model: CatalogData? {
        didSet {
            setData()
        }
    }
    
    let bottomImage: UIImageView = build {
        $0.layer.cornerRadius = 16
    }
    let sheetPrice: UILabel = build {
        $0.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    }
    let sheetDescription: UILabel = build {
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        $0.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
    }
    let sheetTitle: UILabel = build {
        $0.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
    }
    
    let stepper: UIStepper = build {
        $0.value = 0
        $0.minimumValue = 0
        $0.maximumValue = 7
        $0.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
    }
    let stepperValue: UILabel = build {
        $0.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    @objc func stepperValueChanged(_ sender:UIStepper!) {
        stepperValue.text = "\(Int(sender.value))"
    }
    
    private func setData() {
        guard let model = model else {return}
        let url = URL(string: model.image)
        bottomImage.kf.setImage(with: url, placeholder: UIImage(systemName: "rays"))
        sheetTitle.text = model.title
        sheetDescription.text = model.description
        sheetPrice.text = "$\(model.price)"
        stepperValue.text = model.item
    }
    private func setupUI() {
        [bottomImage, sheetPrice, sheetTitle, sheetDescription, stepper, stepperValue].forEach {
            view.addSubview($0)
        }
        sheetTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.centerX.equalToSuperview()
        }
        bottomImage.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.top.equalTo(sheetTitle.snp.bottom).offset(30)
            $0.height.width.equalTo(200)
        }
        sheetPrice.snp.makeConstraints {
            $0.left.equalTo(bottomImage.snp.right).offset(10)
            $0.top.equalTo(sheetTitle.snp.bottom).offset(50)
        }
        sheetDescription.snp.makeConstraints {
            $0.left.equalTo(bottomImage.snp.right).offset(10)
            $0.top.equalTo(sheetPrice.snp.bottom).offset(10)
        }
        stepper.snp.makeConstraints {
            $0.left.equalTo(bottomImage.snp.right).offset(10)
            $0.top.equalTo(sheetDescription.snp.bottom).offset(25)
        }
        stepperValue.snp.makeConstraints {
            $0.left.equalTo(stepper.snp.right).offset(20)
            $0.top.equalTo(sheetDescription.snp.bottom).offset(27)
        }
    }
}
