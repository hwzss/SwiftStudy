//
//  RectAnglelayer.swift
//  StudySwift
//
//  Created by qwkj on 2018/3/22.
//  Copyright © 2018年 qwkj. All rights reserved.
//

import UIKit

class RectAnglelayer: CAShapeLayer {

    let KAnimationDuration: CFTimeInterval = 0.3
    let KAnimationBeginTime: CFTimeInterval = 0.0
    
    override init() {
        super.init()
        strokeColor = UIColor.green.cgColor
        lineJoin = kCALineCapRound
        lineWidth = 7
        fillColor = UIColor.clear.cgColor
    }
    
    //相比drawFull方法更简单的实现
    func strokeFull() {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 100, y: 400))
        path.addLine(to: CGPoint.init(x: 100, y: 300))
        path.addLine(to: CGPoint.init(x: 200, y: 300))
        path.addLine(to: CGPoint.init(x: 200, y: 400))
        path.addLine(to: CGPoint.init(x: 100, y: 400))
        path.close()
        
        self.strokeColor = UIColor.green.cgColor
        self.path = path.cgPath
        
        let animation = CABasicAnimation.init(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 2.0
        add(animation, forKey: "storke")
    }
    
    func drawFull() {
        let animation1 = CABasicAnimation.init(keyPath: "path")
        animation1.fromValue = beginPath.cgPath
        animation1.toValue = LeftPath.cgPath
        animation1.duration = KAnimationDuration
        animation1.beginTime = KAnimationBeginTime
        
        let animation2 = CABasicAnimation.init(keyPath: "path")
        animation2.fromValue = LeftPath.cgPath
        animation2.toValue = left_topPath.cgPath
        animation2.duration = animation1.duration
        animation2.beginTime = animation1.beginTime + animation1.duration
        
        let animation3 = CABasicAnimation.init(keyPath: "path")
        animation3.fromValue = left_topPath.cgPath
        animation3.toValue = top_rightPath.cgPath
        animation3.duration = animation1.duration
        animation3.beginTime = animation2.beginTime + animation2.duration
        
        
        let animation4 = CABasicAnimation.init(keyPath: "path")
        animation4.fromValue = top_rightPath.cgPath
        animation4.toValue = right_bottomPath.cgPath
        animation4.duration = animation1.duration
        animation4.beginTime = animation3.beginTime + animation3.duration
        
        let animationGroup = CAAnimationGroup.init()
        animationGroup.animations = [animation1, animation2, animation3, animation4]
        animationGroup.duration = (Double)(animationGroup.animations!.count) * KAnimationDuration
        animationGroup.fillMode = kCAFillModeForwards
        animationGroup.isRemovedOnCompletion = false
        add(animationGroup, forKey: "group")
    }
    
    var beginPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 100, y: 400))
        path.addLine(to: CGPoint.init(x: 100, y: 400))
        return path
    }
    
    var LeftPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 100, y: 400))
        path.addLine(to: CGPoint.init(x: 100, y: 300))
        return path
    }
    
    var left_topPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 100, y: 400))
        path.addLine(to: CGPoint.init(x: 100, y: 300))
        path.addLine(to: CGPoint.init(x: 200, y: 300))
        return path
    }
    
    var top_rightPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 100, y: 400))
        path.addLine(to: CGPoint.init(x: 100, y: 300))
        path.addLine(to: CGPoint.init(x: 200, y: 300))
        path.addLine(to: CGPoint.init(x: 200, y: 400))
        return path
    }
    
    var right_bottomPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 100, y: 400))
        path.addLine(to: CGPoint.init(x: 100, y: 300))
        path.addLine(to: CGPoint.init(x: 200, y: 300))
        path.addLine(to: CGPoint.init(x: 200, y: 400))
        path.addLine(to: CGPoint.init(x: 100, y: 400))
        return path
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
