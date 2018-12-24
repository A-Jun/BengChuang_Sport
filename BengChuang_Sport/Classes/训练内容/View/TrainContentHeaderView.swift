
//
//  TrainContentHeaderView.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class TrainContentHeaderView: UIView {
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var check: RJButton!
    
    @IBOutlet weak var calorieDes: UILabel!
    @IBOutlet weak var calorie: UILabel!
    
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var durationDes: UILabel!
    
    @IBOutlet weak var difficultyDes: UILabel!
    @IBOutlet weak var difficulty: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgImage.image = UIImage.currentBundle("课程1图像")
        check.setImage(UIImage.currentBundle("右箭头"), for: .normal)
    }
}
