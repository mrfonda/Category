//
//  CategoryButtonView.swift
//  CategoryQC
//
//  Created by Vladislav Dorfman on 09/05/2017.
//  Copyright © 2017 Vladislav Dorfman. All rights reserved.
//

import UIKit

protocol CategoryMenuDelegate {
    func categoryViewDidTapped(menuState: CategoryButtonView.MenuStates) -> CategoryButtonView.MenuStates
}

class CategoryButtonView: UIView {
    
    public var is3DEnabled = false
    
    var categoryView = CategoryView()
    let menuButton = UIButton()
    var heightConstraint : NSLayoutConstraint?
    var widthConstraint : NSLayoutConstraint?
    
    override var tintColor: UIColor! {
        didSet {
            categoryView.categoryTintColor = tintColor
            categoryView.resetLayerProperties(forLayerIdentifiers: nil)
        
        }
    }
    var categoryMenuDelegate : CategoryMenuDelegate?
    
    public enum MenuStates : Int {
        case category = 0
        case leftArrow = 1
        case downArrow = 2
        case rightArrow = 3
        case upArrow = 4
        static func randomState() -> MenuStates {
            return MenuStates(rawValue: Int(arc4random_uniform(UInt32(MenuStates.upArrow.rawValue))))!
        }
    }
    
    open var menuState : MenuStates = .category {
        willSet {
            switch menuState {
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
                    if is3DEnabled
                    {
                        categoryView.addLeftArrowToRightArrow3DAnimation()
                    } else {
                        categoryView.addLeftArrowToRightArrowAnimation()
                    }
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
                    if is3DEnabled
                    {
                        categoryView.addLeftArrowToRightArrow3DAnimation(reverseAnimation: true)
                        
                    } else {
                        categoryView.addLeftArrowToRightArrowAnimation(reverseAnimation: true)
                    }
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
                    if is3DEnabled
                    {
                        categoryView.addUpArrowToDownArrow3DAnimation()
                        
                    } else {
                        categoryView.addUpArrowToDownArrowAnimation()
                    }
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
                    if is3DEnabled
                    {
                        categoryView.addUpArrowToDownArrow3DAnimation(reverseAnimation: true)
                        
                    } else {
                        categoryView.addUpArrowToDownArrowAnimation(reverseAnimation: true)
                    }
                case .downArrow: return
                    // default: return
                }
            }
            print(menuState, "->", newValue)
        }
        
    }
    
    //MARK: - LifeCycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        menuButton.addTarget(self, action: #selector(buttonTapped), for: UIControlEvents.touchUpInside)
        menuButton.addTarget(self, action: #selector(buttonPressed), for: UIControlEvents.touchDown)
        menuButton.addTarget(self, action: #selector(buttonReleased), for: UIControlEvents.touchUpOutside)
        categoryView.categoryTintColor = tintColor
    }
    
    public convenience init(frame: CGRect, tintColor: UIColor, backgroundColor: UIColor){
        self.init(frame: frame) // calls the initializer above
        self.backgroundColor = backgroundColor
        self.categoryView = CategoryView(frame: frame)
        self.tintColor = tintColor
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        menuButton.addTarget(self, action: #selector(buttonTapped), for: UIControlEvents.touchUpInside)
        menuButton.addTarget(self, action: #selector(buttonPressed), for: UIControlEvents.touchDown)
        menuButton.addTarget(self, action: #selector(buttonReleased), for: UIControlEvents.touchUpOutside)
        categoryView.categoryTintColor = tintColor
    }
    
    override func draw(_ rect: CGRect) {
        
        addSubview(categoryView)
        addSubview(menuButton)
        
        categoryView.categoryTintColor = tintColor
        categoryView.resetLayerProperties(forLayerIdentifiers: nil)
        categoryView.layer.frame = frame
        categoryView.setupLayerFrames()
        menuButton.bindFrameToSuperviewBounds()
        categoryView.bindFrameToSuperviewBounds()
        
    }

    
   //MARK: - Layout
    
    override func layoutSubviews() {
        
        if !self.subviews.isEmpty {
            
            switch self.menuState {
            case .category:
                self.categoryView.removeAllAnimations()
            case .leftArrow:
                self.categoryView.addLeftArrowAnimation()
            case .rightArrow:
                self.categoryView.addRightArrowAnimation()
            case .upArrow:
                self.categoryView.addUpArrowAnimation()
            case .downArrow:
                self.categoryView.addDownArrowAnimation()
            }
            self.categoryView.bindFrameToSuperviewBounds()
        }
        
    }
    
    
    
    //MARK:- UI
    
    func buttonPressed() {
        categoryView.addTouchedAnimation( totalDuration: 0.01)
    }
    
    func buttonReleased() {
        categoryView.addTouchedAnimation(reverseAnimation: true)
    }
    func buttonTapped() {
        categoryView.addTouchedAnimation(reverseAnimation: true)
        menuState = categoryMenuDelegate?.categoryViewDidTapped(menuState: menuState) ?? menuState
    }
}

extension UIView {
    
    func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        for constraint in self.constraints {
            constraint.isActive = false
        }
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    
    }
}
