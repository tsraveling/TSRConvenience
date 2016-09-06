//
//  UIImage+TSRConvenience.swift
//  TSRConvenience
//
//  Created by Timothy Raveling on 9/2/16.
//  Copyright © 2016 TSRaveling. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func loadFromURL(url : NSURL, completion : (img : UIImage?)->Void) {
        
        // We're going to do this in the background
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
        dispatch_async(queue, {
            
            // Get the data
            if let data = NSData(contentsOfURL: url) {
                
                // Form the image
                if let img = UIImage(data: data) {
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        completion(img: img)
                    })
                } else {
                    dispatch_async(dispatch_get_main_queue(), {
                        completion(img:nil)
                    })
                }
            } else {
                
                dispatch_async(dispatch_get_main_queue(), {
                    completion(img:nil)
                })
            }
        })
    }
}