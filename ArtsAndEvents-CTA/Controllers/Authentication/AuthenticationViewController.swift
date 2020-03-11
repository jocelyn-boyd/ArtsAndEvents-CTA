//
//  AuthenticationViewController.swift
//  ArtsAndEvents-CTA
//
//  Created by Jocelyn Boyd on 3/6/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class AuthenticationViewController: UINavigationController {

  static func storyboardInstance() -> LoginViewController? {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  return storyboard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
