//
//  Food.swift
//  Order
//
//  Created by macair2 elevenlab on 2019/07/18.
//  Copyright © 2019 Hiroshi Watanabe. All rights reserved.
//

import UIKit

class Food {
    
    var name: String
    var price: Int
    var num: Int
    var orderdNum: Int = 0
    
    init(name: String, price: Int, num: Int = 0) {
        self.name = name
        self.price = price
        self.num = num
    }
    
}
