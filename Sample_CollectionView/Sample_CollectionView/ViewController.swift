import UIKit

enum Section {
    case main
}

class ViewController: UIViewController {
    var animalData: [Animal] = []
    let apiHandler = APIService()
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Animal>!
    
    override func viewDidLoad() {
        navigationItem.title = "ZOO"
        view.backgroundColor = .white
        apiHandler.getAnimalData { result in
            switch result {
            case .success(let animals):
                self.animalData = animals
                DispatchQueue.main.async {
                    self.configureCollectionView()
                    self.configureDataSource()
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
}

extension ViewController {
    func createListLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createListLayout())
        view.addSubview(collectionView)
    }
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<AnimalListCell, Animal> { (cell, indexPath, animal) in
            cell.update(with: animal)
            cell.accessories = [.disclosureIndicator()]
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Animal>(collectionView: collectionView) { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Animal>()
        snapshot.appendSections([.main])
        snapshot.appendItems(animalData)
        dataSource.apply(snapshot)
    }
}
