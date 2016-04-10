//
//  DishObject.swift
//  Menu List
//
//  Created by  ZHEKA on 10.04.16.
//  Copyright © 2016  ZHEKA. All rights reserved.
//

import Foundation

class DishObject: DishProtocol {
    
    enum ConsistentionsTypes {
        case ContainsNuts, Vegeterian

        func correspondingPhoto() -> String {
            switch self {
            case .ContainsNuts:
                return "ContainsNuts"
            case .Vegeterian:
                return "Vegeterian"
            }
        }
    }
    
    var nameOfDish: String
    var dishDescription: String = ""
    var consistention: [ConsistentionsTypes] = []
    var price: Double
    var imageUrl: String?
    
    init(nameOfDish: String, price: Double) {
        
        self.nameOfDish = nameOfDish
        self.price = price
    }
    
}