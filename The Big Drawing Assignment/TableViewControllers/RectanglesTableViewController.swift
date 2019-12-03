//
//  SecondViewController.swift
//  The Big Drawing Assignment
//
//  Created by Student on 11/22/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class RectanglesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MondrianModel.shared.numRects()
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "rectcell", for: indexPath)
        
        let rect = MondrianModel.shared[indexPath.row]
        let x = Double(round(rect.rect.origin.x * 10)/10)
        
        
        cell.textLabel?.text = "x: \(rect.rect.origin.x) y: \(rect.rect.origin.y), width: \(rect.rect.width), height: \(rect.rect.height)"
        cell.detailTextLabel?.text = "Area: \(rect.rect.width * rect.rect.height)"
        
        return cell
     }
    
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
     }
    
}

