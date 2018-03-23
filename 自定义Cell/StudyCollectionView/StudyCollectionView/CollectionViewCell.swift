//
//  CollectionViewCell.swift
//  StudyCollectionView
//
//  Created by qwkj on 2018/3/20.
//  Copyright © 2018年 qwkj. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var textLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubviews();
    }
    
    //系统强制要求实现
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        textLabel = UILabel.init(frame: self.bounds);
        textLabel?.font = UIFont.systemFont(ofSize: 28.0);
        textLabel?.textColor = UIColor.white;
        textLabel?.textAlignment = NSTextAlignment.center;
        self.contentView.addSubview(textLabel!);
    }
}
