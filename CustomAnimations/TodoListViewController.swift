//
//  TodoListViewController.swift
//  CustomAnimations
//
//  Created by Midhet Sulemani on 10/2/19.
//  Copyright © 2019 DevFest. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {
    
    var welcomeLabel: UILabel!
    var nameLabel: UILabel!
    var underlineLabel: UIView!
    
    var colorArray = [UIColor.red, UIColor.blue, UIColor.green]
    
    let categoryArr = ["Daily Tasks", "Groceries", "Deadlines"]
    let todoDailyArr = ["Cleaning", "Cooking", "Bathing"]
    let todoGroceriesArr = ["Rice", "Mutton", "Spices"]
    let todoWorkArr = ["Work Update", "Emails", "Jira"]
    
    @IBOutlet weak var pagingScroll: UIScrollView!
    @IBOutlet var todoCategory: [UILabel]!
    @IBOutlet weak var categoryStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel = UILabel(frame: CGRect(x: 20, y: 70, width: 100, height: 25))
        welcomeLabel.text = "Welcome"
        self.view.addSubview(welcomeLabel)
        
        nameLabel = UILabel(frame: CGRect(x: 20, y: 95, width: 100, height: 25))
        nameLabel.text = "Midhet"
        self.view.addSubview(nameLabel)
        
        pagingScroll.delegate = self
        pagingScroll.isPagingEnabled = true
        pagingScroll.contentSize = CGSize(width: UIScreen.main.bounds.width * 3, height: pagingScroll.bounds.height)
        
        let todoDaily = Todo(frame: pagingScroll.bounds)
        todoDaily.addTasks(taskArray: todoDailyArr)
        pagingScroll.addSubview(todoDaily)
        
        let todoGroceries = Todo(frame: pagingScroll.bounds)
        todoGroceries.frame.origin.x += UIScreen.main.bounds.width
        todoGroceries.addTasks(taskArray: todoGroceriesArr)
        pagingScroll.addSubview(todoGroceries)
        
        let todoDeadlines = Todo(frame: pagingScroll.bounds)
        todoDeadlines.frame.origin.x += UIScreen.main.bounds.width * 2
        todoDeadlines.addTasks(taskArray: todoWorkArr)
        pagingScroll.addSubview(todoDeadlines)
        
        underlineLabel = UIView(frame: CGRect(x: 0, y: categoryStack.frame.origin.y + categoryStack.frame.height, width: todoCategory[0].intrinsicContentSize.width, height: 2))
        underlineLabel.center.x = todoCategory[0].center.x
        underlineLabel.layer.zPosition = 100
        underlineLabel.backgroundColor = UIColor.black
        self.view.addSubview(underlineLabel)
    }
}

extension TodoListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        let arrayIndex = Int(pageIndex)
        underlineLabel.center.x = todoCategory[arrayIndex].center.x
        underlineLabel.frame.size.width = todoCategory[arrayIndex].intrinsicContentSize.width
    }
}
