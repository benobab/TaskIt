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
    
    @IBOutlet weak var dateLabel: UIDatePicker!
    @IBOutlet weak var titleTask: UITextField!
    @IBOutlet weak var descriptionTask: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.descriptionTask.text = detailTaskModel.subTask
        self.titleTask.text = detailTaskModel.task
        self.dateLabel.date = detailTaskModel.date
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // This will refresh our TableView and recal the UITableViewDataSource
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


