//
//  Date+Extension.swift
//  YiChunSports
//
//  Created by RJ on 2018/10/29.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

extension Date {
    
    /// 系统时间与格林时间偏移量
    static var timeOffset :TimeInterval
    {
        get
        {
            return Double(TimeZone.current.secondsFromGMT())
        }
    }
    /// 系统日期 系统时区
    static var systemDate :Date
    {
        get
        {
            let timeOffset = Double(TimeZone.current.secondsFromGMT())
            return Date.init(timeIntervalSinceNow: timeOffset)
        }
    }
    /// 今天的开始 零时区
    static var startOfCurrentDay:Date
    {
        get
        {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let dateString = formatter.string(from: Date())
            return formatter.date(from: dateString)!
        }
    }
    /// 日期 系统时区 "yyyy-MM-dd"
    static var currentSystemDay:String
    {
        get
        {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter.string(from: Date())
        }
    }
     /// 日期 系统时区 分割方式 自定义
    static func currentSystemDay(_ separtor:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy\(separtor)MM\(separtor)dd"
        return formatter.string(from: Date())
    }
    /// 返回指定格式的系统时区的日期字符串
    ///
    /// - Parameter style: 格式 "yyyy-MM-dd"
    /// - Returns: 日期字符串
    func toSystemTimeZoneStringWithStyle(_ style:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = style
        return formatter.string(from: self)
    }
}
