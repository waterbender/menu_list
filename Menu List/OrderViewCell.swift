//
//  OrderViewCell.swift
//  Menu List
//
//  Created by  ZHEKA on 11.04.16.
//  Copyright © 2016  ZHEKA. All rights reserved.
//

import UIKit

class OrderViewCell: UITableViewCell {

    @IBOutlet weak var imageCard: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var amountPrice: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    @IBAction func deleteAllInPart(sender: AnyObject) {
     
        let text = self.name.text!
        let allElements = ShoppingCart.sharedInstance.dictionaryOfObjects[text]!.count
        ShoppingCart.sharedInstance.removeDish(text, countT: allElements)
    }
    
    @IBAction func upElement(sender: AnyObject) {
        
        let text = self.name.text!
        let product = ShoppingCart.sharedInstance.dictionaryOfObjects[text]?.first as! DishObject
        ShoppingCart.sharedInstance.addDish(product, countT: 1)
    }
    @IBAction func downElement(sender: AnyObject) {
        let text = self.name.text!
        ShoppingCart.sharedInstance.removeDish(text, countT: 1)
    }
    
    
}
