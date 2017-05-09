//
//  ForthViewController.swift
//  SwiftButton
//
//  Created by xyqm on 16/10/20.
//  Copyright © 2016年 栾高垒. All rights reserved.
//

import UIKit

//代理
protocol ForthDelegate {
    func refreshTable(dataSource1:[String])
}

class ForthViewController: UIViewController {
    //代理
    var delegate1:ForthDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let button = UIButton.init(frame: CGRect(x:0, y:0, width:40, height:40))
        button.backgroundColor = UIColor.yellow
        button.addTarget(self, action: #selector(ForthViewController.getDelegate(button:)), for: .touchUpInside)
        button.setImage(UIImage(named:"Group"), for: .normal)
        let leftButton = UIBarButtonItem.init(customView: button)
        navigationItem.leftBarButtonItem = leftButton
        
        let title = UILabel.init(frame: CGRect(x:0, y:0, width:40, height:40))
        title.text = "第四页"
        title.textColor = UIColor.orange
        title.font = UIFont.boldSystemFont(ofSize: 20)//可以使用
//        title.font = UIFont.italicSystemFont(ofSize: 20)//不可用
        title.textAlignment = NSTextAlignment.center
        navigationItem.titleView = title
        
        let rightButton = UIButton.init(frame: CGRect(x:0, y:0, width:40, height:40))
        rightButton.backgroundColor = UIColor.yellow
        rightButton.addTarget(self, action: #selector(ForthViewController.back(button:)), for: .touchUpInside)
        rightButton.setImage(UIImage(named:"Group"), for: .normal)
        let right = UIBarButtonItem.init(customView: rightButton)
        navigationItem.rightBarButtonItem = right
        
        let next = UIButton.init(frame: CGRect(x:100, y:100, width:140, height:40))
        next.backgroundColor = UIColor.yellow
        next.addTarget(self, action: #selector(ForthViewController.goFive), for: .touchUpInside)
        next.setImage(UIImage(named:"Group"), for: .normal)
        self.view.addSubview(next)
        // Do any additional setup after loading the view.
    }
    
    func getDelegate(button:UIButton) {
        let array = ["99", "98", "97", "96", "95", "95", "100"]

        //通知:传值
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "fromForeToThird"), object: array)
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func back(button:UIButton) {
        let array = ["1", "2", "3", "4", "5", "6", "7"]
        //掉代理方法
        self.delegate1?.refreshTable(dataSource1: array)
        _ = navigationController?.popViewController(animated: true)
    }
    
    func goFive() {
        let fifth = FifthViewController()
        navigationController?.pushViewController(fifth, animated: true)
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
