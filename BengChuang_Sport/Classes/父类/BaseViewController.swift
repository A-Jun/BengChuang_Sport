//
//  BaseViewController.swift
//  YiChunSports
//
//  Created by RJ on 2018/10/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

public enum RJNavBarItemLocaltion :Int {
    case left_first
    case left_second
    case right_first
    case right_second
}

open class BaseViewController: UIViewController {
    /// 获取工具栏
    open var tabBar:UITabBar? {
        get{
            return self.tabBarController?.tabBar
        }
    }
    /// 隐藏导航栏
    open var navBarHidden:Bool {
        get{
            return navigationController?.navigationBar.isHidden ?? false
        }
        set(navBarHidden){
            navigationController?.setNavigationBarHidden(navBarHidden, animated: true)
        }
    }
    /// 设置导航栏透明度 get 方法无用
    open var navBackgroundAlpha :CGFloat = 1.0{
        didSet{
            if #available(iOS 11.0, *) {
                navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: navBackgroundAlpha)), for: .default)
                navigationController?.navigationBar.shadowImage = UIImage()
            } else {
                navigationController?.navigationBar.subviews[0].alpha = navBackgroundAlpha
            }
        }
    }
    /// 设置状态栏颜色
    open var stateBarStyle  = UIStatusBarStyle.lightContent {
        didSet{
            UIApplication.shared.setStatusBarStyle(stateBarStyle, animated: true)
        }
    }
    override open func viewDidLoad() {
        super.viewDidLoad()
        stateBarStyle = .lightContent
        configureNavigation()
    }
    open func addSubview(_ subview:UIView) -> Void {
        view.addSubview(subview);
    }
    open func configureNavigation() {
        addNavBarItemBtn(.left_first, nil, UIImage.currentBundle("返回-亮"), self, #selector(exitViewController), .touchUpInside)
    }
    open func navBarHidden(_ hidden:Bool , animated:Bool) {
        navigationController?.setNavigationBarHidden(hidden, animated: animated)
    }
    /// 设置导航栏 标题栏
    open func navBarTitle(_ title:String? ,_ color:UIColor = UIColor(0x333333) , _ font:UIFont = RJFontPingFangSC_Medium(16)) -> Void {
        guard let _ = self.navigationController else { return  }
        let lable = UILabel()
        lable.text = title
        lable.textColor = color
        lable.font      = font
        
        navigationItem.titleView = lable
    }
    /// 设置导航栏按钮
    open func addNavBarItemBtn(_ localtion:RJNavBarItemLocaltion,_ title:String?,_ image:UIImage?,_ target:Any?,_ action:Selector, _ controlEvents:UIControl.Event) -> Void {
        
        guard let _ = self.navigationController else { return  }
        let btn = NavBarBtn(location: localtion)
        btn.addTarget(target, action: action, for: controlEvents)
        btn.setTitle(title, for: .normal)
        btn.setImage(image, for: .normal)
        btn.setTitleColor(UIColor(0x333333), for: .normal)
        let item = UIBarButtonItem(customView: btn)
        if title?.count != nil {
            
        }else{
            item.width = 44
        }
        switch localtion {
        case .left_first:
            btn.contentHorizontalAlignment = .left
            let leftBarButtonItems = navigationItem.leftBarButtonItems != nil ? navigationItem.leftBarButtonItems! : [UIBarButtonItem]()
            navigationItem.leftBarButtonItems = add(item, in: leftBarButtonItems,at: 0)
        case .left_second:
            btn.contentHorizontalAlignment = .left
            let leftBarButtonItems = navigationItem.leftBarButtonItems != nil ? navigationItem.leftBarButtonItems! : [UIBarButtonItem]()
            navigationItem.leftBarButtonItems = add(item, in: leftBarButtonItems,at: 1)
        case .right_first:
            btn.contentHorizontalAlignment = .right
            let rightBarButtonItems = navigationItem.rightBarButtonItems != nil ? navigationItem.rightBarButtonItems! : [UIBarButtonItem]()
            navigationItem.rightBarButtonItems = add(item, in: rightBarButtonItems, at: 1)
        case .right_second:
            btn.contentHorizontalAlignment = .right
            let rightBarButtonItems = navigationItem.rightBarButtonItems != nil ? navigationItem.rightBarButtonItems! : [UIBarButtonItem]()
            navigationItem.rightBarButtonItems = add(item, in: rightBarButtonItems, at: 1)
        }
    }
    open func addNavBarItemBtn(_ localtion:RJNavBarItemLocaltion,customView:UIView) -> Void {
        
        guard let _ = self.navigationController else { return  }
        let item = UIBarButtonItem(customView: customView)
        if title?.count != nil {
            
        }else{
            item.width = 44
        }
        switch localtion {
        case .left_first:
            let leftBarButtonItems = navigationItem.leftBarButtonItems != nil ? navigationItem.leftBarButtonItems! : [UIBarButtonItem]()
            navigationItem.leftBarButtonItems = add(item, in: leftBarButtonItems,at: 0)
        case .left_second:
            let leftBarButtonItems = navigationItem.leftBarButtonItems != nil ? navigationItem.leftBarButtonItems! : [UIBarButtonItem]()
            navigationItem.leftBarButtonItems = add(item, in: leftBarButtonItems,at: 1)
        case .right_first:
            let rightBarButtonItems = navigationItem.rightBarButtonItems != nil ? navigationItem.rightBarButtonItems! : [UIBarButtonItem]()
            navigationItem.rightBarButtonItems = add(item, in: rightBarButtonItems, at: 1)
        case .right_second:
            let rightBarButtonItems = navigationItem.rightBarButtonItems != nil ? navigationItem.rightBarButtonItems! : [UIBarButtonItem]()
            navigationItem.rightBarButtonItems = add(item, in: rightBarButtonItems, at: 1)
        }
    }
    private func add(_ item:UIBarButtonItem ,  in items:[UIBarButtonItem] , at index:Int) -> [UIBarButtonItem] {
        var newItems = items
        if newItems.count > index {
            newItems[index] = item
        }else{
            newItems.append(item)
        }
        return newItems
    }
    @objc open func exitViewController() -> Void {
        if self.navigationController != nil {
            navigationController?.popViewController(animated: true)
        }else{
            dismiss(animated: true, completion: nil)
        }
    }
}
