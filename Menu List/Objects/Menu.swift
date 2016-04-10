//
//  Menu.swift
//  Menu List
//
//  Created by  ZHEKA on 10.04.16.
//  Copyright © 2016  ZHEKA. All rights reserved.
//

import Foundation

struct Menu: MenuData {

    var listOfMenu: [TypeOfDishProtocol] = []
    var nameOfMenu: String
    
    init(menuWithName: String) {
        
        self.nameOfMenu = menuWithName
    }
}
