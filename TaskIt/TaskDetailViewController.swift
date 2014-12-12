//
//  ViewController.swift
//  TaskIt
//
//  Created by BenLacroix on 08/12/2014.
//  Copyright (c) 2014 Benobab. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    
    @IBOutlet weak var dateLabel: UIDatePicker!
    @IBOutlet weak var descriptionTaskLabel: UILabel!
    @IBOutlet weak var titleTaskLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    var detailTaskModel: TaskModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.descriptionTaskLabel.text = detailTaskModel.subTask
        self.titleTaskLabel.text = detailTaskModel.task
        self.dateLabel = detailTaskModel
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // This will refresh our TableView and recal the UITableViewDataSource
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


