//
//  BookTableViewController.swift
//  BookTracker
//
//  Created by 朱坤 on 16/1/3.
//  Copyright © 2016年 zhukun. All rights reserved.
//

import UIKit

class BookTableViewController: UITableViewController {
    //MARK: Properties
    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the sample data.
        loadSampleBooks()
    }
    
    func loadSampleBooks(){
        let photo1 = UIImage(named: "book1")!
        let book1 = Book(name: "把时间当做朋友", photo: photo1, rating: 4)!
        
        let photo2 = UIImage(named: "book2")!
        let book2 = Book(name: "Mactalk跨越边界", photo: photo2, rating: 5)!
        
        let photo3 = UIImage(named: "book3")!
        let book3 = Book(name: "App研发录", photo: photo3, rating: 3)!
        books+=[book1, book2, book3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BookTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BookTableViewCell

        // Fetches the appropriate meal for the data source layout.
        let book = books[indexPath.row]
        
        cell.nameLabel.text = book.name
        cell.photoImageView.image = book.photo
        cell.ratingControl.rating = book.rating
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? BookViewController, book = sourceViewController.book {
            
            // Add a new meal.
            let newIndexPath = NSIndexPath(forRow: books.count, inSection: 0)
            books.append(book)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            
        }
        
        
    }

}
