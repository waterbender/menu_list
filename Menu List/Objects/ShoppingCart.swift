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
    
    var arrayOfObjects: [DishProtocol] = []
    
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
            arrayOfObjects.append(product)
        }
        
    }
    
    
}