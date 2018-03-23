//
//  CollectionViewCell.swift
//  StudyCollectionView
//
//  Created by qwkj on 2018/3/20.
//  Copyright © 2018年 qwkj. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupSubviews() //尝试代码修改view
    }
    
    func setupSubviews() {
        textLabel?.textAlignment = NSTextAlignment.center;
    }

}
