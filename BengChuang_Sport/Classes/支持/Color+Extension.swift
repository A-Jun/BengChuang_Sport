//
//  Color+Extension.swift
//  YiChunSports
//
//  Created by RJ on 2018/10/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

public extension UIColor{
    
    static let tableViewBackgroundColor = UIColor.init(0xF5F5F5)
    
    static let six9                   = UIColor(0x999999)
    static let six6                   = UIColor(0x666666)
    static let six3                   = UIColor(0x333333)
    static let hex_fe                 = UIColor(0xfefefe)
    static let themeGreen             = UIColor(0x26C58B)
    static let themeBrown             = UIColor(0x584F60)
    static let progressBG             = UIColor(0xbddccf)
    
    convenience public init(_ hex:NSInteger , _ alpha:CGFloat){
        let red   = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue  = CGFloat((hex & 0xFF) ) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    convenience public init(_ hex:NSInteger){
        self.init(hex, 1)
    }
    
}
public extension UIImage {
    static func imageWithColor(_ color:UIColor) -> UIImage? {
        
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
