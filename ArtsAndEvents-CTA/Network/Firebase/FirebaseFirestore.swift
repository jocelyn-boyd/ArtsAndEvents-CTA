//
//  FirebaseFirestore.swift
//  ArtsAndEvents-CTA
//
//  Created by Jocelyn Boyd on 3/6/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation
import FirebaseFirestore

fileprivate enum FirestoreCollections: String {
  case user
}

class FirebaseFirestore {
  
  static let manager = FirebaseFirestore()
  private let database = Firestore.firestore()
  
  func createAppUser(user: AppUser, completion: @escaping (Result<(),Error>) -> ()) {
    let  fields = user.fieldsDict
    
    database.collection(FirestoreCollections.user.rawValue).document(user.uid).setData(fields) { (error) in
      if let error = error {
        completion(.failure(error))
//        print(error)
      }
      completion(.success(()))
    }
  }
  
}


