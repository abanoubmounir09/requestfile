//
//  api-helper.swift
//  requist_api
//
//  Created by pop on 12/11/19.
//  Copyright © 2019 pop. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class api_helper: NSObject {
    
    static let url = "https://jsonplaceholder.typicode.com/todos"
    //
    static let url2 = "https://jsonplaceholder.typicode.com/todos/1"
    class func load_data(completion:@escaping (_ task:[task]?)->Void)
    {
        var data1 = [task]()
        Alamofire.request(url).responseJSON { (response) in
            switch response.result{
            case .failure(let error):
                print(error)
            case .success(let value):
                //print(value)
                let json = JSON(value)
                /*let id1 = json["id"]
                let title = json["title"]
                print("id is = \(id1), title is = \(title) ")*/
                
               guard let dataarr = json.array else{print("error to be array");
                    return }
               
                for dd in dataarr{
                    guard let dd = dd.dictionary else{return}
                    let task1 = task()
                    task1.id = dd["id"]?.int ?? 0
                    task1.title = dd["title"]?.string ?? "nil"
                    //append to array
                    data1.append(task1)
                }
                completion(data1)
            }
        }
       
    }//end method


}
