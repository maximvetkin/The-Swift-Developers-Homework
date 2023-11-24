//
//  CafeMarioViewController.swift
//  UISwitch4
//
//  Created by Maxim Vetkin on 18.11.2023.
//

import UIKit

class CafeMarioViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberOfGuestsTextField: UITextField!
    @IBOutlet weak var tableNumberTextField: UITextField!
    
    @IBOutlet weak var bookSwitch: UISwitch!
    @IBOutlet weak var advanceSwitch: UISwitch!
    @IBOutlet weak var vipSwitch: UISwitch!
    
    @IBOutlet weak var checkButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkButton.layer.cornerRadius = checkButton.frame.height / 2
    }
    

    @IBAction func checkButtonPushed(_ sender: Any) {
        createAlertCheck()
    }
    
    fileprivate func createAlertCheck() {
        let alert = UIAlertController(title: "Do you need check?", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let checkAction = UIAlertAction(title: "Check", style: .default) { _ in
            self.performSegue(withIdentifier: "checkSegue", sender: self)
        }
        alert.addAction(cancelAction)
        alert.addAction(checkAction)
        present(alert, animated: true)
    }
}
