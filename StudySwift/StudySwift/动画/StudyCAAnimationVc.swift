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
        
        circlelayer = CircleLayer.init()
        self.view.layer.addSublayer(circlelayer!)
        circlelayer?.expand()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            self.circlelayer?.wobble()
        }
        
        let triangeleLayer = TriangleLayer.init()
        self.view.layer.addSublayer(triangeleLayer)
        triangeleLayer.expand()
        
        let rectlayer = RectAnglelayer.init()
        self.view.layer.addSublayer(rectlayer)
        rectlayer.strokeFull()
        
        let waveLayer = Wavelayer.init()
        self.view.layer.addSublayer(waveLayer)
        waveLayer.drawFull()

    }
    

}
