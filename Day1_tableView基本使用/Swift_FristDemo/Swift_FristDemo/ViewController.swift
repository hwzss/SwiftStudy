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
        self.view.addSubview(tableView)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: CellIndentifier);
        
        let book0 = Book.init(name: "我是Swift书", price: 23.6);
        dataArr.append(book0)
        dataArr.append(book0)
        dataArr.append(book0)
        dataArr.append(book0)
        
        tableView.reloadData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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




