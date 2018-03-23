//
//  Wavelayer.swift
//  StudySwift
//
//  Created by qwkj on 2018/3/23.
//  Copyright © 2018年 qwkj. All rights reserved.
//

import UIKit

class Wavelayer: CAShapeLayer {

    private let beginPoint = CGPoint.init(x: 100, y: 500)
    private let endPoint = CGPoint.init(x: 200, y: 500)
    
    override init() {
        super.init()
        lineWidth = 7
        lineCap = kCALineCapRound
        lineJoin = kCALineCapRound
        strokeColor = UIColor.green.cgColor
        fillColor = UIColor.green.cgColor
    }
    
    var beginPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: beginPoint)
        path.addCurve(to: endPoint, controlPoint1: CGPoint.init(x: 125, y: 450), controlPoint2: CGPoint.init(x: 175, y: 550))
        path.addLine(to: CGPoint.init(x: 200, y: 510))
        path.addLine(to: CGPoint.init(x: 100, y: 510))
        path.close()
        return path
    }
    
    var thirdPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 100, y: 480))
        path.addCurve(to: CGPoint.init(x: 200, y: 480), controlPoint1: CGPoint.init(x: 125, y: 480 - 40), controlPoint2: CGPoint.init(x: 175, y: 480 + 30))
        path.addLine(to: CGPoint.init(x: 200, y: 510))
        path.addLine(to: CGPoint.init(x: 100, y: 510))
        path.close()
        return path
    }
    
    var fouthPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 100, y: 450))
        path.addCurve(to: CGPoint.init(x: 200, y: 450), controlPoint1: CGPoint.init(x: 125, y: 450 + 30), controlPoint2: CGPoint.init(x: 175, y: 450 - 30))
        path.addLine(to: CGPoint.init(x: 200, y: 510))
        path.addLine(to: CGPoint.init(x: 100, y: 510))
        path.close()
        return path
    }
    
    var fifthPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 100, y: 430))
        path.addCurve(to: CGPoint.init(x: 200, y: 430), controlPoint1: CGPoint.init(x: 125, y: 430 + 30), controlPoint2: CGPoint.init(x: 175, y: 430 - 30))
        path.addLine(to: CGPoint.init(x: 200, y: 510))
        path.addLine(to: CGPoint.init(x: 100, y: 510))
        path.close()
        return path
    }
    
    var sixthPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 100, y: 430))
        path.addCurve(to: CGPoint.init(x: 200, y: 430), controlPoint1: CGPoint.init(x: 125, y: 430 + 1), controlPoint2: CGPoint.init(x: 175, y: 430 - 1))
        path.addLine(to: CGPoint.init(x: 200, y: 510))
        path.addLine(to: CGPoint.init(x: 100, y: 510))
        path.close()
        return path
    }
    
    var secondPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: beginPoint)
        path.addCurve(to: endPoint, controlPoint1: CGPoint.init(x: 130, y: 540), controlPoint2: CGPoint.init(x: 170, y: 440))
        path.addLine(to: CGPoint.init(x: 200, y: 510))
        path.addLine(to: CGPoint.init(x: 100, y: 510))
        path.close()
        return path
    }
    
    func drawFull() {
        let animation1 = CABasicAnimation.init(keyPath: "path")
        animation1.fromValue = beginPath.cgPath
        animation1.toValue = secondPath.cgPath
        animation1.duration = 0.3
        
        let animation2 = CABasicAnimation.init(keyPath: "path")
        animation2.fromValue = secondPath.cgPath
        animation2.toValue = thirdPath.cgPath
        animation2.duration = animation1.duration
        animation2.beginTime = animation1.beginTime + animation1.duration
        
        
        let animation3 = CABasicAnimation.init(keyPath: "path")
        animation3.fromValue = thirdPath.cgPath
        animation3.toValue = fouthPath.cgPath
        animation3.duration = animation1.duration
        animation3.beginTime = animation2.beginTime + animation2.duration
        
        
        let animation4 = CABasicAnimation.init(keyPath: "path")
        animation4.fromValue = fouthPath.cgPath
        animation4.toValue = fifthPath.cgPath
        animation4.duration = animation1.duration
        animation4.beginTime = animation3.beginTime + animation3.duration
        
        let animation5 = CABasicAnimation.init(keyPath: "path")
        animation5.fromValue = fifthPath.cgPath
        animation5.toValue = sixthPath.cgPath
        animation5.duration = animation1.duration
        animation5.beginTime = animation4.beginTime + animation4.duration
        
        let animationGroup = CAAnimationGroup.init()
        animationGroup.animations = [animation1, animation2, animation3, animation4, animation5]
        animationGroup.duration = (Double)(animationGroup.animations!.count) * animation1.duration
        animationGroup.fillMode = kCAFillModeForwards
        animationGroup.isRemovedOnCompletion = false
        add(animationGroup, forKey: "wave")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
