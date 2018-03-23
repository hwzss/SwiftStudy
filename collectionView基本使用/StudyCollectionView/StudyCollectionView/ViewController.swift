//
//  ViewController.swift
//  StudyCollectionView
//
//  Created by qwkj on 2018/3/20.
//  Copyright © 2018年 qwkj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var collectionView: UICollectionView?;
    var dataArr = [Int]();
    private let cellIdentifier = "cell_identifier";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift CollectionView使用";
        self.setUpUI();
        self.initDatas();
        collectionView?.reloadData();
    }
    
    func setUpUI() {
        let collectionLayout = UICollectionViewFlowLayout.init();
        collectionLayout.scrollDirection = UICollectionViewScrollDirection.vertical;
        collectionLayout.itemSize = CGSize.init(width: 88, height: 88);
        collectionLayout.minimumLineSpacing = 6;
        collectionLayout.minimumInteritemSpacing = 6;
        
        collectionView = UICollectionView.init(frame: self.view.bounds,  collectionViewLayout: collectionLayout);
        collectionView?.backgroundColor = UIColor.white;
        collectionView?.frame = self.view.bounds;
        collectionView?.dataSource = self;
        collectionView?.delegate = self;
        collectionView?.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: cellIdentifier);
        
        self.view.addSubview(collectionView!);
    }
    
    func initDatas() {
        let nums = 1...88;
        for num in nums {
            dataArr.append(num);
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath);
        cell.backgroundColor = UIColor.purple;
        return cell;
    }

}

