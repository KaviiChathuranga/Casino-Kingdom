//
//  RouletteNumbers.swift
//  Casino Kingdom
//
//  Created by Treinetic Macbook004 on 8/27/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation
class RouletteNumbers{
    var number = ""
    var colour = ""
    var row1Items = [RouletteNumbers]()
    var row2Items = [RouletteNumbers]()
    var row3Items = [RouletteNumbers]()
    var value1 = 1
    var value2 = 2
    var value3 = 3
    
    init(){
       initializeFirstArray()
       initializeSecondArray()
       initializeThirdArray()
    }
    
    init(number: String!, colour: String!){
        self.number = number
        self.colour = colour
    }
    
    func initializeFirstArray(){
        row1Items.removeAll()
        row1Items.append(RouletteNumbers.init(number: "1", colour: "red"))
        for x in 1 ... 11{
            let randomInt = Int.random(in: 0..<2)
             value1 = value1 + 3
            if(randomInt == 1){
                   row1Items.append(RouletteNumbers.init(number: "\(value1)", colour: "black"))
            }else{
                   row1Items.append(RouletteNumbers.init(number: "\(value1)", colour: "red"))
            }
        }
        row1Items.append(RouletteNumbers.init(number: "1of 1", colour: ""))
 
    }
    
    
    func initializeSecondArray(){
        row2Items.removeAll()
        row2Items.append(RouletteNumbers.init(number: "2", colour: "black"))
        for x in 1 ... 11{
            let randomInt = Int.random(in: 0..<2)
            value2 = value2 + 3
            if(randomInt == 1){
                row2Items.append(RouletteNumbers.init(number: "\(value2)", colour: "black"))
            }else{
                row2Items.append(RouletteNumbers.init(number: "\(value2)", colour: "red"))
            }
        }
        row2Items.append(RouletteNumbers.init(number: "1of 2", colour: ""))
        
    }
    
    
    func initializeThirdArray(){
        row3Items.removeAll()
        row3Items.append(RouletteNumbers.init(number: "3", colour: "black"))
        for x in 1 ... 11{
            let randomInt = Int.random(in: 0..<2)
            value3 = value3 + 3
            if(randomInt == 1){
                row3Items.append(RouletteNumbers.init(number: "\(value3)", colour: "black"))
            }else{
                row3Items.append(RouletteNumbers.init(number: "\(value3)", colour: "red"))
            }
        }
        row3Items.append(RouletteNumbers.init(number: "1of 3", colour: ""))
        
    }
}
