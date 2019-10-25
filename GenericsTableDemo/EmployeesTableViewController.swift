//
//  EmployeesTableViewController.swift
//  GenericsTableDemo
//
//  Created by Goutham Nani on 10/24/19.
//  Copyright © 2019 Goutham Nani. All rights reserved.
//

import UIKit

struct Employee {
    let name: String
    let age: Int
}

class EmployeeCell: BaseCell<Employee> {
    override var item: Employee! {
        didSet{
            textLabel?.text = item.name
            detailTextLabel?.text = "\(item.age)"
        }
    }
}

class EmployeesTableViewController: BaseTableViewController<EmployeeCell, Employee> {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = [Employee(name: "Mahesh", age: 30),
                 Employee(name: "Goutham", age: 30),
                 Employee(name: "Bhav", age: 28),
                 Employee(name: "d", age: 30),
                 Employee(name: "j", age: 30),
                 Employee(name: "k", age: 28)]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = SomeListController()
        present(controller, animated: true, completion: nil)
    }

}
