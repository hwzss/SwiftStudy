//
//  ViewController.swift
//  StudyAnimation
//
//  Created by qwkj on 2018/3/21.
//  Copyright © 2018年 qwkj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animationView: UIView?
    var animationView2: UIView?
    var remindLabel: UILabel?
    private let animationDruation = 0.4

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.title = "Swift 动画学习"
        
        let x = 22
        let w = 100
        let h = 100
        animationView = UIView.init(frame: CGRect.init(x: x, y: 100, width: w, height: h));
        animationView!.backgroundColor = UIColor.red
        
        animationView2 = UIView.init(frame: CGRect.init(x: 200, y: 300, width: w, height: h));
        animationView2!.backgroundColor = UIColor.red
        
        self.view.addSubview(animationView!)
        self.view.addSubview(animationView2!)
        
        remindLabel = UILabel.init(frame: CGRect.init(x: 0, y: self.view.frame.height - 44, width: self.view.frame.width, height: 44))
        remindLabel!.text = "点击View开始动画"
        remindLabel!.textAlignment = .center
        self.view.addSubview(remindLabel!)
    }
    
    func doAllAnimations() {
        //移动Y
        animationView?.frame.origin.x += 23
        //旋转
        animationView2?.transform = animationView2!.transform.rotated(by: CGFloat.pi * 0.25)
        //scale
        animationView2?.transform = animationView2!.transform.scaledBy(x: 1.1, y: 1.1)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: animationDruation, animations: { 
            self.doAllAnimations()
        }, completion: { (finish) in
            self.remindLabel?.text = "再来"
        })
    }

}

