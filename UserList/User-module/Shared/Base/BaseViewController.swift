//
//  BaseViewController.swift
//  UserList
//
//  Created by Apple on 4/7/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
  
  var context: RouteContext?
    override func viewDidLoad() {
        super.viewDidLoad()
      initInteractor(with: context)

        // Do any additional setup after loading the view.
    }
  
  func initInteractor(with context: RouteContext?) {
    fatalError("Subclasses must implement initInteractor()")
  }
  func showLoading() {
    
  }
  
  func hideLoading() {
    
  }

   
}
