//
//  ViewController.swift
//  0801-CoreData-Activity
//
//  Created by minsson on 2022/08/01.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var myTextLabel: UILabel!
    
    @IBOutlet weak var myTableView: UITableView!
    
    var dummyData: [Model]?
    var request: NSFetchRequest<Joke>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        
        // 배열 마지막 제거
//        removeLast()
        //배열 제거
//        removeAll()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let data = CoreDataManager.shared.fetch() as? [Model] {
            dummyData = data
            myTableView.reloadData()
        }
    }
    
    func removeLast(indexPath: Int) {
        request = Joke.fetchRequest()
        let fetchResult = CoreDataManager.shared.fetch(request: request!)
        CoreDataManager.shared.delete(object: fetchResult[indexPath])
    }
    
    func removeAll() {
        request = Joke.fetchRequest()
        let fetchResult = CoreDataManager.shared.fetch(request: request!)
        CoreDataManager.shared.deleteAll(request: request!)
        let array = CoreDataManager.shared.fetch(request: request!)
        if array.isEmpty {
            print("All Clear")
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myTableViewCell
        
        cell.myTextLabel.text = dummyData?[indexPath.row].content
        cell.accessoryView
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            dummyData?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            removeLast(indexPath: indexPath.row)
            tableView.reloadData()
        } else if editingStyle == .insert {
            
        }
    }
}


extension ViewController: UITableViewDelegate {
    
}
