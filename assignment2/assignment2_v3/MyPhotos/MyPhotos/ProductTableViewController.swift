//
//  ProductTableViewController.swift
//  MyPhotos
//
//  Created by Tran, Tran Le Nha on 12/17/17.
//  Copyright © 2017 Tran, Tran Le Nha. All rights reserved.
//

import UIKit
import os.log

class ProductTableViewController: UITableViewController {
    
    //-----MARK: Properties-----
    var products = [Product]()
    
    
    //-----MARK: Navigation-----
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Adding a new photo.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            guard let productDetailViewController = segue.destination as? ProductViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedProductCell = sender as? ViewListTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedProductCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedProduct = products[indexPath.row]
            productDetailViewController.product = selectedProduct
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
    
    
    
    //-----MARK: private methods-----
    private func loadSampleProduct() {
        let photo1 = UIImage(named: "greentea_cleansing")
        let photo2 = UIImage(named: "volcanic_cleansing")
        let photo3 = UIImage(named: "olive_cleansing")
        
        guard let product1 = Product(desc: "Green Tea cleansing", photo: photo1) else {
            fatalError("Unable to instantiate product1")
        }
        
        guard let product2 = Product(desc: "Volcanic Cleansing", photo: photo2) else {
            fatalError("Unable to instantiate product2")
        }
        
        guard let product3 = Product(desc: "Olive Real Cleansing", photo: photo3) else {
            fatalError("Unable to instantiate product3")
        }
        
        products += [product1, product2, product3]
    }
    
    private func saveProducts() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(products, toFile: Product.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Products successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save products...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadProducts() -> [Product]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Product.ArchiveURL.path) as? [Product]
    }
    
    
    //-----MARK: Acions-----
    @IBAction func unwindToProductList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ProductViewController, let product = sourceViewController.product {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing product.
                products[selectedIndexPath.row] = product
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                // Add a new product.
                let newIndexPath = IndexPath(row: products.count, section: 0)
                
                products.append(product)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
                
                //save the products
                saveProducts()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
        
        //load any saved products, otherwise load sample data
        if let savedProducts = loadProducts() {
            products += savedProducts
        } else {
            
            // Load the sample data.
            loadSampleProduct()

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //-----MARK: Table view data source------

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "cell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ViewListTableViewCell else {
            fatalError("The dequeued cell is not an instance of ProductTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let product = products[indexPath.row]
        
        cell.desc.text = product.desc
        cell.photoView.image = product.photo

        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            // Delete the row from the data source
            products.remove(at: indexPath.row)
            saveProducts()
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
