//
//  TypeOfFood.swift
//  Menu List
//
//  Created by  ZHEKA on 10.04.16.
//  Copyright © 2016  ZHEKA. All rights reserved.
//

import Foundation

struct TypeOfDish: TypeOfDishProtocol {
    
    var listOfDishes: [DishProtocol] = []
    var nameOfTheTypeOfFood: String
    var pathToPicture: String?
    
    init(nameOfType: String) {
        
        nameOfTheTypeOfFood = nameOfType
    }
}