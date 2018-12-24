//
//  SportRecordCell.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit
let kSportRecordCellRI = "SportRecordCell"
class SportRecordCell: UITableViewCell {

    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var report: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        title.font = RJFontPingFangSC_Semibold(13)
        title.textColor = .six3
        
        subtitle.font = RJFontPingFangSC_Regular(13)
        subtitle.textColor = .six6
        
        report.titleLabel?.font = RJFontPingFangSC_Regular(10)
        report.setTitleColor(.white, for: .normal)
        report.backgroundColor = UIColor(0x26C58B)
        
        
    }

    
    @IBAction func reportClicked(_ sender: Any) {
        let vc = SportReportVC()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
