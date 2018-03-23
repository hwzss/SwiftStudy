//
//  ViewController.swift
//  StudySwift
//
//  Created by qwkj on 2018/3/21.
//  Copyright © 2018年 qwkj. All rights reserved.
//

import UIKit

func getAPPName() -> String{
    let nameKey = "CFBundleName"
    let appName = Bundle.main.object(forInfoDictionaryKey: nameKey) as? String
    return appName!
}

struct StudySchedule {
    var title: String
    var controllerClass: UIViewController.Type
    
    init(title: String, vcClassName: String) {
        self.title = title
        let className = getAPPName() + "." + vcClassName
        let cls: AnyClass? = NSClassFromString(className)
        self.controllerClass = cls as! UIViewController.Type
    }
    
    func contoller() -> UIViewController {
        return  controllerClass.init()
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView?
    var dataArr: NSMutableArray?
    
    private let cellIdentifier = "home_table_cell_identifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupDatas()
        self.tableView?.reloadData()
    }
    
    func setupUI() {
        self.title = "Swift学习"
        
        tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView!.dataSource = self
        tableView!.delegate = self
        tableView!.rowHeight = 70
        tableView!.tableFooterView = UIView.init()
        tableView!.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
        self.view.addSubview(tableView!)
    }
    
    func setupDatas() {
        let dict = [
                    "动画": "AnimationStudysVc",
                    "table的基本使用": "StudyTableView",
                    "collectionView的基本使用": "StudyCollectionViewVc",
                    ]
        dataArr = NSMutableArray.init()
        for (key, value) in dict {
            dataArr?.add(StudySchedule.init(title: key, vcClassName: value))
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataArr != nil) ? dataArr!.count:0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let model = dataArr![indexPath.row] as? StudySchedule
        let title = model?.title
        cell.textLabel?.text = title! as String
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataArr![indexPath.row] as? StudySchedule
        if model != nil {
            navigationController?.pushViewController(model!.contoller(), animated: true)
        }
    }
    

}

