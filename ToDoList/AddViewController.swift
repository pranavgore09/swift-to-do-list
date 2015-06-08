//
//  AddViewController.swift
//  ToDoList
//
//  Created by Pranav Gore on 07/06/15.
//  Copyright (c) 2015 Pranav Gore. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var detailsTextArea: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        println("tapped")
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemList:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        
        var dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(titleTextField.text, forKey: "itemTitle")
        dataSet.setObject(detailsTextArea.text, forKey: "itemDetails")
        
        if ((itemList) != nil){
            var mutableList:NSMutableArray = NSMutableArray()
            for dict:AnyObject in itemList!{
                mutableList.addObject(dict as! NSDictionary)
            }
            
            userDefaults.removeObjectForKey("itemList")
            mutableList.addObject(dataSet)
            userDefaults.setObject(mutableList, forKey: "itemList")
        }else{
            userDefaults.removeObjectForKey("itemList")
            itemList = NSMutableArray()
            itemList?.addObject(dataSet)
            userDefaults.setObject(itemList, forKey: "itemList")
        }
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
