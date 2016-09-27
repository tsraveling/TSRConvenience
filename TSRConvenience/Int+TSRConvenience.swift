//
//  Int+TSRConvenience.swift
//  TSRConvenience
//
//  Created by Timothy Raveling on 9/2/16.
//  Copyright © 2016 TSRaveling. All rights reserved.
//

import UIKit

public extension Int {
    
    func formattedValue() -> String {
        
        return self.formattedValue(.decimal)
    }
    
    func formattedValue(_ style : NumberFormatter.Style) -> String {
        
        let nf = NumberFormatter()
        nf.numberStyle = style
        return nf.string(from: NSNumber(value: self as Int))!
    }
}
