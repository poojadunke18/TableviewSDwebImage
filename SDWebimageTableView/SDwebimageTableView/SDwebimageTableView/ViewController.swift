//
//  ViewController.swift
//  SDwebimageTableView
//
//  Created by Mac on 12/03/23.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
var users = [Users]()
    override func viewDidLoad() {
        super.viewDidLoad()
     fetchdata()
        tableView.delegate = self
        tableView.dataSource =
        self
        let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PostTableViewCell")
    }
    func fetchdata(){
        let url = URL(string: "https://reqres.in/api/users?page=2")
var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request){ data, response, error in
            print(data)
            print(response)
            print(error)
            let getjsonObject = try! JSONSerialization.jsonObject(with: data!) as! [String: Any]
            let jsonarr = getjsonObject["data"] as! [[String: Any]]
            for dictionary in jsonarr{
                let userfirstname = dictionary["first_name"] as! String
                let userAvatar = dictionary["avatar"]as! String
                let newObj = Users(first_name: userfirstname, avatar: userAvatar)
                self.users.append(newObj)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
        }
    }
        ;dataTask.resume()

}
}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
        let post = users[indexPath.row]
        cell.usernameLabel?.text = post.first_name
        let url = URL(string: users[indexPath.row].avatar)
        cell.myImage.sd_setImage(with: url)
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
}
