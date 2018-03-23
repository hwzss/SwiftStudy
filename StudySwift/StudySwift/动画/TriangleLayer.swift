//
//  TriangleLayer.swift
//  StudySwift
//
//  Created by qwkj on 2018/3/22.
//  Copyright © 2018年 qwkj. All rights reserved.
//

import UIKit

class TriangleLayer: CAShapeLayer {
    
    let KAnimationDuration: CFTimeInterval = 0.3
    let KAnimationBeginTime: CFTimeInterval = 0.0
    
    private let leftTranslenght = 25
    private let rightTransLenght = 25
    private let topTransLenght = 25
    
    var beginPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 220, y: 70))
        path.addLine(to: CGPoint.init(x: 190, y: 130))
        path.addLine(to: CGPoint.init(x: 250, y: 130))
        path.close()
        return path
    }
    
    var leftTransPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 220, y: 70))
        path.addLine(to: CGPoint.init(x: (190 - leftTranslenght), y: 130))
        path.addLine(to: CGPoint.init(x: 250, y: 130))
        path.close()
        return path
    }
    
    var rightTransPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 220, y: 70))
        path.addLine(to: CGPoint.init(x: (190 - leftTranslenght), y: 130))
        path.addLine(to: CGPoint.init(x: 250 + rightTransLenght, y: 130))
        path.close()
        return path
    }
    
    var topTransPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 220 , y: 70 - topTransLenght))
        path.addLine(to: CGPoint.init(x: (190 - leftTranslenght), y: 130))
        path.addLine(to: CGPoint.init(x: 250 + rightTransLenght, y: 130))
        path.close()
        return path
    }
    
    override init() {
        super.init()
        fillColor = UIColor.red.cgColor
        strokeColor = UIColor.red.cgColor
        lineWidth = 7.0
        lineJoin = kCALineJoinRound
        path = beginPath.cgPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func expand() {
        let animation1 = CABasicAnimation.init(keyPath: "path")
        animation1.fromValue = beginPath.cgPath
        animation1.toValue = leftTransPath.cgPath
        animation1.duration = KAnimationDuration
        animation1.beginTime = KAnimationBeginTime
        
        let animation2 = CABasicAnimation.init(keyPath: "path")
        animation2.fromValue = leftTransPath.cgPath
        animation2.toValue = rightTransPath.cgPath
        animation2.duration = animation1.duration
        animation2.beginTime = animation1.beginTime + animation1.duration
        
        let animation3 = CABasicAnimation.init(keyPath: "path")
        animation3.fromValue = rightTransPath.cgPath
        animation3.toValue = topTransPath.cgPath
        animation3.duration = animation1.duration
        animation3.beginTime = animation2.beginTime + animation2.duration
        
        let animationGroup = CAAnimationGroup.init()
        animationGroup.animations = [animation1, animation2, animation3]
        animationGroup.duration = (Double)(animationGroup.animations!.count) * KAnimationDuration
        animationGroup.fillMode = kCAFillModeForwards
        animationGroup.isRemovedOnCompletion = false
        add(animationGroup, forKey: "group")
    }
    
}
