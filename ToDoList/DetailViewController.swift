//
//  DetailViewController.swift
//  ToDoList
//
//  Created by Pranav Gore on 07/06/15.
//  Copyright (c) 2015 Pranav Gore. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var itemTitle: UITextField!
    @IBOutlet var itemDetails: UITextView!
    var toDoData:NSDictionary = NSDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTitle.userInteractionEnabled = false
        itemDetails.userInteractionEnabled = false
        // Do any additional setup after loading the view.
        itemTitle.text = toDoData.objectForKey("itemTitle") as? String
        itemDetails.text = toDoData.objectForKey("itemDetails") as? String
    }

    @IBAction func trashButtonTapped(sender: AnyObject) {
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var allItems:NSMutableArray = userDefaults.objectForKey("itemList") as! NSMutableArray
        var mutableList:NSMutableArray = NSMutableArray()
        for dict:AnyObject in allItems{
            mutableList.addObject(dict as! NSDictionary)
        }
        mutableList.removeObject(toDoData)
        userDefaults.removeObjectForKey("itemList")
        userDefaults.setObject(mutableList, forKey: "itemList")
        userDefaults.synchronize()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
