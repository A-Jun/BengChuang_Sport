//
//  TrainCourseHeaderView.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class TrainCourseHeaderView: UIView {

    @IBOutlet weak var arrowBtn: UIButton!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        arrowBtn.setImage(UIImage.currentBundle("右箭头"), for: .normal)
        
        title.font = RJFontPingFangSC_Regular(15)
        title.textColor = .six3
    }
    
    @IBAction func arrowClicked(_ sender: UIButton) {
        let vc = CourseDetailVC()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
