//
//  File.swift
//  TestUtils
//
//  Created by Admin on 6/3/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

public final class SwiftyLib {
    
    let name = "SwiftyLib"
    
    public func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    public func sub(a: Int, b: Int) -> Int {
        return a - b
    }
    func animShow(){
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn],
                       animations: {
        }, completion: nil)
    }
    func animHide(){
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveLinear],
                       animations: {
                        
        },  completion: {(_ completed: Bool) -> Void in
        })
    }
}
