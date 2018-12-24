//
//  TodaySportView.swift
//  xunlian
//
//  Created by RJ on 2018/12/7.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class TodaySportView: UIView {
    
    @IBOutlet weak var todaySport: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var totalDes: UILabel!
    
    @IBOutlet weak var durationDes: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var durationUnit: UILabel!
    @IBOutlet weak var caloriesDes: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var caloriesUnit: UILabel!
    @IBOutlet weak var maxHeight: UILabel!
    @IBOutlet weak var maxHeightDes: UILabel!
    @IBOutlet weak var maxHeightUnit: UILabel!
    
    @IBOutlet weak var sportReport: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        todaySport.font = RJFontPingFangSC_Semibold(15)
        todaySport.textColor = .six3
        totalDes.font   = RJFontPingFangSC_Semibold(12)
        totalDes.textColor = .six6
        
        duration.font   = RJFontPingFangSC_Semibold(18)
        duration.textColor = .six3
        durationDes.font = RJFontPingFangSC_Medium(11)
        durationDes.textColor = .six6
        durationUnit.font = RJFontPingFangSC_Medium(11)
        durationUnit.textColor = .six6
        
        calories.font   = RJFontPingFangSC_Semibold(18)
        calories.textColor = .six3
        caloriesDes.font = RJFontPingFangSC_Medium(11)
        caloriesDes.textColor = .six6
        caloriesUnit.font = RJFontPingFangSC_Medium(11)
        caloriesUnit.textColor = .six6
        
        maxHeight.font   = RJFontPingFangSC_Semibold(18)
        maxHeight.textColor = .six3
        maxHeightDes.font = RJFontPingFangSC_Medium(11)
        maxHeightDes.textColor = .six6
        maxHeightUnit.font = RJFontPingFangSC_Medium(11)
        maxHeightUnit.textColor = .six6
        
        sportReport.titleLabel?.font = RJFontPingFangSC_Medium(11)
        sportReport.setTitleColor(UIColor.white, for: .normal)
        sportReport.backgroundColor = .six3
        
    }
    @IBAction func sportReportClicked(_ sender: Any) {
        let vc = SportReportVC()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
