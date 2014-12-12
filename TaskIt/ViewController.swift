//
//  ViewController.swift
//  TaskIt
//
//  Created by BenLacroix on 08/12/2014.
//  Copyright (c) 2014 Benobab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    

    //faux tableau de tâches
    var taskArray:[TaskModel] = [] //[Dictionary<String,String>] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        let date1 = Date.from(year: 2014, month: 05, day: 20)
        let date2 = Date.from(year: 2014, month: 03, day: 3)
        let task1: TaskModel = TaskModel(task: "Study Frenche", subTask: "Bonjour ça va ?", date: date1)
        let task2: TaskModel = TaskModel(task: "Faire du sport", subTask: "Kitesurf", date: date2)
        taskArray.append(task1)
        taskArray.append(task2)
        
        // This will refresh our TableView and recal the UITableViewDataSource functions.
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //fonction appellé à chaque fois que la view apparait à l'écran, et non seulement la premiere fois, comme avec viewDidLoad()
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //TODO
        if (segue.identifier == "showDetailSegue")
        {
             let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = tableView.indexPathForSelectedRow()
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
        }else if (segue.identifier == "addTaskSegue" ){
            //on change de viewController, on est obligé de spécifié asAddTaskViewController car segue ne connait pas le type de destination tout seul
            let addTask:AddTaskViewController = segue.destinationViewController as AddTaskViewController
            //ensuite ICI on dis que le mainVC du AddTaskViewController qu'on appelle, sera en fait ce ViewController actuel
            //Ca permet de faire en sorte que la taskArray.append(t) fonctionne sur le bon viewController 
            addTask.mainVC = self
        }
    }
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let thisTask = taskArray[indexPath.row]
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
    
}

