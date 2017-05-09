//
//  SixthViewController.swift
//  SwiftButton
//
//  Created by xyqm on 16/10/21.
//  Copyright © 2016年 栾高垒. All rights reserved.
//

import UIKit
protocol SixDelegate {
    func toFifth(color:UIColor)
}

class SixthViewController: UIViewController, FifthDelegate {
    
    var delegate : SixDelegate?
    
    let titleLabel = UILabel.init(frame: CGRect(x:0, y:0, width:40, height:40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orange
        
        let button = UIButton.init(frame: CGRect(x:0, y:0, width:40, height:40))
        button.backgroundColor = UIColor.yellow
        button.addTarget(self, action: #selector(ForthViewController.getDelegate(button:)), for: .touchUpInside)
        button.setImage(UIImage(named:"Group"), for: .normal)
        let leftButton = UIBarButtonItem.init(customView: button)
        navigationItem.leftBarButtonItem = leftButton
        
        titleLabel.textColor = UIColor.orange
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)//可以使用
        titleLabel.textAlignment = NSTextAlignment.center
        navigationItem.titleView = titleLabel

        // Do any additional setup after loading the view.
    }
    
    func getDelegate(button:UIButton) {
        let color = UIColor.cyan
        self.delegate?.toFifth(color: color)
        _ = navigationController?.popViewController(animated: true)
    }
    
    func toSix(text: String) {
        titleLabel.text = text
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
