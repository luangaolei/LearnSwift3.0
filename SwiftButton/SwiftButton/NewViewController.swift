//
//  NewViewController.swift
//  SwiftButton
//
//  Created by xyqm on 16/10/17.
//  Copyright © 2016年 栾高垒. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancelBBItemClick))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.red
        
        let label = UILabel.init(frame: CGRect(x:0, y:0, width:40, height:40))
        label.textColor = UIColor.magenta
        label.text = "第二页"
        navigationItem.titleView = label
        
        let button = UIButton(frame:CGRect(x:100, y:100, width:100, height:100))
        button.setTitle("哈哈", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.view.addSubview(button)
        
        let buttonView = MyButton.init(frame: CGRect(x:220, y:300, width:50, height:100))
        self.view.addSubview(buttonView)
        
    }
    
    func cancelBBItemClick() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func buttonClick() {
        let third = ThirdViewController()
        navigationController?.pushViewController(third, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
