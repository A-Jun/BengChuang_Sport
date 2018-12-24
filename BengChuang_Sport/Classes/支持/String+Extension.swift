//
//  String+Extension.swift
//  GuangTi
//
//  Created by RJ on 2018/12/5.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

extension String{
    var isEmail :Bool {
        get{
            let regular = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
            return predicate.evaluate(with: self)
        }
    }
    var isPhoneNumber:Bool{
        get{
            let regular = "^1[3-8]\\d{9}$"
            let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
            return predicate.evaluate(with: self)
        }
    }
    /// 数值单位字符串
    static func attribute(_ value:String? ,
                   attributes:[NSAttributedString.Key : Any]?,
                   unit:String? ,
                   unitAttributes:[NSAttributedString.Key : Any]?) -> NSMutableAttributedString {
        let valueAtt = NSMutableAttributedString.init(string: value ?? "", attributes:attributes)
        let unitAtt  = NSMutableAttributedString.init(string: unit ?? "", attributes:unitAttributes)
        valueAtt.append(unitAtt)
        return valueAtt
    }
}
