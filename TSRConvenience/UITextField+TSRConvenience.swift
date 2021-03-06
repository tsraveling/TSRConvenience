//
//  UITextField.swift
//  TSRConvenience
//
//  Created by Timothy Raveling on 9/2/16.
//  Copyright © 2016 TSRaveling. All rights reserved.
//

import UIKit

public extension UITextField {
    
    func setPlaceholderColor(_ col : UIColor) {
        
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [
            NSForegroundColorAttributeName : col,
            NSFontAttributeName : self.font! ])
    }
}
