//
//  Float+TSRConvenience.swift
//  TSRConvenience
//
//  Created by Timothy Raveling on 9/2/16.
//  Copyright © 2016 TSRaveling. All rights reserved.
//

import Foundation

extension Float {
    
    var radiansToDegrees: Float { return (self * 180) / Float(M_PI) }
}