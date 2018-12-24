//
//  TrainCourseCell.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit
let kTrainCourseCellRI = "TrainCourseCell"
class TrainCourseCell: UITableViewCell {

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layout.itemSize = CGSize(width: kAutoWid(266), height: kAutoWid(129))
        layout.minimumLineSpacing = kAutoWid(10)
        layout.minimumInteritemSpacing = kAutoWid(0)
        layout.scrollDirection = .horizontal
        
        collection.contentInset = UIEdgeInsets.init(top: 0, left: kAutoWid(12), bottom: 0, right: kAutoWid(12))
        collection.register(UINib.init(nibName: "TrainCourseItem", bundle: Bundle.current), forCellWithReuseIdentifier: kTrainCourseItemRI)
    }
}
extension TrainCourseCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collection.dequeueReusableCell(withReuseIdentifier: kTrainCourseItemRI, for: indexPath) as! TrainCourseItem
        return item
    }
    
}
