//
//  mycell.swift
//  requist_api
//
//  Created by pop on 12/11/19.
//  Copyright © 2019 pop. All rights reserved.
//

import UIKit

class mycell: UITableViewCell {

    @IBOutlet weak var idlb: UILabel!
    @IBOutlet weak var titlelb: UILabel!
    
    func configur(id : Int , title : String){
        self.idlb.text = String(id)
        self.titlelb.text = title
        
    }
}
