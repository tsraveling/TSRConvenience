//
//  NSAttributedString+TSRConvenience.swift
//  TSRConvenience
//
//  Created by Timothy Raveling on 9/2/16.
//  Copyright © 2016 TSRaveling. All rights reserved.
//

import UIKit

public extension NSAttributedString {
    
    func heightWithConstrainedWidth(_ width: CGFloat) -> CGFloat {
        
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        return boundingBox.height
    }
    
    static func stringWithHTML(_ html: String, css_file: String) -> NSAttributedString {
        
        // Get CSS from file
        let css_path = Bundle.main.path(forResource: css_file, ofType: "css")!
        let css_string : String
        do {
            css_string = try String(contentsOfFile: css_path)
        } catch {
            css_string = ""
        }
        
        print(css_string)
        
        // Fill HTML using the content and that css
        let base_html = "<html>"                    +
            "    <head>"                +
            "        <style>"           +
            "            \(css_string)" +
            "        </style>"          +
            "    </head>"               +
            "    <body>"                +
            "        \(html)"           +
            "    </body>"               +
        "</html>"
        
        // Generate attributed text
        let return_string : NSAttributedString
        do {
            return_string = try NSAttributedString(data: base_html.data(using: String.Encoding.utf8)!, options: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType], documentAttributes: nil)
        } catch {
            return_string = NSAttributedString(string: "Invalid Source")
        }
        
        // Return the data
        return return_string
    }
}
