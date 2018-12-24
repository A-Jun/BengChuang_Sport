//
//  SportRecortHeaderView.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class SportRecordHeaderView: UIView {
    @IBOutlet weak var flag: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        flag.backgroundColor = UIColor(0x26C58B)
        title.font = RJFontPingFangSC_Semibold(14)
        title.textColor = .six3
    }
}
