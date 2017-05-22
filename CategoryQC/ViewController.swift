//
//  ViewController.swift
//  CategoryQC
//
//  Created by Vladislav Dorfman on 09/05/2017.
//  Copyright © 2017 Vladislav Dorfman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CategoryMenuDelegate {
    
    
    fileprivate var slider = UISlider()
    fileprivate var btn : CategoryButtonView?
    fileprivate var slider2 = UISlider()
    fileprivate var btn2 : CategoryButtonView?
    
    var btnHeightConstraint = NSLayoutConstraint()
    var btnWidthConstraint = NSLayoutConstraint()
    var btn2HeightConstraint = NSLayoutConstraint()
    var btn2WidthConstraint = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        prepareMenuButton()
    }
    
    /// A constant to layout.
    fileprivate var btnSize: CGFloat  {
        get  { return CGFloat(slider.value) }
        set
        {
            btnHeightConstraint.constant = newValue
            btnWidthConstraint.constant =  newValue
        }
    }
    fileprivate var btn2Size: CGFloat  {
        get  { return CGFloat(slider.value) }
        set
        {
            btn2HeightConstraint.constant = newValue
            btn2WidthConstraint.constant =  newValue
        }
    }
    
    func categoryViewDidTapped(menuState: CategoryButtonView.MenuStates) -> CategoryButtonView.MenuStates {
        return CategoryButtonView.MenuStates.randomState()
    }
    
    func changeSize() {
        UIView.animate(withDuration: 0.3) { 
            self.btnSize = CGFloat(self.slider.value)
        }
    }
    func changeSize2() {
        UIView.animate(withDuration: 0.3) {
            self.btn2Size = CGFloat(self.slider2.value)
        }
    }
    
    /// Prepares the resign responder button.
    fileprivate func prepareMenuButton() {
        
        
        slider.widthAnchor.constraint(equalToConstant: self.view.frame.width - 40).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        slider.maximumValue = 300
        slider.minimumValue = 10
        slider.setValue(300, animated: true)
        slider.addTarget(self, action: #selector(changeSize), for: .valueChanged)
        
        slider2.widthAnchor.constraint(equalToConstant: self.view.frame.width - 40).isActive = true
        slider2.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        slider2.maximumValue = 300
        slider2.minimumValue = 10
        slider2.setValue(300, animated: true)
        slider2.addTarget(self, action: #selector(changeSize2), for: .valueChanged)
        
        
        btn = CategoryButtonView(frame: CGRect.init(origin: view.center, size: CGSize(width: btnSize, height: btnSize)), tintColor: UIColor.white, backgroundColor: UIColor.black)
        btnWidthConstraint = NSLayoutConstraint(item: btn!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: btnSize)
        btnHeightConstraint = NSLayoutConstraint(item: btn!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: btnSize)
        btn?.categoryMenuDelegate = self
        
        btn2 = CategoryButtonView(frame: CGRect.init(origin: view.center, size: CGSize(width: btn2Size, height: btn2Size)), tintColor: UIColor.white, backgroundColor: UIColor.black)
        btn2WidthConstraint = NSLayoutConstraint(item: btn2!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: btn2Size)
        btn2HeightConstraint = NSLayoutConstraint(item: btn2!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: btn2Size)
        btn2?.categoryMenuDelegate = self
        
        //Stack View
        let stackView   = UIStackView()
        stackView.axis  = UILayoutConstraintAxis.vertical
        stackView.distribution  = UIStackViewDistribution.equalSpacing
        stackView.alignment = UIStackViewAlignment.center
        stackView.spacing   = 16.0
        
        
        
        self.view.addSubview(stackView)
        
        stackView.addArrangedSubview(btn!)
        stackView.addArrangedSubview(slider)
        stackView.addArrangedSubview(btn2!)
        stackView.addArrangedSubview(slider2)
        
        
        
        //Constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.addConstraints(
            [
                btnWidthConstraint,
                btnHeightConstraint,
                btn2WidthConstraint,
                btn2HeightConstraint
            ])
        
    }
}
