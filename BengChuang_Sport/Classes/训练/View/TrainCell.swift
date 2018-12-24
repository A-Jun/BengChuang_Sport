//
//  TrainCourseCell.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit
let kTrainCellRI = "TrainCell"
class TrainCell: UITableViewCell {
    @IBOutlet weak var bgIcon: UIImageView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgIcon.image = UIImage.currentBundle("课程1图像")
        visualEffectView.backgroundColor = UIColor(0xFF009C)
        
        title.font = RJFontPingFangSC_Semibold(21)
        title.textColor = .white
        
        subtitle.font = RJFontPingFangSC_Regular(12)
        subtitle.textColor = .white
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
