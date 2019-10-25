//
//  BaseTableViewController.swift
//  GenericsTableDemo
//
//  Created by Goutham Nanion 6/28/18.
//  Copyright © 2018 Goutham Nani. All rights reserved.
//

import UIKit

protocol Summable {
    static func +(lhs: Self, rhs: Self) -> Self
}
extension String: Summable{}
extension Int: Summable{}

func combine<T: Summable>(lhs: T, rhs: T) -> T {
    return lhs + rhs
}

// BaseTableViewController -(Generic->T)-> BaseCell -(Generic->U)-> item

class BaseTableViewController<T: BaseCell<U>, U>: UITableViewController {
    
    let cellId = "cellId"
    
    var items = [U]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(T.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
        _ = combine(lhs: 20, rhs: 30)
        _ = combine(lhs: "Mahesh", rhs: "D")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BaseCell<U>
        cell.item = items[indexPath.row]
        return cell
    }
    
}

class BaseCell<U>: UITableViewCell {
    var item: U!
}

struct Students {
    let name: String
}

class Studentscell: BaseCell<Students> {
    override var item: Students! {
        didSet {
            textLabel?.text = item.name
        }
    }
}

class StringCell: BaseCell<String> {
    override var item: String! {
        didSet {
            textLabel?.text = item
        }
    }
}

class SomeListController: BaseTableViewController<Studentscell, Students> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [
            Students(name: "Student a"),
            Students(name: "Student b"),
            Students(name: "Student c")
        ]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
    }
    
}
