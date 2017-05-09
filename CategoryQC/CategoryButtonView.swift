//
//  CategoryButtonView.swift
//  CategoryQC
//
//  Created by Vladislav Dorfman on 09/05/2017.
//  Copyright © 2017 Vladislav Dorfman. All rights reserved.
//

import UIKit

class CategoryButtonView: UIView {
  
  
  let categoryView = CategoryView()
  
  
  enum States : Int {
    case category = 0
    case leftArrow = 1
    case downArrow = 2
    case rightArrow = 3
    case upArrow = 4
    static func randomState() -> States {
      return States(rawValue: Int(arc4random_uniform(UInt32(States.upArrow.rawValue))))!
    }
  }
  
  open var state : States = .category {
    willSet {
      switch state {
      case .category:
        switch newValue {
        case .leftArrow:
          categoryView.addCategoryToLeftArrowAnimation()
        case .rightArrow:
          categoryView.addCategoryToRightArrowAnimation()
        case .upArrow:
          categoryView.addCategoryToUpArrowAnimation()
        case .downArrow:
          categoryView.addCategoryToDownArrowAnimation()
        default: return
        }
      case .leftArrow:
        switch newValue {
        case .category:
          categoryView.addCategoryToLeftArrowAnimation(reverseAnimation:  true)
        case .rightArrow:
          categoryView.addLeftArrowToRightArrowAnimation()
        case .upArrow:
          categoryView.addLeftArrowToUpArrowAnimation()
        case .downArrow:
          categoryView.addLeftArrowToDownArrowAnimation()
        default: return
        }
      case .rightArrow:
        switch newValue {
        case .category:
          categoryView.addCategoryToRightArrowAnimation(reverseAnimation:  true)
        case .leftArrow:
          categoryView.addLeftArrowToRightArrowAnimation(reverseAnimation: true)
        case .upArrow:
          categoryView.addRightArrowToUpArrowAnimation()
        case .downArrow:
          categoryView.addDownArrowToRightArrowAnimation(reverseAnimation: true)
        default: return
        }
      case .upArrow:
        switch newValue {
        case .category:
          categoryView.addCategoryToUpArrowAnimation(reverseAnimation: true)
        case .leftArrow:
          categoryView.addLeftArrowToUpArrowAnimation(reverseAnimation: true)
        case .rightArrow:
          categoryView.addRightArrowToUpArrowAnimation(reverseAnimation: true)
        case .downArrow:
          categoryView.addUpArrowToDownArrowAnimation()
        default: return
        }
      case .downArrow:
        switch newValue {
        case .category:
          categoryView.addCategoryToDownArrowAnimation(reverseAnimation: true)
        case .leftArrow:
          categoryView.addLeftArrowToDownArrowAnimation(reverseAnimation: true)
        case .rightArrow:
          categoryView.addDownArrowToRightArrowAnimation()
        case .upArrow:
          categoryView.addUpArrowToDownArrowAnimation(reverseAnimation: true)
        case .downArrow: return
        default: return
        }
      }
      print(state, "->", newValue)
    }
    
  }
  
  override func draw(_ rect: CGRect) {
    addSubview(categoryView)
    categoryView.bindFrameToSuperviewBounds()
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    categoryView.addTouchedAnimation()
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    categoryView.addTouchedAnimation(reverseAnimation: true)
    state = States.randomState()
  }
}

extension UIView {
  
  func bindFrameToSuperviewBounds() {
    guard let superview = self.superview else {
      print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
      return
    }
    
    self.translatesAutoresizingMaskIntoConstraints = false
    superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
  }
}
