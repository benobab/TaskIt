//
//  ViewController.swift
//  TaskIt
//
//  Created by BenLacroix on 08/12/2014.
//  Copyright (c) 2014 Benobab. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
    
    //faux tableau de tâches
    //[Dictionary<String,String>] = []
    //vrai tableau de tableau de taches (1 de complétés et 1 de non complétés)
    var tabDeTabdeTache:[[TaskModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //fonction appellé à chaque fois que la view apparait à l'écran, et non seulement la premiere fois, comme avec viewDidLoad()
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //ici on trie le taskArray par date : 
        func sortByDate (a : TaskModel,b : TaskModel) -> Bool{
            return a.date.timeIntervalSince1970 < b.date.timeIntervalSince1970
        }
        for var i = 0 ; i < tabDeTabdeTache.count ; i++ {
            
            tabDeTabdeTache[i] = tabDeTabdeTache[i].sorted(sortByDate)
        }
        
        self.tableView.reloadData()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //TODO
        if (segue.identifier == "showDetailSegue")
        {
             let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = tableView.indexPathForSelectedRow()
            let thisTask = tabDeTabdeTache[indexPath!.section][indexPath!.row]
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
        }else if (segue.identifier == "addTaskSegue" ){
            //on change de viewController, on est obligé de spécifié asAddTaskViewController car segue ne connait pas le type de destination tout seul
            let addTask:AddTaskViewController = segue.destinationViewController as AddTaskViewController
            //ensuite ICI on dis que le mainVC du AddTaskViewController qu'on appelle, sera en fait ce ViewController actuel
            //Ca permet de faire en sorte que la taskArray.append(t) fonctionne sur le bon viewController 
            addTask.mainVC = self
        }
    }
    
    
    
    //UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return tabDeTabdeTache.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabDeTabdeTache[section].count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let thisTask = tabDeTabdeTache[indexPath.section][indexPath.row]
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(date : thisTask.date)
        
        return cell
    }
    
    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showDetailSegue", sender: self)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "To Do"}
        else{
            return "Done"}
    }

        func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            
            let thisTask = tabDeTabdeTache[indexPath.section][indexPath.row]
            
            if indexPath.section == 0 {
                var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, completed: true)
                tabDeTabdeTache[1].append(newTask)
            }
            else {
                var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, completed: false)
                tabDeTabdeTache[0].append(newTask)
            }
            
            tabDeTabdeTache[indexPath.section].removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
        
    
    
}

