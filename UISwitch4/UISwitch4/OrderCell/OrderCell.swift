//
//  OrderCell.swift
//  UISwitch4
//
//  Created by Maxim Vetkin on 24.11.2023.
//

import UIKit

class OrderCell: UITableViewCell {

    @IBOutlet weak var dishLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var componentsLabel: UILabel!
    @IBOutlet weak var horizontalStackView: UIStackView!
    

    func configure(with info: DishInfo){
//        horizontalStackView.setCustomSpacing(60, after: dishLabel)
        
        dishLabel.text = info.dishName
        priceLabel.text = String(format: "%.2f", info.dishPrice)
        componentsLabel.text = info.dishComponents.joined(separator: ", ")
        
    }
}
