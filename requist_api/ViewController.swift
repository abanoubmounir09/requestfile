//
//  ViewController.swift
//  requist_api
//
//  Created by pop on 12/11/19.
//  Copyright © 2019 pop. All rights reserved.


import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
     var Tasks = [task]()
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        handle()
    }

    private func handle(){
        print("start test")
        api_helper.load_data { (tasks2:[task]?) in
            if let tasks1 = tasks2{
                self.Tasks = tasks1
                self.tableview.reloadData()
            }
        }
    }// end func
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell2") as? mycell
        let title = self.Tasks[indexPath.row].title
        //print("title is \(title)")
        let id = self.Tasks[indexPath.row].id
        cell?.configur(id: id, title: title)
        return cell!
    }
    

}



