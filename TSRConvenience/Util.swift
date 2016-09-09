//
//  Util.swift
//  TSRConvenience
//
//  Created by Timothy Raveling on 9/8/16.
//  Copyright © 2016 TSRaveling. All rights reserved.
//

import Foundation

public func delay(delay: Double, closure: ()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(),
        closure
    )
}