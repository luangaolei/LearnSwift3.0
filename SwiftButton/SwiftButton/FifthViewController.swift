//
//  FifthViewController.swift
//  SwiftButton
//
//  Created by xyqm on 16/10/21.
//  Copyright © 2016年 栾高垒. All rights reserved.
//

import UIKit

protocol FifthDelegate{
    func toSix(text:String)
}

class FifthViewController: UIViewController, SixDelegate {

    var delegate : FifthDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.yellow
        
        let title = UILabel.init(frame: CGRect(x:0, y:0, width:40, height:40))
        title.text = "第五页"
        title.textColor = UIColor.orange
        title.font = UIFont.boldSystemFont(ofSize: 20)//可以使用
        title.textAlignment = NSTextAlignment.center
        navigationItem.titleView = title
        
        let button = UIButton.init(frame: CGRect(x:100, y:100, width:140, height:40))
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.setTitle("到第六页", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(FifthViewController.buttonClick), for: .touchUpInside)
        self.view.addSubview(button)
        
        // Do any additional setup after loading the view.
    }
    
    func buttonClick() {
        let six = SixthViewController()
        self.delegate = six//正向代理
        six.delegate = self//反向代理传值
        self.delegate?.toSix(text: "从第五页来到第六页了")
        navigationController?.pushViewController(six, animated: true)
    }
    
    func toFifth(color: UIColor) {
        self.view.backgroundColor = color
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
