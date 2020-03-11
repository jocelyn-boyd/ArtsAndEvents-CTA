//
//  FirebaseAuth.swift
//  ArtsAndEvents-CTA
//
//  Created by Jocelyn Boyd on 3/6/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseAuthService {
  
  static let manager = FirebaseAuthService()
  private let auth = Auth.auth()
  
  var currentUser: User? { return auth.currentUser }
  
  
  func createNewUser(email: String, password: String, completion: @escaping (Result<User,Error>) -> ()) {
    auth.createUser(withEmail: email, password: password) { (result, error) in
      if let createdNewUser = result?.user {
        completion(.success(createdNewUser))
      } else if let error = error {
        completion(.failure(error))
      }
    }
  }
 
  //TODO: login User
  
  func signOutCurrentUser() throws {
    try auth.signOut()
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
      let sceneDelegate = windowScene.delegate as? SceneDelegate,
      let window = sceneDelegate.window else {return}
    
      window.rootViewController = AuthenticationViewController.storyboardInstance()
  }
  private init() {}
}
