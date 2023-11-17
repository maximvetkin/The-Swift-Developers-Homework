//
//  SecondViewController.swift
//  UIAlertController3
//
//  Created by Maxim Vetkin on 17.11.2023.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var reverseLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        reverseLabel.text = ""
        reverseLabel.numberOfLines = 0
        
        reverseButton.layer.cornerRadius = reverseButton.frame.height / 2
    
        // Do any additional setup after loading the view.
    }
    func createNoTextAlert(){
        let noTextAlert = UIAlertController(title: "No text found", message: "Type something", preferredStyle: .alert)
        noTextAlert.addAction(UIAlertAction(title: "Okay, let me type", style: .cancel))
        present(noTextAlert, animated: true)
    }
    
    
    @IBAction func reverseButtonPushed(_ sender: UIButton) {
        let reverseAlert = UIAlertController(title: "I can reverse whatever you write", message: nil, preferredStyle: .alert)
        reverseAlert.addTextField()
        if let tf = reverseAlert.textFields{
            tf[0].placeholder = "Enter word"
        }
        let enterAction = UIAlertAction(title: "Enter", style: .default) { _ in
            if let tf = reverseAlert.textFields{
                let textModel = Model(word: tf[0].text!)
                guard tf[0].text != "" else{
                    self.createNoTextAlert()
                    return
                }
                self.reverseLabel.text = "The reversed word is \(textModel.reverse(word: textModel.word))"
            }
        }
        reverseAlert.addAction(enterAction)
        
        present(reverseAlert, animated: true)
    }
    

}
