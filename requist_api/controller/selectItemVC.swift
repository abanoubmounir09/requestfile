//
//  selectItemVC.swift
//  requist_api
//
//  Created by pop on 12/25/19.
//  Copyright © 2019 pop. All rights reserved.
//

import UIKit

class selectItemVC: UIViewController {
    
    @IBOutlet weak var idLB: UILabel!
    @IBOutlet weak var titleLb: UILabel!
    var task1 = task()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.idLB.text = String(self.task1.id)
        self.titleLb.text = self.task1.title
        print("u selected title \(self.task1.title), and id is \(self.task1.id) ")
        
    }
    func update(task2:task){
        self.task1.title = task2.title
        self.task1.id = task2.id
    }

    @IBAction func backBTN(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   
}
