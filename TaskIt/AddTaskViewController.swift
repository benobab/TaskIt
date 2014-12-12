//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by BenLacroix on 12/12/2014.
//  Copyright (c) 2014 Benobab. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    
    //VAR de la storyBoard
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //Référence au tableau de task du ViewController
    var mainVC : ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    @IBAction func cancelButtonPressed(sender: UIButton) {
        
        //car on a fait un present modally et non un push
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func addTaskButtonPressed(sender: UIButton) {
        var t = TaskModel(task: taskTitleTextField.text, subTask: taskDescriptionTextField.text, date: datePicker.date)
        mainVC?.taskArray.append(t)
        self.dismissViewControllerAnimated(true, completion: nil)

    }
}
