//
//  CatalogViewController.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 28.06.2023.
//

import UIKit
import SwiftUI
import SnapKit

class CatalogViewController: UIViewController {
    
    private let viewModel: CatalogViewModel
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    init(viewModel: CatalogViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.setCatalog { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = setupFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CatalogCollectionViewCell.self, forCellWithReuseIdentifier: "CatalogViewCell")
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
        }
    }
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 174, height: 282)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = .init(top: 10, left: 16, bottom: 10, right: 16)
        return layout
    }
}

extension CatalogViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.catalogData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatalogViewCell", for: indexPath) as? CatalogCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configureCatalogCards(model: viewModel.catalogData[indexPath.row])
        
        
        return cell
    }
}
