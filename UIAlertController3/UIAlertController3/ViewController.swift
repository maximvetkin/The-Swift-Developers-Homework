//
//  ViewController.swift
//  UIAlertController3
//
//  Created by Maxim Vetkin on 16.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sumButton: UIButton!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var nextScreenButton: UIButton!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
    
    let selectedNumber = Int.random(in: 1...99)
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createNameAlert()
        nameLabel.isHidden = true
        sumButton.isHidden = true
        guessButton.isHidden = true
        nextScreenButton.isHidden = true
        sumLabel.isHidden = true
        guessLabel.isHidden = true
        guessLabel.numberOfLines = 0
        sumButton.layer.cornerRadius = sumButton.frame.height / 2
        guessButton.layer.cornerRadius = guessButton.frame.height / 2
        nextScreenButton.layer.cornerRadius = nextScreenButton.frame.height / 2
        
    }

    func createNameAlert(){
        let nameAlert = UIAlertController(title: "Enter your name", message: nil, preferredStyle: .alert)
        nameAlert.addTextField()
        if let tf = nameAlert.textFields{
            tf[0].placeholder = "Enter your name"
        }
        nameAlert.addAction(UIAlertAction(title: "Enter", style: .cancel, handler: { _ in
            if let tf = nameAlert.textFields{
                guard tf[0].text != ""else{
                    self.createNoTextAlertName()
                    return
                }
                self.nameLabel.text = "Name: \(tf[0].text!)"
                self.nameLabel.isHidden = false
                self.sumButton.isHidden = false
                self.guessButton.isHidden = false
                self.nextScreenButton.isHidden = false
                
            }
        }))
        present(nameAlert, animated: true)
    }
    func createNoTextAlert(){
        let noTextAlert = UIAlertController(title: "No text found", message: "Type something", preferredStyle: .alert)
        noTextAlert.addAction(UIAlertAction(title: "Okay, let me type", style: .cancel))
        present(noTextAlert, animated: true)
    }
    func createNoTextAlertName(){
        let noTextAlert = UIAlertController(title: "No text found", message: "Type something", preferredStyle: .alert)
        noTextAlert.addAction(UIAlertAction(title: "Okay, let me type", style: .cancel, handler: { _ in
            self.createNameAlert()
        }))
        present(noTextAlert, animated: true)
    }
    func createNotAnIntegerAlert(){
        let noTextAlert = UIAlertController(title: "Not an integer number", message: "Type some integer number", preferredStyle: .alert)
        noTextAlert.addAction(UIAlertAction(title: "Okay, let me type some integer numbers", style: .cancel))
        present(noTextAlert, animated: true)
    }
       
    
    @IBAction func sumButtonPushed(_ sender: UIButton) {
        let sumAlert = UIAlertController(title: "Calculating sum of two numbers", message: "Enter two numbers", preferredStyle: .alert)
        sumAlert.addTextField()
        sumAlert.addTextField()
        if let tf = sumAlert.textFields{
            tf[0].placeholder = "First number"
            tf[1].placeholder = "Second number"
        }
        let calculateAction = UIAlertAction(title: "Calculate", style: .default){ _ in
            if let tf = sumAlert.textFields{
                guard tf[0].text != "" && tf[1].text != "" else{
                    self.createNoTextAlert()
                    return
                }
                if let tf0 = Int(tf[0].text!), let tf1 = Int(tf[1].text!){
                    let sum = tf0 + tf1
                    self.sumLabel.isHidden = false
                    self.sumLabel.text = "Sum: \(sum)"
                }else{
                    self.createNotAnIntegerAlert()
                }
                
            }
        }
        sumAlert.addAction(calculateAction)
        present(sumAlert, animated: true)
        
    }
    
    var count = 1
    @IBAction func guessButtonPushed(_ sender: UIButton) {
        let guessAlert = UIAlertController(title: "Guess the number I selected (1-99)", message: nil, preferredStyle: .alert)
        guessAlert.addTextField()
        if let tf = guessAlert.textFields{
            tf[0].placeholder = "Enter number"
        }
        let tryAction = UIAlertAction(title: "Try", style: .default) { _ in
            if let tf = guessAlert.textFields{
                guard tf[0].text != "" else{
                    self.createNoTextAlert()
                    return
                }
                if let tf0 = Int(tf[0].text!){
                    
                    self.guessLabel.isHidden = false
                    if tf0 == self.selectedNumber{
                        self.guessLabel.text = "Congratulation! You succesfully guessed the number in \(self.count) attempts!"
                        self.guessButton.isHidden = true
                    }else if tf0 < self.selectedNumber{
                        self.count += 1
                        self.guessLabel.text = "My number is greater! Try again!"
                    }else{
                        self.count += 1
                        self.guessLabel.text = "My number is less! Try again!"
                    }
                    
                }else{
                    self.createNotAnIntegerAlert()
                }
            }
        }
        guessAlert.addAction(tryAction)
        present(guessAlert, animated: true)
    }
    
    @IBAction func nextScreenButtonPushed(_ sender: UIButton) {
//        performSegue(withIdentifier: "segueToSecondVC", sender: self)
    }
}


