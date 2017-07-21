//
//  Book.swift
//  Swift_FristDemo
//
//  Created by qwkj on 2017/7/20.
//  Copyright © 2017年 qwkj. All rights reserved.
//

import UIKit

class Book: NSObject {

    var name:NSString?
    var price:CGFloat?
    init(name :NSString , price :CGFloat){
        self.name = name;
        self.price = price;
    }
    func printBook(){
        print("名称\(self.name!),价格\(self.price!)")
    }
    
    
}
