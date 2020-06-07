//
//  ViewController.swift
//  ButtonMasher
//
//  Created by Caleb Stultz on 1/15/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func chooseColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(255))/255
        let green = CGFloat(arc4random_uniform(255))/255
        let blue = CGFloat(arc4random_uniform(255))/255
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
    @IBAction func changeColorBtnWasPressed(_ sender: Any) {
        colorView.backgroundColor = chooseColor()
        label = UILabel(frame: CGRect(x: UIScreen.main.bounds.midX - 100, y: 200, width: 200, height: 30))
        label.text = "Now THAT's colorful!"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        view.addSubview(label)
    }
    
}

