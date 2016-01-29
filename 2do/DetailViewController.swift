//
//  DetailViewController.swift
//  2do
//
//  Created by Courtney Daley on 26/01/2016.
//  Copyright © 2016 Courtney Daley. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField! = UITextField()
    @IBOutlet weak var detailsTextView: UITextView! = UITextView()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var todoData:NSDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleTextField.userInteractionEnabled=false
        detailsTextView.userInteractionEnabled=false
        
        titleTextField.text=todoData.objectForKey("ItemTitle") as? String
        detailsTextView.text=todoData.objectForKey("ItemNotes")as? String
    }
    
    @IBAction func deleteItem(sender: AnyObject) {
        
        let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let itemListArray:NSMutableArray = userDefaults.objectForKey("item_List") as! NSMutableArray
        
        let mutableItemList: NSMutableArray = NSMutableArray()
        
        for dict:AnyObject in itemListArray{
            mutableItemList.addObject(dict as! NSDictionary)
        }
        
        mutableItemList.removeObject(todoData)
        userDefaults.removeObjectForKey("item_List")
        userDefaults.setObject(mutableItemList, forKey: "item_List")
        userDefaults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
