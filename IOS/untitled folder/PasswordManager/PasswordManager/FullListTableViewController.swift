//
//  FullListTableViewController.swift
//  PasswordManager
//
//  Created by Jeroen Berkvens on 16/04/15.
//  Copyright (c) 2015 Moridrin. All rights reserved.
//

import UIKit

class FullListTableViewController: UITableViewController {
    
    var items : [[String]] = [];

    required init!(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder);
        let url = NSURL(string: "http://moridrin.com/ios/PasswordGenerator/getPassword.php?User=mp.berkvens@gmail.com&Name=all")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            //println(NSString(data: data, encoding: NSUTF8StringEncoding));
            var dataString = NSString(data: data, encoding: NSUTF8StringEncoding) as! String;
            dataString.substringWithRange(Range<String.Index>(start: advance(dataString.startIndex, 9), end: advance(dataString.endIndex, -1)));
            var dataArray = dataString.componentsSeparatedByString("\n");
            for item in dataArray {
                if (!item.isEmpty) {
                    var components = item.componentsSeparatedByString(";;;");
                    //var passwordCell = PasswordTableViewCell(name: components[0], password: components[1]);
                    self.items.append([components[0], components[1]]);
                }
            }
        }
        task.resume();
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.items.count;
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell : PasswordTableViewCell;
        //let cell = self.items[indexPath.row];
        let cell = tableView.dequeueReusableCellWithIdentifier("passwordCell", forIndexPath: indexPath) as! PasswordTableViewCell;
        if var nameLabel = cell.nameLabel {
            nameLabel.text = Encryption.decrypt(items[indexPath.row][0]);
        }
        if var passwordLabel = cell.passwordLabel {
            passwordLabel.text = items[indexPath.row][1];
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
