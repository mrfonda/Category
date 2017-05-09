//
//  ViewController.swift
//  CategoryQC
//
//  Created by Vladislav Dorfman on 09/05/2017.
//  Copyright © 2017 Vladislav Dorfman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
  @IBOutlet weak var menu: CategoryButtonView!
 
  @IBAction func toCategory(_ sender: UIButton) {
    menu.state = .category
  }
  @IBAction func toUp(_ sender: UIButton) {
    menu.state = .upArrow
  }
  @IBAction func toLeft(_ sender: UIButton) {
    menu.state = .leftArrow
  }
  @IBAction func toRight(_ sender: UIButton) {
    menu.state = .rightArrow
  }
  
  @IBAction func toDown(_ sender: UIButton) {
    menu.state = .downArrow
  }

}

