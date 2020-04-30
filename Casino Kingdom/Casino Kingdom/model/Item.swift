//
//  Item.swift
//  Casino Kingdom
//
//  Created by Treinetic Macbook004 on 8/27/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation
class Item{
    var value = 0
    var angle = 0.0
    var itemArrary = [Item]()
    
    init(){
        initialize()
    }
    init(value : Int!, angle: Double!){
        self.value = value
        self.angle = angle
    }
    
    func initialize(){
        itemArrary.removeAll()
        itemArrary.append(Item.init(value: 0, angle: 0.84))
        itemArrary.append(Item.init(value: 1, angle: 3.21))
        itemArrary.append(Item.init(value: 2, angle: 6.12))
        itemArrary.append(Item.init(value: 3, angle: 1.16))
        itemArrary.append(Item.init(value: 4, angle: 0.16))
        itemArrary.append(Item.init(value: 5, angle: 3.9))
        itemArrary.append(Item.init(value: 6, angle: 5.45))
        itemArrary.append(Item.init(value: 7, angle: 1.88))
        itemArrary.append(Item.init(value: 8, angle: 4.42))
        itemArrary.append(Item.init(value: 9, angle: 2.53))
        itemArrary.append(Item.init(value: 10, angle: 4.06))
        itemArrary.append(Item.init(value: 11, angle: 4.75))
        itemArrary.append(Item.init(value: 12, angle: 1.52))
        itemArrary.append(Item.init(value: 13, angle: 5.10))
        itemArrary.append(Item.init(value: 14, angle: 2.88))
        itemArrary.append(Item.init(value: 15, angle: 0.5))
        itemArrary.append(Item.init(value: 16, angle: 3.56))
        itemArrary.append(Item.init(value: 17, angle: 5.78))
        itemArrary.append(Item.init(value: 18, angle: 2.2))
        itemArrary.append(Item.init(value: 19, angle: 0.33))
        itemArrary.append(Item.init(value: 20, angle: 3.07))
        itemArrary.append(Item.init(value: 21, angle: 0))
        itemArrary.append(Item.init(value: 22, angle: 2.38))
        itemArrary.append(Item.init(value: 23, angle: 4.24))
        itemArrary.append(Item.init(value: 24, angle: 3.73))
        itemArrary.append(Item.init(value: 25, angle: 5.94))
        itemArrary.append(Item.init(value: 26, angle: 1))
        itemArrary.append(Item.init(value: 27, angle: 5.6))
        itemArrary.append(Item.init(value: 28, angle: 1.7))
        itemArrary.append(Item.init(value: 29, angle: 2.04))
        itemArrary.append(Item.init(value: 30, angle: 4.59))
        itemArrary.append(Item.init(value: 31, angle: 2.7))
        itemArrary.append(Item.init(value: 32, angle: 0.68))
        itemArrary.append(Item.init(value: 33, angle: 3.38))
        itemArrary.append(Item.init(value: 34, angle: 5.27))
        itemArrary.append(Item.init(value: 35, angle: 1.35))
        itemArrary.append(Item.init(value: 36, angle: 4.92))
    }
    
}
