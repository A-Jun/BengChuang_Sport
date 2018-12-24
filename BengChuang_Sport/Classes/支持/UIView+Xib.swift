//
//  UIView+Xib.swift
//  YiChunSports
//
//  Created by RJ on 2018/10/11.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit
@IBDesignable
extension UIView{
    
    /// 圆角
    @IBInspectable var cornerRadius: CGFloat {
        set{
            layer.cornerRadius = kAutoWid(newValue)
            layer.masksToBounds = true
        }
        get{
            return  layer.cornerRadius
        }
    }
    /// 边框颜色
    @IBInspectable var borderColor: UIColor? {
        set{
            layer.borderColor = newValue?.cgColor
        }
        get{
            return  layer.borderColor == nil ? UIColor(cgColor: layer.borderColor!) : UIColor.white
        }
    }
    /// 边框宽度
    @IBInspectable var borderWidth: CGFloat {
        set{
            layer.borderWidth = newValue
        }
        get{
            return  layer.borderWidth
        }
    }
    /// 阴影偏移量
    @IBInspectable var shadowOffset: CGSize {
        set{
            layer.shadowOffset = CGSize(width: newValue.width, height: newValue.height)
            
            layer.masksToBounds = false
        }
        get{
            return  layer.shadowOffset
        }
    }
    /// 阴影 颜色
    @IBInspectable var shadowColor: UIColor? {
        set{
            layer.shadowColor = newValue!.cgColor
        }
        get{
            return  UIColor(cgColor: layer.shadowColor!)
        }
    }
    /// 阴影 弧度
    @IBInspectable var shadowRadius: CGFloat {
        set{
            layer.shadowRadius = kAutoWid(newValue)
        }
        get{
            return   layer.shadowRadius
        }
    }
    /// 阴影 不透明度
    @IBInspectable var shadowOpacity: Float {
        set{
            layer.shadowOpacity = newValue
        }
        get{
            return   layer.shadowOpacity
        }
    }
    
    /// 圆角裁剪 四个角 layer
    ///
    /// - Parameters:
    ///   - radius: 角度
    ///   - borderWidth:边界宽度
    ///   - borderColor: 边界颜色
    public func cornerCutWith(_ radius:CGFloat, _ borderWidth:CGFloat = 0.1, _ borderColor:UIColor = .clear) -> Void {
        
        let  lineWidth = 2 * borderWidth
        let cutLayer = CAShapeLayer()
        cutLayer.frame       = self.bounds
        cutLayer.strokeColor = borderColor.cgColor
        cutLayer.fillColor   = UIColor.clear.cgColor
        cutLayer.lineWidth   = lineWidth
        cutLayer.path        = cornerPath(radius)
        layer.addSublayer(cutLayer)
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame       = self.bounds
        maskLayer.path        = cornerPath(radius - lineWidth)
        layer.mask            = maskLayer
    }
    
    /// 圆角路径
    ///
    /// - Parameter radius: 圆角半径
    /// - Returns: 路线
    private
    func cornerPath(_ radius:CGFloat) -> CGPath {
        let path = UIBezierPath()
        
        let leftBotPoint = CGPoint(x: radius, y: self.height - radius)
        path.addArc(withCenter: leftBotPoint, radius: radius, startAngle: .pi / 2.0, endAngle: .pi, clockwise: true)
        
        let leftTopPoint = CGPoint(x: radius, y: radius)
        path.addArc(withCenter: leftTopPoint, radius: radius, startAngle: .pi, endAngle: -.pi / 2.0, clockwise: true)
        
        path.addLine(to: CGPoint(x: self.width - radius, y: 0))
        
        let rightTopPoint = CGPoint(x: self.width - radius, y: radius)
        path.addArc(withCenter: rightTopPoint, radius: radius, startAngle: -.pi/2.0, endAngle: 0, clockwise: true)
        
        let rightBotPoint = CGPoint(x: self.width - radius, y: self.height - radius)
        path.addArc(withCenter: rightBotPoint, radius: radius, startAngle: 0, endAngle: .pi/2.0, clockwise: true)
        
        path.addLine(to: CGPoint(x: radius, y: self.height))
        
        return path.cgPath
    }
    /// 设置部分圆角(绝对布局)
    ///
    /// - Parameters:
    ///   - corners: 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
    ///   - radii: 需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
    public func corners(_ corners:UIRectCorner , radii:CGSize) -> Void {
        let runded = UIBezierPath.init(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: radii)
        let  shape = CAShapeLayer()
        shape.path = runded.cgPath
        layer.mask = shape
    }
    /// 设置部分圆角(相对布局)
    ///
    /// - Parameters:
    ///   - corners: 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
    ///   - radii: 需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
    public func corners(_ corners:UIRectCorner , radii:CGSize,viewRect:CGRect) -> Void {
        let runded = UIBezierPath.init(roundedRect: viewRect, byRoundingCorners: corners, cornerRadii: radii)
        let  shape = CAShapeLayer()
        shape.frame = viewRect
        shape.path = runded.cgPath
        layer.mask = shape
    }
}

