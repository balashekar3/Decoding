//
//  ViewController.swift
//  Test
//
//  Created by apple on 31/01/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let address: Address
    let company: Company
    
    struct Address: Codable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        let geo: Coordinates
        
        struct Coordinates: Codable {
            let lat: String
            let lng: String
        }
    }
    
    struct Company: Codable {
        let name: String
        let catchPhrase: String
        let bs: String
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func fetch(){
        let url=URL(string:"https://jsonplaceholder.typicode.com/users")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
                if error==nil{
                    let serverData = try JSONDecoder().decode([User].self, from: data!)
                    for jsondata in serverData{
                        print(jsondata)
                        print(" User id is : \(jsondata.id)\n" ,
                        "User name is : \(jsondata.name)\n",
                        "User username is : \(jsondata.username)\n",
                        "User email is : \(jsondata.email)\n",
                        "User phone is : \(jsondata.phone)\n",
                        "User website is : \(jsondata.website)\n",
                            "User address is :\(jsondata.address)",
                            "User company is : \(jsondata.company)"
                        )
                    }
                    
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()

}

}
