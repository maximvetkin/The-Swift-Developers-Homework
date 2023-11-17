//
//  Model.swift
//  UIAlertController3
//
//  Created by Maxim Vetkin on 17.11.2023.
//

import Foundation

class Model{
    let word: String
    
    init(word: String) {
        self.word = word
    }
    
    func reverse(word: String) -> String{
        String(word.reversed())
    }
}
