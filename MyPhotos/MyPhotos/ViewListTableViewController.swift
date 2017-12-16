//
//  ViewListTableViewController.swift
//  MyPhotos
//
//  Created by Tran, Tran Le Nha on 12/16/17.
//  Copyright © 2017 Tran, Tran Le Nha. All rights reserved.
//

import UIKit

var photoListTitle = ["title1", "title2", "title3", "title4"]
var photoDesc = ["desc1", "desc2", "desc3", "desc4"]
var myIndex = 0


class ViewListTableViewController: UITableViewController{
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return photoListTitle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = photoListTitle[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
}
