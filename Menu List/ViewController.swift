//
//  ViewController.swift
//  Menu List
//
//  Created by  ZHEKA on 10.04.16.
//  Copyright © 2016  ZHEKA. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var hamburgerButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var currentlyOpenedMenu: Menu?
    var choosenElement: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let data = MenusData()
        currentlyOpenedMenu = data.randomMenu()
        
        self.title = currentlyOpenedMenu?.nameOfMenu
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource
    
    internal func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let openedMenu = currentlyOpenedMenu {
            return openedMenu.listOfMenu.count
        } else {
            return 0
        }
    }
    
    internal func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let ident = "someIdentifier"
        
        let someCell = self.collectionView.dequeueReusableCellWithReuseIdentifier(ident, forIndexPath: indexPath) as! OneFromMenu
        
        let dish = self.currentlyOpenedMenu?.listOfMenu[indexPath.item] as! TypeOfDish
        someCell.nameOfDish.text = dish.nameOfTheTypeOfFood ?? "Unknown name"
        if let path = dish.pathToPicture {
            someCell.photoOfPlate.image = UIImage(named: path)
        }

        return someCell
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
         return true
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.collectionView.deselectItemAtIndexPath(indexPath, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
         self.choosenElement = indexPath.item
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        let nextCtrl = segue.destinationViewController as! ChoosenTypeController
        let dish = self.currentlyOpenedMenu?.listOfMenu[self.choosenElement] as! TypeOfDish
        nextCtrl.title = dish.nameOfTheTypeOfFood
        nextCtrl.currentlyOpenedDishes = dish
        
    }

}

