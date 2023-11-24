//
//  ViewController.swift
//  UISwitch4
//
//  Created by Maxim Vetkin on 18.11.2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var eyeButton: UIButton!
    
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = logInButton.frame.height / 2
       
    }

    @IBAction func logInButtonPushed(_ sender: Any) {
        
    }
    
    @IBAction func eyeButtonPushed(_ sender: Any) {
        flag.toggle()
        passwordTextField.isSecureTextEntry = !flag
        let imageSystemName = flag ? "eye" : "eye.slash"
        eyeButton.setImage(UIImage(systemName: imageSystemName), for: .normal)
    }
}

