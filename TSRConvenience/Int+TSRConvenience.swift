//
//  Int+TSRConvenience.swift
//  TSRConvenience
//
//  Created by Timothy Raveling on 9/2/16.
//  Copyright © 2016 TSRaveling. All rights reserved.
//

import UIKit

extension Int {
    
    func formattedValue() -> String {
        
        return self.formattedValue(.DecimalStyle)
    }
    
    func formattedValue(style : NSNumberFormatterStyle) -> String {
        
        let nf = NSNumberFormatter()
        nf.numberStyle = style
        return nf.stringFromNumber(NSNumber(integer: self))!
    }
}