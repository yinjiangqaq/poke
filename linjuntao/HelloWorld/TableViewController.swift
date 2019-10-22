//
//  TableViewController.swift
//  HelloWorld
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 feng. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {


    
    
    var foodList: [food] = [food]()
    func initFoodList() {
        var foodlist: [food]? = loadFoodFile()
        if(foodlist == nil){
            foodList.append(food(name: "cake", description: "sweet"))
            foodList.append(food(name: "hamburger", description: "junkfood"))
            
        }else{
            foodList = foodlist!
        }
    }
    
    func saveFoodFile(){
        let success = NSKeyedArchiver.archiveRootObject(foodList, toFile: food.ArchiveURL.path)
        if !success{
            print("Failed ...")
        }
    }
    func loadFoodFile() -> [food]? {
        return (NSKeyedUnarchiver.unarchiveObject(withFile: food.ArchiveURL.path) as? [food])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            initFoodList()
        }
        //界面初始化函数
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    @IBAction func cancelToList(segue:UIStoryboardSegue){
        
    }
    //exit 函数是优先级最高的函数，只要点击了save就一定不会执行其他的action，或者其他基于这个按钮的func
    @IBAction func saveToList(segue:UIStoryboardSegue){
        if let addFoodVC = segue.source as? descriptionViewController{
            if let addFood = addFoodVC.foodForEdit{
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    foodList[(selectedIndexPath as NSIndexPath).row] = addFood
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }else{
                    foodList.append(addFood)
                   let newIndexPath = IndexPath(row: foodList.count-1, section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
        }
        saveFoodFile()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        //section 的数量
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodList.count
        //每一个section多少行
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)

         //Configure the cell...
     cell.textLabel?.text = foodList[indexPath.row].foodTitle
        cell.detailTextLabel?.text = foodList[indexPath.row].foodContent
        return cell
        //z控制每一个cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            foodList.remove(at: indexPath.row)
            saveFoodFile()
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let  descriptionVC = segue.destination as! descriptionViewController
        if(segue.identifier == "showDetail"){
        
        if let selectedCell = sender as? UITableViewCell {
            let indexPath = tableView.indexPath(for: selectedCell)!
            let selectedFood = foodList[(indexPath as NSIndexPath).row]
            descriptionVC.foodForEdit = selectedFood
        }
        print("show detail view")
        }else{
           descriptionVC.foodForEdit = food(name: "", description: "")
            print("add new food")
        }
    }
 

}
