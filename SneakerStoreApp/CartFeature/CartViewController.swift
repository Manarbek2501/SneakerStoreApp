//
//  CartViewController.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 28.06.2023.
//

import UIKit
import SnapKit

class CartViewController: UIViewController {
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        configureTableView()
    }
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: "CartCell")
        setupUI()
    }
    private func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.left.equalTo(view.snp.left)
            $0.top.equalTo(view.snp.top)
            $0.right.equalTo(view.snp.right)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartTableViewCell
        
        return cell
    }
    
}
