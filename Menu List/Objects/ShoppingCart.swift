//
//  ShoppingCart.swift
//  Menu List
//
//  Created by  ZHEKA on 10.04.16.
//  Copyright © 2016  ZHEKA. All rights reserved.
//

import Foundation

class ShoppingCart {

    private var _fullPrice : Int = 0
    var count : Int {
        set {
            _fullPrice = newValue
        }
        get { return _fullPrice }
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
    
    func addDish(product: DishProtocol, count: Int) {
        
        for _ in 0..<count {
            arrayOfObjects.append(product)
        }
        
    }
    
    
}