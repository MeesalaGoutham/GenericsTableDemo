//
//  AppDelegate.swift
//  GenericsTableDemo
//
//  Created by Goutham Nani on 6/28/18.
//  Copyright © 2018 Goutham Nani. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        window?.rootViewController = EmployeesTableViewController()
        
        
        return true
    }
    
    // Model / ViewModel
    struct Person {
        let firstName, lastName: String
    }

    // View
    class PersonCell: GenericCell<Person> {
        override var item: Person! {
            didSet {
                textLabel?.text = "\(item.firstName) \(item.lastName)"
            }
        }
    }

    // Controller
    class PeopleController: GenericTableViewController<PersonCell, Person> {
        override func viewDidLoad() {
            super.viewDidLoad()
            items = [Person(firstName: "Mahesh", lastName: "D"),
                     Person(firstName: "Goutham", lastName: "M"),
                     Person(firstName: "Bhav", lastName: "K")]
        }
    }


}

