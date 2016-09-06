//
//  String+TSRConvenience.swift
//  TSRConvenience
//
//  Created by Timothy Raveling on 9/2/16.
//  Copyright © 2016 TSRaveling. All rights reserved.
//

import UIKit

extension String {
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
    
    func widthWithFont(font : UIFont) -> CGFloat {
        
        let constraint = CGSize(width: 999, height: 999)
        let bounding = self.boundingRectWithSize(constraint, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return bounding.width
    }
}