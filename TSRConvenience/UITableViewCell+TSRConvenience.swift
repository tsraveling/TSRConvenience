//
//  UITableViewCell+TSRConvenience.swift
//  TSRConvenience
//
//  Created by Timothy Raveling on 9/2/16.
//  Copyright © 2016 TSRaveling. All rights reserved.
//

import UIKit

public extension UITableViewCell {
    
    static func calculateRowHeight(_ default_height: CGFloat, label_width: CGFloat, label_height : CGFloat, font: UIFont, text: String) -> CGFloat {
        
        let screen_width = UIScreen.main.bounds.size.width
        let horizontal_margin = 375 - label_width
        let real_label_width = screen_width - horizontal_margin
        let vertical_margin = default_height - label_height
        let text_height = text.heightWithConstrainedWidth(real_label_width, font: font)
        return vertical_margin + text_height
    }
}
