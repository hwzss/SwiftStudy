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
    
    var center: CGPoint = CGPoint.zero
    var size: CGSize = CGSize.zero
    
    private let leftTranslenght: CGFloat = 25.0
    private let rightTransLenght: CGFloat = 25.0
    private let topTransLenght: CGFloat = 25.0
    
    var originalTop: CGPoint {
        return CGPoint.init(x: center.x, y: center.y - size.height * 0.5)
    }
    
    var originalLeft: CGPoint {
        return CGPoint.init(x: center.x - size.width * 0.5, y: center.y + size.height * 0.5)
    }
    
    var originalRight: CGPoint {
        return CGPoint.init(x: center.x + size.width * 0.5, y: center.y + size.height * 0.5)
    }
    
    var beginPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: originalTop)
        path.addLine(to: originalLeft)
        path.addLine(to: originalRight)
        path.close()
        return path
    }
    
    var leftTransPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: originalTop)
        path.addLine(to: CGPoint.init(x: (originalLeft.x - leftTranslenght), y: originalLeft.y))
        path.addLine(to: originalRight)
        path.close()
        return path
    }
    
    var rightTransPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: originalTop)
        path.addLine(to: CGPoint.init(x: (originalLeft.x - leftTranslenght), y: originalLeft.y))
        path.addLine(to: CGPoint.init(x: originalRight.x + rightTransLenght, y: originalRight.y))
        path.close()
        return path
    }
    
    var topTransPath: UIBezierPath {
        let path = UIBezierPath.init()
        path.move(to: CGPoint.init(x: originalTop.x , y: originalTop.y - topTransLenght))
        path.addLine(to: CGPoint.init(x: (originalLeft.x - leftTranslenght), y: originalLeft.y))
        path.addLine(to: CGPoint.init(x: originalRight.x + rightTransLenght, y: originalRight.y))
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
    
    convenience init (center: CGPoint, inSize size: CGSize) {
        self.init()
        self.center = center
        self.size = size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func transformRotationZ() {
        let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat(M_PI * 2)
        rotationAnimation.duration = 0.45
        rotationAnimation.isRemovedOnCompletion = true
        add(rotationAnimation, forKey: nil)
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
