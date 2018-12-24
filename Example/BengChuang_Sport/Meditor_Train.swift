//
//  Meditor_Train.swift
//  BengChuang_Sport_Example
//
//  Created by RJ on 2018/12/12.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import CTMediator
public enum SportAction : String {
    case viewController
}
public var defaultParams :[AnyHashable :Any] = ["defaultKey":"defaultValue",
                                                kCTMediatorParamsKeySwiftTargetModuleName:"BengChuang_Sport"]
public extension CTMediator {
    
    @objc public class func loginHomeViewController() -> UINavigationController {
        return  CTMediator.sharedInstance().performTarget("BengChuang_Sport", action: "TrainVC", params: defaultParams, shouldCacheTarget: true) as! UINavigationController
    }
}

