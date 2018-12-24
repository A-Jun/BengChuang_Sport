//
//  Bundle+Extension.swift
//  BengChuang_Sport
//
//  Created by RJ on 2018/12/12.
//

import UIKit

public extension Bundle {
    public static var current :Bundle {
        get{
            return Bundle(for: TrainingVC.self)
//            Bundle(path: Bundle(for: TrainingVC.self).path(forResource: "BengChuang_Sport", ofType: ".framework")!)!
        }
    }
}

public extension UIImage {
    
    public class func currentBundle(_ name:String?) -> UIImage?{
        let scale = UIScreen.main.scale
        let curBundle = Bundle(for: TrainVC.self)
        guard let infoDictionary =  curBundle.infoDictionary else { return nil }
        guard let bundleName = infoDictionary[(kCFBundleNameKey as String )] else { return nil }
        let curBundleName = bundleName as! String
        let curBundleDirectory = String(format: "%@.bundle", curBundleName)
        let image2x = String(format: "%@@2x.png", name ?? "")
        let image3x = String(format: "%@@3x.png", name ?? "")
        if scale == 2.0 {
            let path2x = curBundle.path(forResource: image2x, ofType: nil, inDirectory: curBundleDirectory)
            if path2x != nil {
                return UIImage(contentsOfFile: path2x!)
            }else{
                let path3x = curBundle.path(forResource: image3x, ofType: nil, inDirectory: curBundleDirectory)
                if path3x != nil {
                    return UIImage(contentsOfFile: path3x!)
                }else{
                    return nil
                }
            }
        }
        if scale == 3.0 {
            let path3x = curBundle.path(forResource: image3x, ofType: nil, inDirectory: curBundleDirectory)
            if path3x != nil {
                return UIImage(contentsOfFile: path3x!)
            }else{
                let path2x = curBundle.path(forResource: image2x, ofType: nil, inDirectory: curBundleDirectory)
                if path2x != nil {
                    return UIImage(contentsOfFile: path2x!)
                }else{
                    return nil
                }
            }
        }
        return  nil
    }
    
}
