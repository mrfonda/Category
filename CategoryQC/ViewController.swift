//
//  ViewController.swift
//  CategoryQC
//
//  Created by Vladislav Dorfman on 09/05/2017.
//  Copyright © 2017 Vladislav Dorfman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CategoryMenuDelegate {
    
    @IBOutlet weak var widthConstant: NSLayoutConstraint!
    @IBOutlet weak var heightConstant: NSLayoutConstraint!
    @IBOutlet weak var menu: CategoryButtonView!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var switch3D: UISwitch!
    @IBOutlet weak var menuSizeSlider: UISlider!
    @IBOutlet weak var buttonType: UISwitch!
    var heightMenuProgConstraint = NSLayoutConstraint()
    var widthMenuProgConstraint = NSLayoutConstraint()
    var anchor : CGFloat = 40
    var menuProg = CategoryButtonView()
    var buttonSize : CGFloat {
        get {
            return CGFloat(self.menuSizeSlider.value)
        }
        set {
            self.menuSizeSlider.value = Float(newValue)
            
            
            
            if buttonType.isOn {
                
                widthMenuProgConstraint = NSLayoutConstraint(item: menuProg, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: newValue)
                heightMenuProgConstraint = NSLayoutConstraint(item: menuProg, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: newValue)
                //menuProg.heightAnchor.constraint(equalToConstant: anchor).isActive = false
                //menuProg.widthAnchor.constraint(equalToConstant: anchor).isActive = false
                //menuProg.heightAnchor.constraint(equalToConstant: newValue).isActive = true
                //menuProg.widthAnchor.constraint(equalToConstant: newValue).isActive = true
                anchor = newValue
            } else {
                self.heightConstant.constant = newValue
                self.widthConstant.constant = newValue
                print(menu.frame, self.heightConstant.constant, self.widthConstant.constant)
            }
            
        }
    }
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        menu.categoryMenuDelegate = self
        let buttonFrame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(buttonSize), height: CGFloat(buttonSize))
        
        menuProg = CategoryButtonView(frame: buttonFrame, tintColor: UIColor.blue, backgroundColor: UIColor.brown)
        menuProg.categoryMenuDelegate = self
        
        switch3D.isOn = menu.is3DEnabled
        
        stack.insertArrangedSubview(menuProg, at: 1)
        //menuProg.heightAnchor.constraint(equalToConstant: anchor).isActive = true
        //menuProg.widthAnchor.constraint(equalToConstant: anchor).isActive = true
        
        widthMenuProgConstraint = NSLayoutConstraint(item: menuProg, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        heightMenuProgConstraint = NSLayoutConstraint(item: menuProg, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        
        //menuProg.isHidden = true
        //menuProg.addConstraints([widthMenuProgConstraint,heightMenuProgConstraint])
    }
    
    //MARK: - UI
    func categoryViewDidTapped(menuState: CategoryButtonView.MenuStates) -> CategoryButtonView.MenuStates {
        return CategoryButtonView.MenuStates.randomState()
    }
    @IBAction func toCategory(_ sender: UIButton) {
        menu.menuState = .category
    }
    @IBAction func toUp(_ sender: UIButton) {
        menu.menuState = .upArrow
    }
    @IBAction func toLeft(_ sender: UIButton) {
        menu.menuState = .leftArrow
    }
    @IBAction func toRight(_ sender: UIButton) {
        menu.menuState = .rightArrow
    }
    
    @IBAction func toDown(_ sender: UIButton) {
        menu.menuState = .downArrow
    }
    
    @IBAction func rndColor(_ sender: UIButton) {
        menu.tintColor = UIColor.getRandomColor()
        menu.backgroundColor = UIColor.getRandomColor()
    }
    
    @IBAction func change3D(_ sender: UISwitch) {
        menu.is3DEnabled = sender.isOn
    }
    
    
    
    @IBAction func changeButtonType(_ sender: UISwitch) {
        if buttonType.isOn {
            //menuProg.heightAnchor.constraint(equalToConstant: anchor).isActive = false
            //menuProg.widthAnchor.constraint(equalToConstant: anchor).isActive = false
            //menuProg.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
            //menuProg.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
            anchor = buttonSize
            menu.isHidden = true
            heightMenuProgConstraint.isActive = true
            widthMenuProgConstraint.isActive = true
            menuProg.isHidden = false
            
            
            
        } else {
            //menuProg.heightAnchor.constraint(equalToConstant: buttonSize).isActive = false
            //menuProg.widthAnchor.constraint(equalToConstant: buttonSize).isActive = false
            menu.isHidden = false
            menuProg.isHidden = true
            stack.insertArrangedSubview(menuProg, at: 1)
        }
    }
    
    @IBAction func minus10(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: [.curveEaseIn], animations: {
            self.buttonSize = self.buttonSize - 10
        }, completion: nil)
    }
    
    @IBAction func plus10(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 2) {
            self.buttonSize = self.buttonSize + 10
        }
    }
    
    @IBAction func changeMenuSize(_ sender: UISlider) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: [.curveEaseIn], animations: {
            self.buttonSize = CGFloat(sender.value)
        }, completion: nil)
        
    }
}
extension UIColor {
    static func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
}
