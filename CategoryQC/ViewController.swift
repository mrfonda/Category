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
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        menu.categoryMenuDelegate = self
        switch3D.isOn = menu.is3DEnabled
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
    
    @IBAction func changeMenuSize(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [], animations: {
            self.heightConstant.constant = CGFloat(self.menuSizeSlider.value)
            self.widthConstant.constant = CGFloat(self.menuSizeSlider.value)
        })
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
