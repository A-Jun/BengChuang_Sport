//
//  UIView+Extension.swift
//  YiChunSports
//
//  Created by RJ on 2018/10/17.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

extension UIView {
    public var viewController: UIViewController? {
        get{
            var nextResponder: UIResponder? = self
            
            repeat {
                nextResponder = nextResponder?.next
                
                if let viewController = nextResponder as? UIViewController {
                    return viewController
                }
                
            } while nextResponder != nil
            
            return nil
        }
    }
}

