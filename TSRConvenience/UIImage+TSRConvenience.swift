//
//  UIImage+TSRConvenience.swift
//  TSRConvenience
//
//  Created by Timothy Raveling on 9/2/16.
//  Copyright © 2016 TSRaveling. All rights reserved.
//

import UIKit

public extension UIImage {
    
    static func loadFromURL(_ url : URL, completion : @escaping (_ img : UIImage?)->Void) {
        
        // We're going to do this in the background
        let queue = DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high)
        queue.async(execute: {
            
            // Get the data
            if let data = try? Data(contentsOf: url) {
                
                // Form the image
                if let img = UIImage(data: data) {
                    
                    DispatchQueue.main.async(execute: {
                        
                        completion(img)
                    })
                } else {
                    DispatchQueue.main.async(execute: {
                        completion(nil)
                    })
                }
            } else {
                
                DispatchQueue.main.async(execute: {
                    completion(nil)
                })
            }
        })
    }
}
