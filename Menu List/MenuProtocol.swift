//
//  MenuProtocol.swift
//  Menu List
//
//  Created by  ZHEKA on 10.04.16.
//  Copyright © 2016  ZHEKA. All rights reserved.
//

import Foundation

protocol MenuData {
    
    var listOfMenu: [TypeOfDishProtocol] { get set }
    var nameOfMenu: String { get set }
}