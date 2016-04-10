//
//  ChoosenTypeController.swift
//  Menu List
//
//  Created by  ZHEKA on 10.04.16.
//  Copyright © 2016  ZHEKA. All rights reserved.
//

import UIKit
import Foundation

class ChoosenTypeController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var currentlyOpenedDishes: TypeOfDish?
    var storedOffsets = [Int: CGFloat]()
    
    override func viewDidLoad() {
        
        let barAppearace = UIBarButtonItem.appearance()
        barAppearace.setBackButtonTitlePositionAdjustment(UIOffsetMake(-160, -160), forBarMetrics:UIBarMetrics.Default)
        ShoppingCart.sharedInstance
        


    }
    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    //MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currentlyOpenedDishes?.listOfDishes.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let key = "cellIdentifier"
        let cell = self.tableView.dequeueReusableCellWithIdentifier(key) as! CellForChoosenType
        let someObj = currentlyOpenedDishes?.listOfDishes[indexPath.item] as! DishObject
        if let imUrl = someObj.imageUrl {
            cell.photoImageView?.image = UIImage(named: imUrl)
        }
        cell.descriptionTextView.text = someObj.dishDescription
        cell.descriptionTextView.font = UIFont(name: "Helvetica Neue", size: 14.0)
        cell.priceLabel.text = "£ \(someObj.price)"
        cell.addingDish = someObj
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let someObj = currentlyOpenedDishes?.listOfDishes[indexPath.item] as! DishObject
        if someObj.consistention.count > 0 {
            return 245.0;
        }
        return 220.0;
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let tableViewCell = cell as? CellForChoosenType else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let tableViewCell = cell as? CellForChoosenType else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
    
}


extension ChoosenTypeController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        let array = currentlyOpenedDishes?.listOfDishes
        let dish = array![collectionView.tag] as! DishObject
        
        let value = dish.consistention.count ?? 0
        
        return value
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        
        let key = "cellTasteIdentifier"
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(key, forIndexPath: indexPath) as! CollectionViewCell
        
        let array = currentlyOpenedDishes?.listOfDishes
        let dish = array![collectionView.tag] as! DishObject
        
        let type = dish.consistention[indexPath.item] as DishObject.ConsistentionsTypes
        let image = UIImage(named: type.correspondingPhoto())
        
        cell.image.image = image
        
        return cell
    }
    
    
}

