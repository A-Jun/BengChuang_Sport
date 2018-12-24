//
//  SportReportCell.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit
let kSportReportCellRI = "SportReportCell"
class SportReportCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var describe: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        title.font = RJFontPingFangSC_Medium(11)
        title.textColor = .six3
        
        
        describe.font = RJFontPingFangSC_Regular(11)
        describe.textColor = .six9
    }

    func updateCell(_ dic:[String:Any]) {
        title.text = dic["title"] as? String
        subtitle.attributedText = String.attribute(dic["subtitle"] as? String, attributes: [NSAttributedString.Key.font:RJFontPingFangSC_Semibold(12),NSAttributedString.Key.foregroundColor:UIColor.six3], unit: dic["unit"] as? String, unitAttributes: [NSAttributedString.Key.font:RJFontPingFangSC_Regular(12),NSAttributedString.Key.foregroundColor:UIColor.six9])
        describe.text = dic["describe"] as? String
    }
    
}
