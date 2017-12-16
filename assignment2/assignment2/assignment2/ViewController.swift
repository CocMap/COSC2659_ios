//
//  ViewController.swift
//  assignment2
//
//  Created by CocMap on 12/15/17.
//  Copyright © 2017 CocMap. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    //vars
    let data:[[String]] = [["item1", "item2", "item3"],
                           ["itemA", "itemB"]]
    
    let subs:[[String]] = [["description1", "description2", "description3"],
                           ["d1", "d2", "d3"]]
    
    let header:[String] = ["Numbered", "Lettered"]
    
    //navigator
    @IBOutlet weak var textField: UITextField!
    
    
    //enter buttom func
    @IBAction func enter(_ sender: Any) {
        if textField.text != "" {
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let secondController = segue.destination as! SecondViewController
        secondController.myString = textField.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.detailTextLabel?.text = subs[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header[section]
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

