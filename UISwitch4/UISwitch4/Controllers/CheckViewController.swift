//
//  CheckViewController.swift
//  UISwitch4
//
//  Created by Maxim Vetkin on 19.11.2023.
//

import UIKit

class CheckViewController: UIViewController {

    @IBOutlet weak var totalButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.dataSource = self
        
        let nib = UINib(nibName: "OrderCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "OrderCell")
        
        totalButton.layer.cornerRadius = totalButton.frame.height / 2
    }
    
    private let order: [DishInfo] = [
        DishInfo(dishName: "Caesar Salad", dishPrice: 9.854, dishComponents: ["Tomato", "Lettuce", "Chicken", "Parmesan", "blablabla"]),
        DishInfo(dishName: "Capresse", dishPrice: 6.245, dishComponents: ["Tomato", "Mozzarella", "Basil"])
    ]

}



extension CheckViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        order.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderCell
        cell.configure(with: order[indexPath.row])
        return cell
    }
    
    
}

