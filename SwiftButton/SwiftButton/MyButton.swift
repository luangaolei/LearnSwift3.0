//
//  MyButton.swift
//  SwiftButton
//
//  Created by xyqm on 16/10/13.
//  Copyright © 2016年 栾高垒. All rights reserved.
//

import UIKit

class MyButton: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let button = UIButton.init(frame: CGRect(x:0, y:0, width:50, height:100))
        button.setTitle("你好", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.backgroundColor = UIColor.yellow
        button.setImage(UIImage(named:"Group"), for: .normal)
        button.addTarget(self, action: #selector(MyButton.buttonClick), for: .touchUpInside)
        self.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonClick() {
        print("你好")
    }


}
