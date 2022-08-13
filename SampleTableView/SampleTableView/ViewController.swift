//
//  ViewController.swift
//  SampleTableView
//
//  Created by Derrick kim on 2022/06/13.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet weak var sampleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleTableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.id)
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        tableView.backgroundColor = UIColor.systemGray3
        return " "
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 9
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = sampleTableView.dequeueReusableCell(withIdentifier: MyTableViewCell.id, for: indexPath) as? MyTableViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.row == 1 {
            cell.detailLabel.text = "Detail"
        } else if indexPath.row == 0 {
            cell.backgroundColor = .systemPink
        }
        
        cell.indexRow = indexPath.row
        cell.indexLabel.text = "\(indexPath.section), \(indexPath.row)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showConfirmMessage("Section \(indexPath.section), Rows \(indexPath.row)")
    }
    
    func showConfirmMessage(_ message: String) {
        let alertController = UIAlertController(title: "어머나", message: "날 만졌어\n \(message)", preferredStyle: .alert)
        let action = UIAlertAction(title: "그랬구나", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
}
