//
//  CatalogAPI.swift
//  SneakerStoreApp
//
//  Created by Manarbek Bibit on 28.06.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class FetchingCatalogAPI {
    static var shared = FetchingCatalogAPI()
    
    var catalogData = [CatalogData]()
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("catalog").getDocuments { snapShot, error in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            guard let data = snapShot?.documents else {return}
            for catalogCarts in data {
                let id = catalogCarts.documentID
                let title = catalogCarts.get("title") as! String
                let description = catalogCarts.get("description") as! String
                let price = catalogCarts.get("price") as! String
                let image = catalogCarts.get("image") as! String
                let item = catalogCarts.get("item") as! String
                
                self.catalogData.append(CatalogData(title: title, description: description, image: image, price: price, item: item))
            }
        }
    }
}
 
