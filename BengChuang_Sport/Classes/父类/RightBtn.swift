//
//  RightBtn.swift
//  YiChunSports
//
//  Created by RJ on 2018/10/12.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit
@IBDesignable
class RightBtn: UIButton {
    @IBInspectable var imageViewX :CGFloat = 0.0
    override func layoutSubviews() {
        super.layoutSubviews()
        let tempWith  = (titleLabel?.width ?? 0) + (imageView?.width ?? 0)
        titleLabel?.x = (width - tempWith - imageViewX)/2.0
        imageView?.x  = imageViewX + (titleLabel?.x ?? 0) + (titleLabel?.width ?? 0)
    }
}
