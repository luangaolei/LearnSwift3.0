//
//  ThirdViewController.swift
//  SwiftButton
//
//  Created by xyqm on 16/10/17.
//  Copyright © 2016年 栾高垒. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ForthDelegate{

    var dataSource = [String]()
    
    let tableView = UITableView.init(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height), style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor .white
        let image = UIImageView.init(frame: CGRect(x:0, y:0, width:40, height:40))
        image.image = UIImage(named:"Group")
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(ThirdViewController.pop))
        image.addGestureRecognizer(tap)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: image)
        
        let label = UILabel.init(frame: CGRect(x:0, y:0, width:40, height:40))
        label.textColor = UIColor.magenta
        label.text = "第三页"
        navigationItem.titleView = label
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.separatorStyle = .singleLine
        tableView.register(ThirdTableViewCell.self, forCellReuseIdentifier: "aaa")
        view.addSubview(tableView)
        
        
        //for循环
        for x in 100 ..< 110 {
            dataSource.append("\(x)")
        }
        
        //调用带参数的方法
        var person : String!
        person = great(name: "小名", age: 12)
        print(person)
        
        //参数是数字,返回多个数据
        let aaa = returnArray(scores: [100, 20,  30, 40, 90, 80, 70, 60, 50, 10])
        print(aaa.max)
        print(aaa.min)
        print(aaa.sum)
        
        //函数可以当做参数传入另一个函数
        let numbers = [10, 20, 3, 100]
        _ = hasAnyMatches(list: numbers, condition: lessThanTen)
        
        
        
        //get/set方法
        var aaaa = 100
        var people : Int{
            get{
                return 3 * aaaa
            }
//            willSet{//设置一个新值之前运行的代码
//                print("willSet")
//            }
            set{
                aaaa = newValue / 20
            }
//            didSet{//设置一个新值之后运行的代码
//                print("didSet")
//            }
        }
        print(people)//get 当想得到属性值的时候，会调用该属性的get方法。
        people = 40
        print(aaaa)//set  当我们去设置属性值的时候，会调用该属性的set方法。当我们给属性设置值的时候，Swift会自动给我们创建一个名为newValue的常量并且可以用于set{}中。
        
        
        
        //枚举:枚举的成员值是实际值，并不是原始值的另一种表达方法
        enum Rank: Int {
            case Ace = 1
            case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
            case Jack, Queen, King
            func simpleDescription() -> String {
                switch self {
                case .Ace:
                    return "ace"
                case .Jack:
                    return "jack"
                case .Queen:
                    return "queen"
                case .King:
                    return "king"
                default:
                    return String(self.rawValue)
                }
            }
        }
        let ace = Rank.Ace
        _ = ace.rawValue//使用`rawValue`属性来访问一个枚举成员的原始值,如果没有比较有意义的原始值，你就不需要提供原始值。
        
        //通知
        NotificationCenter.default.addObserver(self, selector: #selector(ThirdViewController.getFromForth(obj:)), name: NSNotification.Name(rawValue: "fromForeToThird"), object: nil)
    }
    //通知
    func getFromForth(obj:Notification) {
        let array = obj.object
//        dataSource.removeAll()
        dataSource = array as! [String]//这是直接替换数组
        tableView.reloadData()
    }
    
    //函数可以当做参数传入另一个函数
    func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    
    
    func pop() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func clickButton(button:UIButton) {
        
        //switch
        let aaaaa = "aaaa"
        switch aaaaa {
        case "aaaa":
            print("\(button.tag)")
        default:
            break
        }
        
        //while循环
        var n = 2
        while n < 100 {
            n = n * 2
        }
        print(n)
        
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    func great(name:String, age:Int) -> String {
        return "\(name), \(age)"
    }
    
    //参数师数组,返回值多个的 方法
    func returnArray(scores:[Int]) -> (min:Int, max:Int, sum:Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        
        for score in scores {
            if score > max {
                max = score
            }else if score < min{
                min = score
            }
            sum += score
        }
        return (min, max, sum)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ThirdTableViewCell = tableView.dequeueReusableCell(withIdentifier: "aaa") as! ThirdTableViewCell
        cell.selectionStyle = .none
        
        cell.headerImage.image = UIImage(named:"Group")
        cell.clickButton.tag = indexPath.row
        cell.clickButton.addTarget(self, action: #selector(ThirdViewController.clickButton(button:)), for: .touchUpInside)
        
        cell.titleLabel.text = "第\(dataSource[indexPath.row])个cell"
        cell.clickButton.setTitle("按钮\(indexPath.row)", for: .normal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell:ThirdTableViewCell = tableView.cellForRow(at: indexPath) as! ThirdTableViewCell
        cell.clickButton.backgroundColor = UIColor.green
        cell.titleLabel.text = "点击了已经";
        //        dataSource[indexPath.row] = "点击了已经";
        ////        dataSource.remove(at: indexPath.row)
        ////        dataSource.insert("点击了已经", at: indexPath.row)
        
        //        tableView.reloadData()
        
        let forth = ForthViewController()
        forth.delegate1 = self//forth的代理是self
        navigationController?.pushViewController(forth, animated: true)
    }
    //ForthDelegate的协议方法
    func refreshTable(dataSource1: [String]) {
        dataSource = dataSource1
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.cyan
        
        return view
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

