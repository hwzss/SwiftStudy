//
//  AnimationStudysVc.swift
//  StudySwift
//
//  Created by qwkj on 2018/3/22.
//  Copyright © 2018年 qwkj. All rights reserved.
//

import UIKit

class AnimationStudysVc: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        super.setupUI()
        self.title = "动画学习"
    }
    
    override func setupDatas() {
        let dict = [
            "基础动画": "StudyAnimationVc",
            "CA动画": "StudyCAAnimationVc",
            ]
        dataArr = NSMutableArray.init()
        for (key, value) in dict {
            dataArr?.add(StudySchedule.init(title: key, vcClassName: value))
        }
    }

}
