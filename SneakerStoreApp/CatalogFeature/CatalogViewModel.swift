//
//  CatalogViewModel.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 01.07.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class CatalogViewModel {
    
    var catalogData = [CatalogData]()
    
    init() {
    }
    
    func setCatalog(completion: @escaping () -> Void) {
           let db = Firestore.firestore()
           
           db.collection("catalog").getDocuments { snapShot, error in
               if let error = error {
                   print(error.localizedDescription)
                   return
               }
               
               guard let documents = snapShot?.documents else {
                   completion()
                   return
               }
               
               self.catalogData = documents.compactMap { document in
                   guard
                       let title = document.get("title") as? String,
                       let description = document.get("description") as? String,
                       let price = document.get("price") as? String,
                       let image = document.get("image") as? String,
                       let item = document.get("item") as? String
                   else {
                       return nil
                   }
                   
                   return CatalogData(title: title, description: description, image: image, price: price, item: item)
               }
               
               completion()
           }
       }
}
