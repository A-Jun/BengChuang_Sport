//
//  TrainingVC.swift
//  xunlian
//
//  Created by RJ on 2018/12/11.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class TrainingVC: UIViewController {
    private var tarinView = TrainingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tarinView = Bundle.current.loadNibNamed("TrainingView", owner: nil, options: nil)?.first as! TrainingView
        tarinView.frame = view.bounds
        view.addSubview(tarinView)
    }
    
}
