//
//  ShoppingCart.swift
//  Menu List
//
//  Created by  ZHEKA on 10.04.16.
//  Copyright © 2016  ZHEKA. All rights reserved.
//

import Foundation

let NSTotalCostDidChange = "NSTotalCostDidChange";
let NSTotalCostUserInfoKey = "NSTotalCostUserInfoKey"

class ShoppingCart {

    private var _fullPrice : Double = 0
    var count : Double {
        set {
      
            let dictionary = [NSTotalCostUserInfoKey:newValue]
            NSNotificationCenter.defaultCenter().postNotificationName(NSTotalCostDidChange, object: nil, userInfo: dictionary)
            
            _fullPrice = newValue

        }
        get {
            
            return _fullPrice
        }
    }
    
    var dictionaryOfObjects: [String:[DishProtocol]] = [:]
    
    class var sharedInstance: ShoppingCart {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: ShoppingCart? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = ShoppingCart()
        }
        return Static.instance!
    }
    
    func addDish(product: DishProtocol, countT: Int) {
        
        for _ in 0..<countT {
            
            self.count = self.count + product.price
            
            if var someArr = self.dictionaryOfObjects[product.nameOfDish] {
                someArr.append(product)
                self.dictionaryOfObjects[product.nameOfDish] = someArr
            } else {
                self.dictionaryOfObjects[product.nameOfDish] = [product]
            }
        }
    }
    
    func removeDish(withName: String, countT: Int) {
        
        for _ in 0..<countT {
            
            if var array = self.dictionaryOfObjects[withName] {
                
                let product = array.first
                array.removeFirst()
                self.dictionaryOfObjects[withName] = array
                
                if array.count == 0 {
                    self.dictionaryOfObjects[withName] = nil
                }
                
                self.count = self.count - product!.price
            }
        }
        
        
    }

    
}