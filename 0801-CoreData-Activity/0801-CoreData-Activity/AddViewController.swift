//
//  AddViewController.swift
//  0801-CoreData-Activity
//
//  Created by minsson on 2022/08/01.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var typeSegementedControl: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addContent(_ sender: UIButton) {
        let model = Model(content: myTextField.text!, category: .유행어, id: UUID())
        CoreDataManager.shared.saveModel(model)
        self.dismiss(animated: true)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
