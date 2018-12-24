//
//  TrainingScoreView.swift
//  xunlian
//
//  Created by RJ on 2018/12/12.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class TrainingScoreView: UIView {
    @IBOutlet weak var totalGrade: UILabel!
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var caloriesDes: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var durationDes: UILabel!
    @IBOutlet weak var flip: UILabel!
    @IBOutlet weak var flipDes: UILabel!
    @IBOutlet weak var bounce: UILabel!
    @IBOutlet weak var bounceDes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor(0x261D32)
        
        totalGrade.font = RJFontPingFangSC_Regular(15)
        score.font      = RJFontPingFangSC_Medium(18)
        title.font      = RJFontPingFangSC_Regular(15)
        
        calories.font    =  RJFontPingFangSC_Semibold(15)
        caloriesDes.font = RJFontPingFangSC_Regular(12)
        
        duration.font    = RJFontPingFangSC_Semibold(15)
        durationDes.font = RJFontPingFangSC_Regular(12)
        
        flip.font    = RJFontPingFangSC_Semibold(15)
        flipDes.font = RJFontPingFangSC_Regular(12)
        
        bounce.font    = RJFontPingFangSC_Semibold(15)
        bounceDes.font = RJFontPingFangSC_Regular(12)
    }
}
