//
//  ViewController.swift
//  todoApp
//
//  Created by sora on 2019/07/16.
//  Copyright © 2019 sora. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var resultArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (UserDefaults.standard.object(forKey: "todo") != nil){
            
            resultArray = UserDefaults.standard.object(forKey: "todo") as! [String]
        }
        
        tableView.reloadData()
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resultArray.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = resultArray[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            resultArray.remove(at: indexPath.row)
            UserDefaults.standard.set(resultArray, forKey: "todo")
            
            tableView.reloadData()
        }
    }
    
    
}

