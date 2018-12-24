//
//  TrainCourseView.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class TrainCourseView: UIView {

    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var add: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        add.setImage(UIImage.currentBundle("加"), for: .normal)
        
        title.font = RJFontPingFangSC_Semibold(14)
        title.textColor = .six3
        
    }
    @IBAction func addClicked(_ sender: Any) {
       let vc =  TrainCourseVC()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
