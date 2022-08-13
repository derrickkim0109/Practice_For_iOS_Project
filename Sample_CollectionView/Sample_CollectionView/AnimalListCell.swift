//
//  AnimalListCell.swift
//  Sample_CollectionView
//
//  Created by Derrick kim on 2022/06/16.
//

import UIKit

private extension UIConfigurationStateCustomKey {
    static let animal = UIConfigurationStateCustomKey("animal")
}

extension UIConfigurationState {
    var fetchAnimalData: Animal? {
        get {
            return self[.animal] as? Animal
        }
        set {
            self[.animal] = newValue
        }
    }
}

class AnimalListCell: UICollectionViewCell {
    static let identifier: String = "AnimalListCell"
    
    private var animalData: Animal?
    private var defaultAnimalConfiguration: UIListContentConfiguration {
        return .subtitleCell()
    }
    private let animalTypeLabel = UILabel()
    private var animalTypeConstraints: (leading: NSLayoutConstraint, trailing: NSLayoutConstraint)?
    private lazy var animalListContentView = UIListContentView(configuration: defaultAnimalConfiguration)
    
    override var configurationState: UICellConfigurationState {
        var state = super.configurationState
        state.animalData = self.animalData
        return state
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        setupViewsIfNeeded()
        
        var content = defaultAnimalConfiguration.updated(for: state)
        
        content.image = urlToImage(state.animalData?.imageLink ?? "")
        content.imageProperties.maximumSize = CGSize(width: 50, height: 50)
        content.text = state.animalData?.name
        content.textProperties.font = .preferredFont(forTextStyle: .headline)
        content.secondaryText = "평균 수명: \(state.animalData?.lifespan ?? "")년"
        
        animalListContentView.configuration = content
        
        animalTypeLabel.text = state.animalData?.animalType ?? "1"
        
    }
}

extension AnimalListCell {
    func update(with newdata: Animal) {
        guard animalData != newdata else {
            return
        }
        animalData = newdata
        setNeedsUpdateConfiguration()
    }
    
    func setupViewsIfNeeded() {
        guard animalTypeConstraints == nil else {
            return
        }
        
        [animalListContentView, animalTypeLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraints = (leading:
                            animalTypeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: animalListContentView.trailingAnchor),
                           trailing:
                            animalTypeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor) )
        
        NSLayoutConstraint.activate([
            animalListContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            animalListContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            animalListContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            animalTypeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            constraints.leading,
            constraints.trailing
        ])
        
        animalTypeConstraints = constraints
    }
    
    func urlToImage(_ urlString: String) -> UIImage? {
        guard let url = URL(string: urlString),
              let data = try? Data(contentsOf: url),
              let image = UIImage(data: data) else {
                  return nil
              }
        
        return image
    }
}
