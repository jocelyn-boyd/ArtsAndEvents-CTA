//
//  AuthenticationViewController.swift
//  ArtsAndEvents-CTA
//
//  Created by Jocelyn Boyd on 3/6/20.
//  Copyright © 2020 Purssuit. All rights reserved.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}