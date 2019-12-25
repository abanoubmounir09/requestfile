//
//  ViewController.swift
//  requist_api
//
//  Created by pop on 12/11/19.
//  Copyright © 2019 pop. All rights reserved.


import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var searchbar: UISearchBar!
    var Tasks = [task]()
    var searchresult = [task]()
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        searchbar.delegate = self
        handle()
    }

    private func handle(){
        print("start test")
        api_helper.load_data { (tasks2:[task]?) in
            if let tasks1 = tasks2{
                self.Tasks = tasks1
                self.searchresult = self.Tasks
                self.tableview.reloadData()
            }
        }
       
    }// end func
    
  
    

}

// tableview
extension ViewController:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchresult.count/25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell2") as? mycell
        let title = self.searchresult[indexPath.row].title
        let id = self.searchresult[indexPath.row].id
        cell?.configur(id: id, title: title)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = searchresult[indexPath.row]
        guard let selectItemvc = storyboard?.instantiateViewController(withIdentifier: "itemVC") as? selectItemVC else {return}
        selectItemvc.update(task2: item)
        present(selectItemvc, animated: true, completion: nil)

    }
    
}

 // search bar
extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text != "" {
        searchresult = Tasks.filter({ (item) -> Bool in
            if let text1 = searchBar.text{
            return item.title.lowercased().contains(text1.lowercased())}
            return true
            }
          )
        tableview.reloadData()
        } // end if
        else{
            searchresult = Tasks
            tableview.reloadData()
        }
        
    }//func
    
}//class
