//
//  ViewController.swift
//  暴走滚动Demo
//
//  Created by Youcai on 2017/4/17.
//  Copyright © 2017年 mm. All rights reserved.
//
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT =  UIScreen.main.bounds.size.height
import UIKit
import test
private let ID = "cell"
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var headerView:UIView?
    var topView:UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 200))
        
        headerView?.backgroundColor = UIColor.red
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsets.init(top: 200, left: 0, bottom: 0, right: 0)
        //滚动条位置
        tableView.scrollIndicatorInsets = UIEdgeInsets.init(top: 200, left: 0, bottom: 0, right: 0)
        view.addSubview(tableView)
        view.addSubview(headerView!)
        topView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 64))
        
       
        view.addSubview(topView!)
        Person.eat()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = -scrollView.contentOffset.y
        print(offsetY)
        
        if offsetY <= 200 {
            headerView?.frame = CGRect.init(x: 0, y: offsetY-200, width: SCREEN_WIDTH, height: 200)
        }else
            
            if offsetY > 200 {
                headerView?.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 200)
        }
        topView?.backgroundColor = UIColor.blue.withAlphaComponent((200 - offsetY) / 200)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: ID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: ID)
        }
        cell?.textLabel?.text = "\(indexPath.row + 1)"
        return cell!
    }
}

