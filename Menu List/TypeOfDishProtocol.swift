//
//  DishProtocol.swift
//  Menu List
//
//  Created by  ZHEKA on 10.04.16.
//  Copyright © 2016  ZHEKA. All rights reserved.
//

import Foundation

protocol TypeOfDishProtocol {
    
    var listOfDishes: [DishProtocol] { get set }
    var nameOfTheTypeOfFood: String { get set }
}