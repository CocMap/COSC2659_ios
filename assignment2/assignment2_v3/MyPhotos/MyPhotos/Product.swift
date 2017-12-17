//
//  Product.swift
//  MyPhotos
//
//  Created by Tran, Tran Le Nha on 12/17/17.
//  Copyright © 2017 Tran, Tran Le Nha. All rights reserved.
//

import UIKit

class Product {
    
    //-----MARK: Properties-----
    
    var photo: UIImage?
    var desc: String
    
    
    
    //-----MARK: Initialization-----
    
    init?(desc: String, photo: UIImage?) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if desc.isEmpty  {
            return nil
        }
        
        // Initialize stored properties.
        self.photo = photo
        self.desc = desc
        
    }
}
