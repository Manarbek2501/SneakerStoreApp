//
//  CatalogModal.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 28.06.2023.
//

import Foundation


struct CatalogData: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var image: String
    var price: String
    var item: String
    var quantity: String
}

extension CatalogData {
    func cartModel() {}
}
