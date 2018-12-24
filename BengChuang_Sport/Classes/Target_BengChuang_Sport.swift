//
//  Target_BengChuang_Sport.swift
//  BengChuang_Sport
//
//  Created by RJ on 2018/12/12.
//

import UIKit

@objc class Target_BengChuang_Sport: NSObject {

    @objc func Action_TrainVC(_ params:[AnyHashable :Any]) -> UINavigationController {
         return  NavigationVC.init(rootViewController: TrainVC())
    }
}
