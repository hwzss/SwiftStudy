//
//  CircleLayer.swift
//  StudySwift
//
//  Created by qwkj on 2018/3/22.
//  Copyright © 2018年 qwkj. All rights reserved.
//

import UIKit

class CircleLayer: CAShapeLayer {
    
    let KAnimationDuration: CFTimeInterval = 0.3
    let KAnimationBeginTime: CFTimeInterval = 0.0
    
    var beginPath: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 100, y: 100, width: 0, height: 0))
    }
    
    var endFullPath: UIBezierPath {
         return UIBezierPath.init(ovalIn: CGRect.init(x: 50, y: 50, width: 100, height: 100))
    }
    
    var circleVerticalSquishPath: UIBezierPath {
        return UIBezierPath.init(ovalIn: CGRect.init(x: 50, y: 60, width: 100, height: 80))
    }
    
    var circleHorizontalSquishPath: UIBezierPath {
        return UIBezierPath.init(ovalIn: CGRect.init(x: 60, y: 50, width: 80, height: 100))
    }
    
    override init() {
        super.init()
        self.fillColor = UIColor.red.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func expand() {
        let expandAnimation: CABasicAnimation = CABasicAnimation.init(keyPath: "path")
        expandAnimation.fromValue = beginPath.cgPath
        expandAnimation.toValue = endFullPath.cgPath
        expandAnimation.duration = 0.3
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.isRemovedOnCompletion = false
        add(expandAnimation, forKey: "expand")
    }
    
    func wobble() {
        let animation1 = CABasicAnimation.init(keyPath: "path")
        animation1.fromValue = endFullPath.cgPath
        animation1.toValue = circleVerticalSquishPath.cgPath
        animation1.beginTime = 0.0
        animation1.duration = 0.3
        
        let animation2 = CABasicAnimation.init(keyPath: "path")
        animation2.fromValue = circleVerticalSquishPath.cgPath
        animation2.toValue = circleHorizontalSquishPath.cgPath
        animation2.beginTime = animation1.beginTime + animation1.duration
        animation2.duration = animation1.duration
        
        let animation3 = CABasicAnimation.init(keyPath: "path")
        animation3.fromValue = circleHorizontalSquishPath.cgPath
        animation3.toValue = circleVerticalSquishPath.cgPath
        animation3.beginTime = animation2.beginTime + animation2.duration
        animation3.duration = animation1.duration
        
        let animation4 = CABasicAnimation.init(keyPath: "path")
        animation4.fromValue = circleVerticalSquishPath.cgPath
        animation4.toValue = endFullPath.cgPath
        animation4.beginTime = animation3.beginTime + animation3.duration
        animation4.duration = animation1.duration
        
        let animationGroup = CAAnimationGroup.init()
        animationGroup.animations = [animation1, animation2, animation3, animation4]
        animationGroup.duration = (Double)((animationGroup.animations!.count)) * 0.3
        animationGroup.repeatCount = 2
        add(animationGroup, forKey: "wobble")
    }
    
}
