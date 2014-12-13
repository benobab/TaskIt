//
//  ViewController.swift
//  TaskIt
//
//  Created by BenLacroix on 08/12/2014.
//  Copyright (c) 2014 Benobab. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    
    var detailTaskModel: TaskModel!
    
    var mainVC:ViewController!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleTaskTextField: UITextField!
    @IBOutlet weak var descriptionTaskTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.descriptionTaskTextField.text = detailTaskModel.subTask
        self.titleTaskTextField.text = detailTaskModel.task
        self.datePicker.date = detailTaskModel.date
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // This will refresh our TableView and recal the UITableViewDataSource
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeDoneButtonPressed(sender: UIBarButtonItem) {
        var t = TaskModel(task: titleTaskTextField.text, subTask: descriptionTaskTextField.text, date: datePicker.date)
        
        self.mainVC.taskArray[mainVC.tableView.indexPathForSelectedRow()!.row] = t
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}


