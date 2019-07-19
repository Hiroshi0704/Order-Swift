//
//  FoodModel.swift
//  Order
//
//  Created by macair2 elevenlab on 2019/07/18.
//  Copyright © 2019 Hiroshi Watanabe. All rights reserved.
//

import UIKit

class FoodModel {
    
    var foodArray = [Food]()
    var beerArray = [Food]()
    var dishArray = [Food]()
    var iceArray = [Food]()
    var pastaArray = [Food]()
    
    init() {
        
        let beer1 = Food(name: "Beer1", price: 480)
        let beer2 = Food(name: "Beer2", price: 380)
        let beer3 = Food(name: "Beer3", price: 580)
        
        let dish1 = Food(name: "Dish1", price: 730)
        let dish2 = Food(name: "Dish2", price: 600)
        let dish3 = Food(name: "Dish3", price: 400)
        let dish4 = Food(name: "Dish4", price: 500)
        
        let ice1 = Food(name: "Ice1", price: 300)
        let ice2 = Food(name: "Ice2", price: 600)
        
        let pasta1 = Food(name: "pasta1", price: 800)
        let pasta2 = Food(name: "pasta2", price: 780)
        let pasta3 = Food(name: "pasta3", price: 780)
        let pasta4 = Food(name: "pasta4", price: 780)
        let pasta5 = Food(name: "pasta5", price: 900)
        
        beerArray = [beer1, beer2, beer3]
        dishArray = [dish1, dish2, dish3, dish4]
        iceArray = [ice1, ice2]
        pastaArray = [pasta1, pasta2, pasta3, pasta4, pasta5]
    }
    
    func getFoodArray(category: String) -> [Food] {
        
        switch category {
        case "beer":
            return beerArray
        case "dish":
            return dishArray
        case "pasta":
            return pastaArray
        case "ice-cream":
            return iceArray
        default:
            break
        }
        return [Food]()
    }
}
