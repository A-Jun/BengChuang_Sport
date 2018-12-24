//
//  TrainCourseItem.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit
let kTrainCourseItemRI = "TrainCourseItem"
class TrainCourseItem: UICollectionViewCell {

    @IBOutlet weak var bgIcon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgIcon.image = UIImage.currentBundle("课程1图像")
        title.font = RJFontPingFangSC_Semibold(19)
        subtitle.font = RJFontPingFangSC_Regular(12)
        
    }

}
