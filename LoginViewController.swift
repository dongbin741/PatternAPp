//
//  LoginViewController.swift
//  test
//
//  Created by china317 on 15/1/29.
//  Copyright (c) 2015年 china317. All rights reserved.
//

import UIKit

@IBDesignable

class MyCustomView: UIView {
    @IBInspectable var textColor: UIColor
    @IBInspectable var iconHeight: CGFloat
    
    var myTextField: UITextField!
    
    override init(frame: CGRect) {
        textColor = UIColor.redColor()
        iconHeight = 13.0
        myTextField.textColor = textColor
        myTextField.text = "aaaaaa"
        super.init(frame: frame)
        addSubview(myTextField)
    }

    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        textColor = UIColor.blueColor()
        iconHeight = 13.0
        myTextField.textColor = textColor
        myTextField.text = "bbbbbbb"
        super.init(coder: aDecoder)
        addSubview(myTextField)
    }
    override func layoutSubviews() {
        
            
        
    }
}

class LoginViewController: UIViewController ,UIViewControllerTransitioningDelegate{

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //nameTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
    }

    @IBAction func login(sender: AnyObject) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
