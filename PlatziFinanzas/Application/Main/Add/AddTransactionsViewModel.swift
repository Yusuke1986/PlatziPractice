//
//  AddTransactionsViewModel.swift
//  PlatziFinanzas
//
//  Created by 松岡裕介 on 2019/04/10.
//  Copyright © 2019 Platzi. All rights reserved.
//

import Foundation
import FirebaseFirestore
import PlatziFinanzasCore
import FirebaseAuth

class AddTransactionsViewModel: NSObject {
    private var db: Firestore {
        return Firestore.firestore()
    }
    
    func add(name: String, descrption: String, value: String) {
        guard let value = Float(value) else {
            return
        }
        
        //(28) Asegurando
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        //
        
        
        let transaction = PlatziFinanzasCore.Transaction(
            value: value,
            category: .expend,
            name: name,
            date: Date())
        
        guard var data = transaction.data() else {
            return
        }
        
        //(28) Asegurando
        data["ownerId"] = uid
        //
        
        db.collection("transactions").addDocument(data: data) { (error) in
            print(error?.localizedDescription ?? "Object added")
            NotificationCenter.default.post(name: Notification.Name("AddedNewData"), object: nil)
        }
    }

}
