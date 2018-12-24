//
//  RJPlayer.swift
//  xunlian
//
//  Created by RJ on 2018/12/11.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit
import AVFoundation
class RJPlayer: UIView {
    //MARK: - 公开属性
    /// 资源文件url
    public var urls = [URL](){
        didSet{
            for url in urls {
                let playItem = AVPlayerItem.init(asset: AVAsset.init(url: url))
                playerItems.append(playItem)
            }
        }
    }
    
    /// 当前项目播放时间
    public var currentItemTime :TimeInterval {
        get{
            let currentTime = player.currentTime()
            return TimeInterval(currentTime.value) / TimeInterval(currentTime.timescale)
        }
    }
    /// 当前项目总时长
    public var currentItemDuration :TimeInterval {
        get {
            guard let duration = player.currentItem?.asset.duration else { return 0.0 }
            return TimeInterval(duration.value) / TimeInterval(duration.timescale)
        }
    }
    /// 所有项目的总时长
    public var totalItemsDuration : TimeInterval {
        get {
            var  totalDuration :TimeInterval = 0
            for index in 0..<playerItems.count {
                let item = playerItems[index]
                let duration = item.asset.duration
                if duration.timescale == 0 {continue}
                totalDuration += TimeInterval(duration.value) / TimeInterval(duration.timescale)
            }
            
            return totalDuration
        }
    }
    /// 当前项目播放进度
    public var currentItemPlayProgress :CGFloat {
        return CGFloat(currentItemTime) / CGFloat(currentItemDuration)
    }
    /// 当前项目播放在总时长内的进度
    public var currentItemPlayProgressInAllItems :CGFloat {
        guard let currentItem = player.currentItem else { return 0.0 }
        var currentItemIndex = 0
        var duration :TimeInterval = currentItemTime
        guard let itemIndex = playerItems.index(currentItem) else {
            return CGFloat(duration) / CGFloat(totalItemsDuration)
        }
        currentItemIndex = itemIndex
        for index in 0..<currentItemIndex {
            duration += TimeInterval(playerItems[index].asset.duration.value) / TimeInterval(playerItems[index].asset.duration.timescale)
        }
        return CGFloat(duration) / CGFloat(totalItemsDuration)
    }
    /// 正在播放
    public var isPlaying :Bool{
        return player.rate != 0
    }
    /// 自动播放下一集
    public var isAutoPlayNextItem : Bool = false
    
    
    //MARK: - 私有属性
    /// 播放资源文件
    private var playerItems = [AVPlayerItem]()
    /// 播放器
    private lazy var player : AVPlayer = {
        let player = AVPlayer.init(playerItem: playerItems.first)
        playerLayer.player = player
        player.actionAtItemEnd = .pause
        return player
    }()
    
    /// 播放图层
    private var playerLayer = AVPlayerLayer()
    
    override var frame: CGRect{
        didSet{
            playerLayer.frame = bounds
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        playerLayer = AVPlayerLayer()
        playerLayer.frame = bounds
        playerLayer.videoGravity = .resize
        self.layer.insertSublayer(playerLayer, at: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - 播放功能
    /// 播放
    func play(_ completion:(()->Void)? = nil)  {
        
        switch player.status {
        case .readyToPlay:
            DispatchQueue.main.async {
                self.player.play()
                if completion != nil {
                    completion!()
                }
            }
        case .unknown:
            DispatchQueue.global().async {
                self.play(completion)
            }
        case .failed:
//            showMessage(item?.error, animated: true)
            break
        }
    }
    /// 暂停
    func pause() {
        player.pause()
    }
    /// 前一个项目
    func foreItem() {
        let currentItem = player.currentItem
        guard let currentIndex = playerItems.index(currentItem) else {return}
        if currentIndex - 1 >= 0 {
            let item = playerItems[currentIndex - 1]
            player.replaceCurrentItem(with: item)
            play()
        }
    }
    /// 下一个项目
    func nextItem() {
        let currentItem = player.currentItem
        guard let currentIndex = playerItems.index(currentItem) else {return}
        if currentIndex + 1 < playerItems.count {
            let item = playerItems[currentIndex + 1]
            player.replaceCurrentItem(with: item)
            play()
        }
    }
    //MARK: - 私有方法
    
}
