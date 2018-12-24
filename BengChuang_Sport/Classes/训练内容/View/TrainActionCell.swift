//
//  TrainActionCell.swift
//  xunlian
//
//  Created by RJ on 2018/12/11.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit
let kTrainActionCellRI = "TrainActionCell"
class TrainActionCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        icon.image = UIImage.currentBundle("10ci")
        title.font = RJFontPingFangSC_Medium(13)
        title.textColor = .six3
        subtitle.font = RJFontPingFangSC_Medium(13)
        subtitle.textColor = .six3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
