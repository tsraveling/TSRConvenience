//
//  UIScrollView+TSRConvenience.swift
//  Pods
//
//  Created by Timothy Raveling on 9/7/16.
//
//

import UIKit

public class TSRPagingScrollDelegate : NSObject, UIScrollViewDelegate {
    
    var numPages : Int = 0
    var pageControl : UIPageControl?
    var blockUponEnd : (() -> Void)?
    
    static var singleton : TSRPagingScrollDelegate?
    
    static func generateSingleton() -> TSRPagingScrollDelegate {
        singleton = TSRPagingScrollDelegate()
        return singleton!
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // Update the page control
        let pageWidth = scrollView.frame.size.width;
        let page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        
        if page < CGFloat(self.numPages) {
            self.pageControl?.currentPage = Int(page);
        }
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width;
        let page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        if Int(page) == numPages - 1 {
            blockUponEnd?()
        }
    }
}

public extension UIScrollView {
    
    /*
     *  Call this function from viewWillAppear.
     */
    func fillWithTutorial(images : [UIImage], page_control: UIPageControl, end_block : (() -> Void)?) {
        
        guard self.subviews.count == 2 else {
            print("This scrollview is filled already.")
            return
        }
        
        self.isPagingEnabled = true
        page_control.numberOfPages = images.count
        
        
        // Get the sizes to fill out
        let image_size = self.frame.size
        
        // Create the delegate
        let delegate = TSRPagingScrollDelegate.generateSingleton()
        delegate.numPages = images.count
        delegate.pageControl = page_control
        delegate.blockUponEnd = end_block
        self.delegate = delegate
        
        // Create the images
        var working_frame = CGRect(x:0,y:0,width:image_size.width,height:image_size.height)
        for img in images {
            
            let iv = UIImageView(frame: working_frame)
            iv.image = img
            iv.contentMode = .scaleAspectFit
            self.addSubview(iv)
            
            working_frame.origin.x += image_size.width
        }
        
        // Set content size
        self.contentSize = CGSize(width:working_frame.origin.x, height: image_size.height)
    }
}
