//
//  GCDTimer.swift
//  YiChunSports
//
//  Created by RJ on 2018/11/2.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class GCDTimer: NSObject {
    
    class func scheduledTimer(target:AnyObject?,withTimeInterval Interval:DispatchTimeInterval,block:((_ timer:DispatchSourceTimer)->Void)?) -> Void {
        let timer = DispatchSource.makeTimerSource()
        timer.schedule(wallDeadline: DispatchWallTime.now(), repeating: Interval, leeway: DispatchTimeInterval.milliseconds(1))
        timer.setEventHandler {
            if target == nil {
                timer.cancel()
            }else{
                if block != nil {
                    DispatchQueue.main.async {
                        block!(timer)
                    }
                }
            }
        }
        timer.resume()
    }
}
