//
//  TableViewCell.swift
//  YiChunSports
//
//  Created by RJ on 2018/10/13.
//  Copyright © 2018 coollang. All rights reserved.
//
import UIKit
@objc enum ImageDirection:Int {
    case left
    case right
    case top
    case bottom
}
@IBDesignable
class RJButton: UIButton {
    /// 0 left 1 right 2 top 3 bottom
    @IBInspectable var imageDirection : Int = 0
    /// 图片和文字x轴上的间距
    @IBInspectable var imageViewX :CGFloat = 0.0
    /// 图片和文字x轴上的间距
    @IBInspectable var imageViewY :CGFloat = 0.0
    override func layoutSubviews() {
        super.layoutSubviews()
        switch imageDirection {
        case 0:
            layoutImageDirectionLeft()
        case 1:
            
            width = ((titleLabel?.width ?? 0) + (imageView?.width ?? 0) + imageViewX) < width ? width : ((titleLabel?.width ?? 0) + (imageView?.width ?? 0) + imageViewX)
            let tempWith  = (titleLabel?.width ?? 0) + (imageView?.width ?? 0)
            titleLabel?.x = (width - tempWith - imageViewX)/2.0
            imageView?.x  = imageViewX + (titleLabel?.x ?? 0) + (titleLabel?.width ?? 0)
        case 2:
            height = ((titleLabel?.height ?? 0) + (imageView?.height ?? 0) + imageViewX) < height ? height : (titleLabel?.height ?? 0) + (imageView?.height ?? 0) + imageViewX
            titleLabel?.sizeToFit()
            let tempHeight  = (titleLabel?.height ?? 0) + (imageView?.height ?? 0)
            imageView?.y = (height - tempHeight - imageViewY)/2.0
            titleLabel?.y  = imageViewY + (imageView?.y ?? 0) + (imageView?.height ?? 0)
            imageView?.centerX = width / 2.0
            titleLabel?.centerX = width / 2.0
        default:
            height = ((titleLabel?.height ?? 0) + (imageView?.height ?? 0) + imageViewX) < height ? height : (titleLabel?.height ?? 0) + (imageView?.height ?? 0) + imageViewX
            break
        }
    }
    private func layoutImageDirectionLeft() -> Void {
        width = ((titleLabel?.width ?? 0) + (imageView?.width ?? 0) + imageViewX) < width ? width : ((titleLabel?.width ?? 0) + (imageView?.width ?? 0) + imageViewX)
        let tempWith  = (titleLabel?.width ?? 0) + (imageView?.width ?? 0)
        switch contentHorizontalAlignment {
        case .left,.leading:
            imageView?.x   = 0
            titleLabel?.x  = imageViewX + (imageView?.x ?? 0) + (imageView?.width ?? 0)
        case .center:
            imageView?.x   = (width - tempWith - imageViewX)/2.0
            titleLabel?.x  = imageViewX + (imageView?.x ?? 0) + (imageView?.width ?? 0)
        case .right,.trailing:
            titleLabel?.x  = width - (titleLabel?.width ?? 0)
            imageView?.x   =  (width - tempWith - imageViewX)/2.0
        case .fill:
            imageView?.x = (width - tempWith - imageViewX)/2.0
            titleLabel?.x  = imageViewX + (imageView?.x ?? 0) + (imageView?.width ?? 0)
        }
        
    }
}
