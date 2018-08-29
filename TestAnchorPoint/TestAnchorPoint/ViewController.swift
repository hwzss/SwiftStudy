//
//  ViewController.swift
//  TestAnchorPoint
//
//  Created by qwkj on 2018/3/23.
//  Copyright © 2018年 qwkj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let layer1 = CAShapeLayer.init()
//        layer1.backgroundColor = UIColor.red.cgColor
//        layer1.frame = CGRect.init(x: 123, y: 123, width: 100, height: 100)
//        self.view.layer.addSublayer(layer1)
//        
//        let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
//        rotationAnimation.toValue = CGFloat(M_PI * 2)
//        rotationAnimation.duration = 0.45
//        rotationAnimation.isRemovedOnCompletion = true
//        layer1.add(rotationAnimation, forKey: nil)

        layer1.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        layer1.backgroundColor = UIColor.red.cgColor
        layer1.fillColor = UIColor.green.cgColor
        layer1.path = UIBezierPath.init(rect: CGRect.init(x: 12, y: 0, width: 100, height: 100)).cgPath
        self.view.layer.addSublayer(layer1)
        layer1.position = CGPoint.init(x: 200, y: 200)
        layer1.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat(M_PI * 2)
        rotationAnimation.duration = 0.45
        rotationAnimation.isRemovedOnCompletion = true
        layer1.add(rotationAnimation, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

