//
//  MainTabViewController.swift
//  ArtsAndEvents-CTA
//
//  Created by Jocelyn Boyd on 3/6/20.
//  Copyright © 2020 Purssuit. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

  lazy var mainExperienceVC = UINavigationController(rootViewController: MainExperienceViewController())
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .white
      setupTabItems()
        // Do any additional setup after loading the view.
    }
    
  private func setupTabItems() {
    mainExperienceVC.tabBarItem = UITabBarItem(title: "List", image: UIImage(systemName: "list.bullet"), tag: 0)
    
    self.viewControllers = [mainExperienceVC]
  }

}
