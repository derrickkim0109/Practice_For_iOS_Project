//
//  ViewController.swift
//  ImagePagingWithScrollView
//
//  Created by Derrick kim on 2022/07/31.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var countedLabel: UILabel!
    var images = [
        UIImage(systemName: "plus"),
        UIImage(systemName: "pencil"),
        UIImage(systemName: "minus")
    ]
    var imageView = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        addContentScrollView()
        setPageControl()

    }
    
    private func addContentScrollView() {
        for i in 0..<images.count {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            let xPos = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            imageView.image = images[i]
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
            imageView.contentMode = .scaleAspectFit
            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        }
    }
    
    private func setPageControl() {
        pageControl.numberOfPages = images.count
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
          pageControl.currentPage = currentPage
      }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
          let value = scrollView.contentOffset.x/scrollView.frame.size.width
          setPageControlSelectedPage(currentPage: Int(round(value)))
        countedLabel.text = "\(Int(round(value))+1)/\(images.count)"
      }
}

