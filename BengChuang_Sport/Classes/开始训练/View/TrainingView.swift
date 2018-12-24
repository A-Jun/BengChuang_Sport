
//
//  TrainingView.swift
//  xunlian
//
//  Created by RJ on 2018/12/11.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class TrainingView: UIView {

    
    @IBOutlet weak var exitBtn: UIButton!
    @IBOutlet weak var rightBarBtn: UIButton!
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var sectionProgressView: UIView!
    @IBOutlet weak var rowProgressView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var forewordBtn: UIButton!
    @IBOutlet weak var backwordBtn: UIButton!
    
    private var sectionProgressLayer = CAShapeLayer()
    private var rowProgressLayer     = CAShapeLayer()

    private var player = RJPlayer()

    override var frame: CGRect{
        didSet{
            player.frame = bounds
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        exitBtn.setImage(UIImage.currentBundle("退出"), for: .normal)
        rightBarBtn.setImage(UIImage.currentBundle("JINRI-亮"), for: .normal)
        playBtn.setImage(UIImage.currentBundle("播放"), for: .normal)
        forewordBtn.setImage(UIImage.currentBundle("后退"), for: .normal)
        backwordBtn.setImage(UIImage.currentBundle("前进"), for: .normal)
        title.font = RJFontPingFangSC_Semibold(24)
        title.textColor = UIColor.white
        
        subtitle.font = RJFontPingFangSC_Medium(18)
        subtitle.textColor = UIColor.white
        
        sectionProgressLayer = drawLineLayer(start: CGPoint(x: 0, y: kAutoWid(2.5)), end: CGPoint(x: kScreenW, y: kAutoWid(2.5)), color: UIColor.themeGreen, lineWidth: 5)
        rowProgressLayer     = drawLineLayer(start: CGPoint(x: 0, y: kAutoWid(32)), end: CGPoint(x: kScreenW, y: kAutoWid(32)), color: UIColor.themeGreen, lineWidth: kAutoWid(64))
        
        sectionProgressView.layer.addSublayer(sectionProgressLayer)
        rowProgressView.layer.insertSublayer(rowProgressLayer, at: 0)
        
        sectionProgressLayer.strokeEnd = 0.5
        rowProgressLayer.strokeEnd    = 0.0
        
        
        player = RJPlayer.init(frame: bounds)
        player.isAutoPlayNextItem = true
        player.urls = [URL(string: "https://lymanli-1258009115.cos.ap-guangzhou.myqcloud.com/video/sample/sample-video1.mp4")!,URL(string: "https://lymanli-1258009115.cos.ap-guangzhou.myqcloud.com/video/sample/sample-video2.mp4")!,URL(string: "https://lymanli-1258009115.cos.ap-guangzhou.myqcloud.com/video/sample/sample-video1.mp4")!]
        insertSubview(player, at: 0)
    }
    
    
    
    
    
   //MARK: - 点击事件
    /// 退出界面
    @IBAction func exitClicked(_ sender: Any) {
        
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    /// 点击右侧导航栏按钮
    @IBAction func rightBarBtnClicked(_ sender: Any) {

    }
    /// 点击播放暂停
    @IBAction func playBtnClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            player.play {
                self.beginPlay()
            }
        }else{
            player.pause()
        }
    }
    
    /// 前一个视频
    @IBAction func forewordBtnClick(_ sender: Any) {
        player.foreItem()
        rowProgressLayer.strokeEnd = 0.0
    }
    /// 后一个视频
    @IBAction func backwordBtnClick(_ sender: UIButton) {
        player.nextItem()
        rowProgressLayer.strokeEnd = 0.0
    }
    
    //MARK: - 私有方法
    /// 开始播放
    private func beginPlay() {
        thumbImage.image = nil
        updateUIWithPlay()
    }
    /// 随着播放更新进度
    private func updateUIWithPlay(){
        GCDTimer.scheduledTimer(target: self, withTimeInterval: DispatchTimeInterval.milliseconds(100)) { (timer) in
            self.rowProgressLayer.strokeEnd = self.player.currentItemPlayProgress
            self.sectionProgressLayer.strokeEnd = self.player.currentItemPlayProgressInAllItems
            //播放下一个视频
            if self.rowProgressLayer.strokeEnd >= 1.0 {
                self.player.nextItem()
                self.rowProgressLayer.strokeEnd = 0.0
            }
            //结束播放
            if self.sectionProgressLayer.strokeEnd >= 1.0 || !self.player.isPlaying {
                timer.cancel()
                self.endPlay()
            }
            
        }
        
    }
    /// 结束播放
    private func endPlay() {
        thumbImage.image = UIImage.currentBundle("地面延伸")
        popScoreView()
    }
    /// 弹出评分视图
    private func popScoreView() {
        let view = Bundle.current.loadNibNamed("TrainingScoreView", owner: nil, options: nil)?.first as! TrainingScoreView
        view.frame = CGRect(x: (self.width - kAutoWid(300))/2, y:height , width: kAutoWid(300), height: kAutoWid(300))
        addSubview(view)
        UIView.animate(withDuration: 0.25) {
            view.frame = CGRect(x: (self.width - kAutoWid(300))/2, y:(self.height - kAutoWid(300))/2 , width: kAutoWid(300), height: kAutoWid(300))
        }
    }
    /// 画播放进度
    ///
    /// - Parameters:
    ///   - start: 起始点
    ///   - end: 终点
    ///   - color: 画笔颜色
    ///   - lineWidth: 线宽
    /// - Returns: 返回的图层
    private func drawLineLayer(start:CGPoint , end:CGPoint ,color:UIColor , lineWidth:CGFloat) ->CAShapeLayer {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = color.cgColor
        layer.lineWidth   = lineWidth
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        layer.path = path.cgPath
        return layer
    }
}
