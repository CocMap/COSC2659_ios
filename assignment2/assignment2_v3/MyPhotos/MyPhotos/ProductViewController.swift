//
//  ViewController.swift
//  MyPhotos
//
//  Created by Tran, Tran Le Nha on 12/17/17.
//  Copyright © 2017 Tran, Tran Le Nha. All rights reserved.
//

import UIKit
import os.log

class ProductViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //-----MARK: properties-----

    @IBOutlet weak var photoName: UITextField!  //nameTextField
//    @IBOutlet weak var photoTitle: UILabel!     //mealNameLabel
    @IBOutlet weak var photoImageView: UIImageView!
    
    var product:Product?
    
    
    //-----MARK: Navigation-----
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveBtn else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let desc = photoName.text ?? ""
        let photo = photoImageView.image
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        product = Product(desc: desc, photo: photo)
    }
    
    
    //-----MARK: actions-----
    
    @IBAction func addPhotoBtn(_ sender: AnyObject) {   //setDefaultLabelText
//        photoTitle.text = photoName.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Handle the ext field's user input through delegate callbacks
        photoName.delegate = self
        
        // Enable the Save button only if the text field has a valid Meal name.
        updateSaveButtonState()
    }
    

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
//         Hide the keyboard.
        photoName.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary

        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)

    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
         dismiss(animated: true, completion: nil)
    }



    
    //-----MARK: UITextFieldDelegate-----
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //hide the keyboard
        textField.resignFirstResponder()
        return true
    }

    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        photoTitle.text = photoName.text
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        //disable the Save button while editing
        saveBtn.isEnabled = false
    }
    
    
    
    //-----MARK: UIImagePickerControllerDelegate-----
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        //dimiss the pucker of the users canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //the info dictionary may contain muliple representation of the image. You want to use the original
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        //set photoImageView to display the selected image
        photoImageView.image = selectedImage
        
        //dimiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    
    //-----MARK: Private methods-----
    private func updateSaveButtonState() {
        
        //disable the Save button if the text field in empty
        let text = photoName.text ?? ""
        saveBtn.isEnabled = !text.isEmpty
    }
    
    
    
    
    
}

