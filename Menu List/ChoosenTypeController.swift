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
    @IBOutlet weak var fullCart: UILabel!
    @IBOutlet weak var bootomView: UIView!
    
    var currentlyOpenedDishes: TypeOfDish?
    var storedOffsets = [Int: CGFloat]()
    
    override func viewDidLoad() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(reloadData), name: NSTotalCostDidChange, object: nil)
        
        let barAppearace = UIBarButtonItem.appearance()
        barAppearace.setBackButtonTitlePositionAdjustment(UIOffsetMake(-160, -160), forBarMetrics:UIBarMetrics.Default)
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        let totalRow = tableView.numberOfRowsInSection(indexPath.section)
        
        if(indexPath.item == totalRow - 1){
            //this is the last row in section.
        }
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
        cell.titleLabel.text = someObj.nameOfDish
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
    
    
    //MARK: Notifications
    
    @objc func reloadData(someValue: NSNotification) {
        
        guard let value = someValue.userInfo![NSTotalCostUserInfoKey] else { return }
        
        self.fullCart.text = "£\(value)"
        if value as! Int > 0 {
            self.bootomView.hidden = false
        } else if value as! Int == 0 {
            self.bootomView.hidden = true
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
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



