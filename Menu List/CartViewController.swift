//
//  CartViewController.swift
//  Menu List
//
//  Created by  ZHEKA on 11.04.16.
//  Copyright © 2016  ZHEKA. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fullCount: UILabel!
    
    var dictionaryCartKeys: [String] = []
   
    override func viewDidLoad() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(reloadData), name: NSTotalCostDidChange, object: nil)
        let barAppearace = UIBarButtonItem.appearance()
        barAppearace.setBackButtonTitlePositionAdjustment(UIOffsetMake(-160, -160), forBarMetrics:UIBarMetrics.Default)
        self.fullCount.text = "£\(ShoppingCart.sharedInstance.count)"

        let array = [String](ShoppingCart.sharedInstance.dictionaryOfObjects.keys)
        self.dictionaryCartKeys = array
        
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ShoppingCart.sharedInstance.dictionaryOfObjects.count
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let ident = "OrderCellIdentifier"
        let cell = tableView.dequeueReusableCellWithIdentifier(ident) as! OrderViewCell
        
        let currentDishName = self.dictionaryCartKeys[indexPath.row]
        cell.name.text = currentDishName
        let someDish = ShoppingCart.sharedInstance.dictionaryOfObjects[currentDishName]![0] as! DishObject
        cell.price.text = "\(someDish.price)"
        let coutOfPartDishes = ShoppingCart.sharedInstance.dictionaryOfObjects[currentDishName]!.count
   
        let priceOfPartDishes = Double(coutOfPartDishes) * someDish.price
        cell.amountPrice.text = "\(priceOfPartDishes)"
        if let imUrl = someDish.imageUrl {
            cell.imageCard.image = UIImage(named: imUrl)
        }
        cell.count.text = "\(coutOfPartDishes)"
        
        return cell
    }
    
    //MARK: UITableViewDelegate 
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return false
    }
    
    //MARK: Notifications
    
    @objc func reloadData(someValue: NSNotification) {
        
        guard let value = someValue.userInfo![NSTotalCostUserInfoKey] else { return }
        self.fullCount.text = "£\(value)"
        let array = [String](ShoppingCart.sharedInstance.dictionaryOfObjects.keys)
        self.dictionaryCartKeys = array
        
        self.tableView.reloadData()
    }
    
    
    @IBAction func sendOrder(sender: AnyObject) {
        
        //here you will send your card with purchianse
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

}
