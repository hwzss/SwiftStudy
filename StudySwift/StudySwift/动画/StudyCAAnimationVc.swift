//
//  StudyCAAnimationVc.swift
//  StudySwift
//
//  Created by qwkj on 2018/3/22.
//  Copyright © 2018年 qwkj. All rights reserved.
//

import UIKit

class StudyCAAnimationVc: UIViewController {

    var circlelayer: CircleLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "动画"
        self.edgesForExtendedLayout =  UIRectEdge(rawValue: 0)
        self.view.backgroundColor = UIColor.white
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        if self.view.layer.sublayers?.contains(circlelayer!) == true {
            self.circlelayer!.removeFromSuperlayer()
        }
        
        let layer1 = CAShapeLayer.init()
        layer1.fillColor = UIColor.green.cgColor
        layer1.position = CGPoint.init(x: 200, y: 200)
        layer1.path = UIBezierPath.init(rect: CGRect.init(x: 200, y: 200, width: 100, height: 100)).cgPath
        self.view.layer.addSublayer(layer1)
        self.view.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.toValue = CGFloat(M_PI * 2)
        rotationAnimation.duration = 0.45
        rotationAnimation.isRemovedOnCompletion = true
        layer1.add(rotationAnimation, forKey: nil)
        
        circlelayer = CircleLayer.init(center: CGPoint.init(x: 100, y: 100), radius: 45)
        self.view.layer.addSublayer(circlelayer!)
        circlelayer?.expand()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            self.circlelayer?.wobble()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.2) {
                let triangeleLayer = TriangleLayer.init(center: CGPoint.init(x: 100, y: 100), inSize: CGSize.init(width: 45, height: 55))
                self.view.layer.addSublayer(triangeleLayer)
                triangeleLayer.expand()
                
                 DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    triangeleLayer.transformRotationZ()
                }
            }
        }
        
        
        
 
        
        let rectlayer = RectAnglelayer.init()
        self.view.layer.addSublayer(rectlayer)
        rectlayer.strokeFull()
        
        let waveLayer = Wavelayer.init()
        self.view.layer.addSublayer(waveLayer)
        waveLayer.drawFull()

    }
    

}
