//
//  ViewController.swift
//  Swift_FristDemo
//
//  Created by qwkj on 2017/7/19.
//  Copyright © 2017年 qwkj. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var tableView = UITableView();
    var dataArr = [Book]();
    private let CellIndentifier = "SwiftBookCellID";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift旅程1(基本语法与tableView)";
        
        tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.plain);
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.tableFooterView = UIView.init();
        tableView.rowHeight = 66;
        self.view.addSubview(tableView);
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: CellIndentifier);
        
        dataArr = self.initDatas();
        
        tableView.reloadData();
    }
    
    func initDatas() -> [Book] {
        var  tempArr = [Book]();
        let nums = 1...5;
        for _ in nums {
        let book0 = Book.init(name: "我是一本Swift书", price: 23.6);
            tempArr.append(book0)
        }
        return tempArr;
    }

    //MARK: tableView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIndentifier, for: indexPath);
        let book = dataArr[indexPath.row];
        let title = "😯\(book.name!)"+"!厉害了";
        cell.textLabel?.text = title;
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("don't touch my book,嘿嘿");
    }
        
    
}
/** 
 #记录:
 * Swift3中不再有
 for int;condition;exp{
 }语法。直接使用for in
 
 * 原来定义静态变量统一为static 修饰. swift 2.0中类中静态变量为Class修饰
 
 * "_"为通配符，表示可以忽略该值。就如上面的for in语句。由于遍历体里并未用到nums中的值，所以可以直接忽略。
 
 */



