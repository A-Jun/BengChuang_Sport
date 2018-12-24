//
//  SportReportHeaderView.swift
//  xunlian
//
//  Created by RJ on 2018/12/10.
//  Copyright © 2018 coollang. All rights reserved.
//

import UIKit

class SportReportHeaderView: UIView {

    
    @IBOutlet weak var date: UILabel!
    //旋转
    @IBOutlet weak var rotateDes: UILabel!
    @IBOutlet weak var rotateFlag: UIView!
    @IBOutlet weak var rotateProgressView: UIView!
    @IBOutlet weak var rotate: UILabel!
    private var rotateProgressLayer = CAShapeLayer()
    private var rotateBgProgressLayer = CAShapeLayer()
    //空翻
    @IBOutlet weak var flipDes: UILabel!
    @IBOutlet weak var flipFlag: UIView!
    @IBOutlet weak var flipProgressView: UIView!
    @IBOutlet weak var flip: UILabel!
    private var flipProgressLayer = CAShapeLayer()
    private var flipBgProgressLayer = CAShapeLayer()
    //运动时长
    @IBOutlet weak var durationDes: UILabel!
    @IBOutlet weak var durationFlag: UIView!
    @IBOutlet weak var durationProgressView: UIView!
    @IBOutlet weak var duration: UILabel!
    private var durationProgressLayer = CAShapeLayer()
    private var durationBgProgressLayer = CAShapeLayer()
    //弹跳
    @IBOutlet weak var bounceDes: UILabel!
    @IBOutlet weak var bounceFlag: UIView!
    @IBOutlet weak var bounceProgressView: UIView!
    @IBOutlet weak var bounce: UILabel!
    private var bounceProgressLayer = CAShapeLayer()
    private var bounceBgProgressLayer = CAShapeLayer()

    /// 起跳加速度曲线
    @IBOutlet weak var acclerationSpeedLine: UILabel!
    /// 蹦跳加速度曲线
    @IBOutlet weak var bounceForceLine: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .themeBrown
        
        date.font = RJFontPingFangSC_Medium(12)
        date.textColor = UIColor.white
        
        rotateDes.font = RJFontPingFangSC_Regular(10)
        rotateDes.textColor = .six3
        rotateFlag.backgroundColor = .themeGreen
        rotate.font = RJFontPingFangSC_Semibold(14)
        rotate.textColor = .six3
        
        flipDes.font = RJFontPingFangSC_Regular(10)
        flipDes.textColor = .six3
        flipFlag.backgroundColor = .themeGreen
        flip.font = RJFontPingFangSC_Semibold(14)
        flip.textColor = .six3
        
        durationDes.font = RJFontPingFangSC_Regular(10)
        durationDes.textColor = .six3
        durationFlag.backgroundColor = .themeGreen
        duration.font = RJFontPingFangSC_Semibold(14)
        duration.textColor = .six3
        
        bounceDes.font = RJFontPingFangSC_Regular(10)
        bounceDes.textColor = .six3
        bounceFlag.backgroundColor = .themeGreen
        bounce.font = RJFontPingFangSC_Semibold(14)
        bounce.textColor = .six3
        
        acclerationSpeedLine.font = RJFontPingFangSC_Semibold(12)
        acclerationSpeedLine.textColor = .six3
        
        bounceForceLine.font = RJFontPingFangSC_Semibold(12)
        bounceForceLine.textColor = .six3
        
        
        rotateProgressLayer   = drawCircles(.orange)
        rotateBgProgressLayer   = drawCircles(.themeBrown)
        rotateProgressView.layer.addSublayer(rotateBgProgressLayer)
        rotateProgressView.layer.addSublayer(rotateProgressLayer)
        
        flipProgressLayer   = drawCircles(.orange)
        flipBgProgressLayer   = drawCircles(.themeBrown)
        flipProgressView.layer.addSublayer(flipBgProgressLayer)
        flipProgressView.layer.addSublayer(flipProgressLayer)
        
        durationProgressLayer = drawCircles(.orange)
        durationBgProgressLayer = drawCircles(.themeBrown)
        durationProgressView.layer.addSublayer(durationBgProgressLayer)
        durationProgressView.layer.addSublayer(durationProgressLayer)
        
        bounceProgressLayer   = drawCircles(.orange)
        bounceBgProgressLayer = drawCircles(.themeBrown)
        bounceProgressView.layer.addSublayer(bounceBgProgressLayer)
        bounceProgressView.layer.addSublayer(bounceProgressLayer)
        
        rotateProgressLayer.strokeEnd    = 0.5
        flipProgressLayer.strokeEnd     = 0.3
        durationProgressLayer.strokeEnd = 0.25
        bounceProgressLayer.strokeEnd   = 0.75
    }
    /// 画进度环
    private func drawCircles(_ color:UIColor) -> CAShapeLayer {
        let circleLayer = CAShapeLayer()
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap   = CAShapeLayerLineCap.round
        circleLayer.lineJoin  = CAShapeLayerLineJoin.round
        circleLayer.lineWidth = kAutoWid(2)
        circleLayer.strokeColor = color.cgColor
        
        
        let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: kAutoWid(21), y: kAutoWid(21)), radius: kAutoWid(20), startAngle: -.pi/2, endAngle: 3/2.0 * .pi, clockwise: true)
        circleLayer.path = circlePath.cgPath
        return circleLayer
    }
}
