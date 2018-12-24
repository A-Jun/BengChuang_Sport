//
//  Array+Extension.swift
//  GuangTi
//
//  Created by RJ on 2018/11/20.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

extension Array where Element :Equatable {
    /// 获取元素下标
    ///
    /// - Parameter element: 元素
    /// - Returns: 下标
    public func index(_ element:Element?) -> Int? {
        var currentIndex = -1
        guard let element = element else { return nil }
        for index in 0 ..< self.count {
            if self[index] == element {
                currentIndex = index
            }
        }
        return currentIndex == -1 ? nil : currentIndex
    }
}
