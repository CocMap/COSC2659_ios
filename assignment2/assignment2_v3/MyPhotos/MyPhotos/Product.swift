//
//  Product.swift
//  MyPhotos
//
//  Created by Tran, Tran Le Nha on 12/17/17.
//  Copyright © 2017 Tran, Tran Le Nha. All rights reserved.
//

import UIKit
import os.log

class Product : NSObject, NSCoding {
    
    //-----MARK: Properties-----
    
    var photo: UIImage?
    var desc: String
    
    struct Propertykey {
        static let desc = "desc"
        static let photo = "photo"
    }
    
    //-----MARK: Archiving Paths-----
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("products")
    
    
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
    
    
    //-----MARK: NSCoding-----
    func encode(with aCoder: NSCoder) {
        aCoder.encode(desc, forKey: Propertykey.desc)
        aCoder.encode(photo, forKey: Propertykey.photo)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let desc = aDecoder.decodeObject(forKey: Propertykey.desc) as? String else {
            os_log("Unable to decode the desciption for a Product object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: Propertykey.photo) as? UIImage
        
        // Must call designated initializer.
        self.init(desc: desc, photo: photo)
        
    }
}
