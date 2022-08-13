//
//  ViewController.swift
//  UIImagePicker_Sample
//
//  Created by Derrick kim on 2022/07/28.
//

import UIKit

class ViewController: UIViewController {
    let imagePicker = UIImagePickerController()
     
    let realRootStackView: UIStackView = {
        let stackVIew = UIStackView()
        stackVIew.translatesAutoresizingMaskIntoConstraints = false
        stackVIew.backgroundColor = .red
        stackVIew.spacing = 10
        stackVIew.alignment = .fill
        stackVIew.distribution = .fill
        stackVIew.axis = .vertical
        return stackVIew
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let plusImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("이미지 추가", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        scrollView.backgroundColor = .blue
        return scrollView
    }()
    
    let imageRootStackView: UIStackView = {
        let stackVIew = UIStackView()
        stackVIew.translatesAutoresizingMaskIntoConstraints = false
        
        stackVIew.backgroundColor = .brown
        stackVIew.spacing = 0
        stackVIew.alignment = .fill
        stackVIew.distribution = .fill
        stackVIew.axis = .horizontal
        return stackVIew
    }()
    
    let imageStackView: UIStackView = {
        let stackVIew = UIStackView()
        stackVIew.translatesAutoresizingMaskIntoConstraints = false
        
        stackVIew.backgroundColor = .brown
        stackVIew.spacing = 10
        stackVIew.alignment = .fill
        stackVIew.distribution = .fillEqually
        stackVIew.axis = .horizontal
        return stackVIew
    }()
    
    let textFieldStackView: UIStackView = {
        let stackVIew = UIStackView()
        stackVIew.translatesAutoresizingMaskIntoConstraints = false
        
        stackVIew.backgroundColor = .yellow
        stackVIew.spacing = 30
        stackVIew.alignment = .fill
        stackVIew.distribution = .fillEqually
        stackVIew.axis = .vertical
        return stackVIew
    }()
    
    let nameTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemPink
        return textField
    }()
    
    let priceTextField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .systemPink
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let discountedTextField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .systemPink
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let stockTextField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .systemPink
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let contentTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .darkGray
        textView.text = "내용이다."
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true //수정 가능 여부
        self.imagePicker.delegate = self
        
        configureRealRootStackView()
           
        textFieldStackView.addArrangedSubview(nameTextField)
        textFieldStackView.addArrangedSubview(priceTextField)
        textFieldStackView.addArrangedSubview(discountedTextField)
        textFieldStackView.addArrangedSubview(stockTextField)
        
        configureScrollView()
    }
    
    func configureRealRootStackView() {
        view.addSubview(realRootStackView)
        realRootStackView.addArrangedSubview(scrollView)
        realRootStackView.addArrangedSubview(textFieldStackView)
        realRootStackView.addArrangedSubview(contentTextView)

        NSLayoutConstraint.activate([
            realRootStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            realRootStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            realRootStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            realRootStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
    
    func configureScrollView() {
        scrollView.addSubview(imageRootStackView)
        imageRootStackView.addArrangedSubview(imageStackView)
        imageRootStackView.addArrangedSubview(plusImageButton)
        plusImageButton.addTarget(self, action: #selector(pickButton(_:)), for: .touchUpInside)
        
//        imageStackView.isHidden = true
        
        NSLayoutConstraint.activate([
            imageRootStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageRootStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            imageRootStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageRootStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageRootStackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            plusImageButton.widthAnchor.constraint(equalTo: plusImageButton.heightAnchor),
        ])
    }
    
    @objc func pickButton(_ sender: UIButton) {
        pickImage()
    }
    
    @objc func pickImage() {
        self.present(self.imagePicker, animated: true)
    }
    
    func createImage(with image: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        
        return imageView
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage? = nil
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage
        }
    
        let newImageView = createImage(with: newImage!)
        
        NSLayoutConstraint.activate([
            newImageView.widthAnchor.constraint(equalTo: newImageView.heightAnchor)
        ])
        imageStackView.addArrangedSubview(newImageView)
        
        picker.dismiss(animated: true, completion: nil)
    }
}
