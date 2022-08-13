//
//  ViewController.swift
//  Sample_MVVM_RxSwift
//
//  Created by Derrick kim on 2022/08/13.
//

import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    private var viewModel = RestaurantsListViewModel()
    
    let tableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tableFooterView = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { [weak self] make in
            guard let self = self else {
                return
            }
            
            make.top.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.leading.equalTo(self.view)
            make.trailing.equalTo(self.view)
        }
        
        tableView.register(SampleTableViewCell.self, forCellReuseIdentifier: SampleTableViewCell.identifier)
        
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel.fetchRestaurantViewModels().observe(on: MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: SampleTableViewCell.identifier)) { index, viewModel, cell in
            cell.textLabel?.text = viewModel.displayText
        }
    }
} 

