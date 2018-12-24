//
//  StoryboardManager.swift
//  YiChunSports
//
//  Created by RJ on 2018/10/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit


import UIKit
public enum SBName :String {
    case Train
}
public enum VCIdentifier :String{
    case SportReportVC
}
public class StoryboardManager: NSObject {
    
    /// 获取控制器
    ///
    /// - Parameters:
    ///   - storyBoardName: 故事板的文件名
    ///   - identifier: 控制器的唯一标识
    ///   - bundle: 资源库
    /// - Returns: 返回可为空的控制器
    public class func viewController(withStoryBoardName storyBoardName:SBName , viewControllerIdentifier identifier:VCIdentifier , bundle:Bundle? = Bundle.current) -> UIViewController {
        let storyboard = UIStoryboard(name: storyBoardName.rawValue, bundle: bundle)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier.rawValue)
        return vc
    }
    /// 获取视图
    ///
    /// - Parameters:
    ///   - nibName: xib文件名
    ///   - owner: 所属对象
    ///   - bundle: 资源库
    /// - Returns: 返回可为空的视图
    public class func view(with nibName:String, owner:Any? = nil , bundle:Bundle? = Bundle.current) -> UIView? {
        guard let nibContents = bundle?.loadNibNamed(nibName, owner: owner, options: nil) else {return nil}
        let view = nibContents[0] as? UIView
        return view
    }
}
