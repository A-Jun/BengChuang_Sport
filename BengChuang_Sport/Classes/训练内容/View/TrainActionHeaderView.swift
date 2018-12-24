//
//  TrainActionHeaderView.swift
//  xunlian
//
//  Created by RJ on 2018/12/11.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class TrainActionHeaderView: UIView {
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        title.font = RJFontPingFangSC_Semibold(14)
        title.textColor = .six3
    }
}
