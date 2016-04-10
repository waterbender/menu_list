//
//  DishProtocol.swift
//  Menu List
//
//  Created by  ZHEKA on 10.04.16.
//  Copyright © 2016  ZHEKA. All rights reserved.
//

import Foundation


protocol DishProtocol {
    
    var nameOfDish: String { get set }
    var price: Double { get set }
    var dishDescription: String { get set }

}