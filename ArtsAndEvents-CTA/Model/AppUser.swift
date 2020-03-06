//
//  AppUser.swift
//  ArtsAndEvents-CTA
//
//  Created by Jocelyn Boyd on 3/6/20.
//  Copyright © 2020 Purssuit. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

struct AppUser {
  
  //MARK: Variables and Properties
  let email: String?
  let uid: String
  let userExperience: String? //-> TicketmasterAPI or RijksmuseumAPI
  
  //MARK: Initialization
  init(init user:User, userExperience: String) {
    self.email = user.email
    self.uid = user.uid
    self.userExperience = userExperience
  }
  
  init?(from dict: [String:Any], userID: String) {
    guard let email = dict["email"] as? String,
    let userExperience = dict["userExperience"] as? String else {return nil}
    
    self.email = email
    self.uid = userID
    self.userExperience = userExperience
  }
  
}
