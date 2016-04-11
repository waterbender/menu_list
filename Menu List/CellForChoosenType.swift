//
//  cellForChoosenType.swift
//  Menu List
//
//  Created by  ZHEKA on 10.04.16.
//  Copyright © 2016  ZHEKA. All rights reserved.
//

import UIKit

class CellForChoosenType: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var AddOrderButton: UIButton!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!

    
    var addingDish: DishProtocol? = nil

    private var _count : Int = 1
    var count : Int {
        set {
            _count = newValue
            if _count < 1 { _count = 1; return }
            self.numLabel.text = "\(_count)"
        }
        get { return _count }
    }
    
    @IBAction func upCount(sender: AnyObject) {
        count += 1
    }

    @IBAction func downCount(sender: AnyObject) {
        count -= 1
    }
    
    @IBAction func addToOrder(sender: AnyObject) {
        ShoppingCart.sharedInstance.addDish(addingDish!, countT: count)
        self.count = 1
    }
}


extension CellForChoosenType {
    
    func setCollectionViewDataSourceDelegate<D: protocol<UICollectionViewDataSource, UICollectionViewDelegate>>(dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        
        collectionView.setContentOffset(collectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        collectionView.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set {
            collectionView.contentOffset.x = newValue
        }
        
        get {
            return collectionView.contentOffset.x
        }
    }
}