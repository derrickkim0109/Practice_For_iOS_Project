//
//  ViewController.swift
//  ImagePickerCancelButton
//
//  Created by Derrick kim on 2022/08/06.
//

import UIKit

protocol RemoveDelegate : AnyObject {
    func removeCell( _ indexPath : IndexPath)
}

class ViewController: UIViewController {

    var count = 5
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.
        return stackView
    }()
    
    var collectionView : UICollectionView!
    let reuseIdentifier = "pickerCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    
    func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate(
            [collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
             collectionView.leftAnchor.constraint(equalTo : self.view.leftAnchor),
             collectionView.heightAnchor.constraint(equalToConstant: 100),
             collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor)])
        
        collectionView.backgroundColor = UIColor(red: 0.85, green: 0.89, blue: 0.87, alpha: 1.00)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImagePickerCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}



extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImagePickerCell
        cell.indexPath = indexPath
        cell.removeCellDelegate = self
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.layer.frame.height - 20, height: collectionView.layer.frame.height - 20 )
    }
}

extension ViewController : RemoveDelegate {
    func removeCell(_ indexPath : IndexPath) {
        self.collectionView.performBatchUpdates {
            self.count -= 1
            self.collectionView.deleteItems(at: [indexPath])
        } completion: { (_) in
            self.collectionView.reloadData()
        }
    }
}
