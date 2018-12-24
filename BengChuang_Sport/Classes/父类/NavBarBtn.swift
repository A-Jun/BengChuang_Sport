//
//  byn.swift
//  YiChunSports
//
//  Created by RJ on 2018/10/12.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class NavBarBtn: UIButton {
    var location: RJNavBarItemLocaltion = .left_first
    convenience init(location:RJNavBarItemLocaltion) {
        self.init()
        self.location = location
    }
    override func layoutSubviews() {
        super.layoutSubviews()
       
        switch location {
        case .left_first,.left_second:
            
            if (titleLabel?.text?.count == 0 || titleLabel?.text == nil) {
                size = CGSize(width: 44, height: 44)
                imageView?.x = 0
            }
            if (imageView?.image != nil && titleLabel?.text?.count != nil) {
                height = 44
                imageView!.x = self.width - imageView!.width
                titleLabel?.x = 0
                let offset = (width - imageView!.width - titleLabel!.width)/2.0 >= 0 ? (width - imageView!.width - titleLabel!.width)/2.0 : 0
                contentEdgeInsets = UIEdgeInsets(top: 0, left: 0 , bottom: 0, right: offset)
            }
        default:
            if (titleLabel?.text?.count == 0 || titleLabel?.text == nil) {
                size = CGSize(width: 44, height: 44)
                imageView?.x = self.width - imageView!.width
            }
            if (imageView?.image != nil && titleLabel?.text?.count != nil) {
                height = 44
                imageView!.x = self.width - imageView!.width
                titleLabel?.x = 0
                let offset = (width - imageView!.width - titleLabel!.width)/2.0 >= 0 ? (width - imageView!.width - titleLabel!.width)/2.0 : 0
                contentEdgeInsets = UIEdgeInsets(top: 0, left: offset , bottom: 0, right: 0)
            }
            
        }
    }
}
