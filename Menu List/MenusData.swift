//
//  MenusData.swift
//  Menu List
//
//  Created by  ZHEKA on 10.04.16.
//  Copyright © 2016  ZHEKA. All rights reserved.
//

import Foundation

struct MenusData {
    func randomMenu() -> (Menu) {
        
        var menu = Menu(menuWithName: "Takeaway menu")
        
        let defaultText = "One skewer of cubic cut tender baby lamb fillet and chicken fillet cooced over charcoal grill with grilled peppers and onions slices served with grilled tomato"
        
        let first = DishObject(nameOfDish: "Kebab Sufi Special for 1", price: 22)
        first.consistention = [.ContainsNuts, .Vegeterian]
        first.imageUrl = "dish2"
        first.dishDescription = defaultText
        let second = DishObject(nameOfDish: "Kebab Koobideh warpped in naan bread", price: 11)
        second.imageUrl = "dish3"
        second.dishDescription = defaultText
        second.consistention = [.ContainsNuts]
        let third = DishObject(nameOfDish: "Jonkary Koobideh warpped in naan bread", price: 21)
        third.dishDescription = defaultText
        third.consistention = [.Vegeterian]
        
        // first menu
        var firstDishes = TypeOfDish(nameOfType: "Starters")
        firstDishes.listOfDishes = []
        firstDishes.pathToPicture = "1"
        firstDishes.listOfDishes = [first, second, third]
        
        var secondDishes = TypeOfDish(nameOfType: "Salad")
        secondDishes.listOfDishes = []
        secondDishes.pathToPicture = "2"
        
        var thirdDishes = TypeOfDish(nameOfType: "Soup")
        thirdDishes.listOfDishes = []
        thirdDishes.pathToPicture = "3"
        
        var fourthDishes = TypeOfDish(nameOfType: "Chicken and Lamb Grill")
        fourthDishes.listOfDishes = [first, second, third]
        fourthDishes.pathToPicture = "4"
        
        var fifthDishes = TypeOfDish(nameOfType: "Borshch")
        fifthDishes.listOfDishes = []
        fifthDishes.pathToPicture = "5"
        
        var sixthDishes = TypeOfDish(nameOfType: "Other")
        sixthDishes.listOfDishes = []
        sixthDishes.pathToPicture = "6"
        
        
        
        menu.listOfMenu = [firstDishes, secondDishes, thirdDishes, fourthDishes, fifthDishes, sixthDishes]
        
        return menu
    }
    
    init() {
        
        
    }
}