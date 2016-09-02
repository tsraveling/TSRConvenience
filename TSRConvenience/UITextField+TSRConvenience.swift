//
//  UITextField.swift
//  TSRConvenience
//
//  Created by Timothy Raveling on 9/2/16.
//  Copyright © 2016 TSRaveling. All rights reserved.
//

import Foundation

extension UITextField {
    
    func setPlaceholderColor(col : UIColor) {
        
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [
            NSForegroundColorAttributeName : col,
            NSFontAttributeName : self.font! ])
    }
}
