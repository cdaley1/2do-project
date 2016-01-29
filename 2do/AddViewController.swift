//
//  AddViewController.swift
//  2do
//
//  Created by Courtney Daley on 26/01/2016.
//  Copyright © 2016 Courtney Daley. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField! = UITextField()
    
    @IBOutlet weak var notesTextView: UITextView! = UITextView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    @IBAction func addButtonTab(sender: AnyObject) {
        
        let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var item_List:NSMutableArray? = userDefaults.objectForKey("item_List") as? NSMutableArray
        
        let dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(titleTextField.text!, forKey: "ItemTitle")
        dataSet.setObject(notesTextView.text!, forKey: "ItemNotes")
        
        if ((item_List) != nil){ // data already available
            let newMutableList:NSMutableArray = NSMutableArray()
            
            for dict:AnyObject in item_List!{
                newMutableList.addObject(dict as! NSDictionary)
            }
            
            userDefaults.removeObjectForKey("item_List")
            newMutableList.addObject(dataSet)
            userDefaults.setObject(newMutableList, forKey: "item_List")
            
        }else{ // This is the first tot item in the list
            userDefaults.removeObjectForKey("item_List")
            item_List = NSMutableArray()
            item_List!.addObject(dataSet)
            userDefaults.setObject(item_List, forKey: "item_List")
        }
        
        userDefaults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    //Add picture to item
    /*
    @IBAction func takePicture(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func selectPicture(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        noteImageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    */
   
    
}
