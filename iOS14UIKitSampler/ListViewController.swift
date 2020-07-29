//
//  ListViewController.swift
//  iOS14UIKitSampler
//
//  Created by Kazuhiro Hayashi on 2020/07/30.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var menuItems: [Item] = {
        return [
            Item(title: "Section 1", subitems: [
                Item(title: "Title 1"),
                Item(title: "Title 2")
                ]
            ),
            Item(title: "Section 2", subitems: [
                Item(title: "Title 3"),
                Item(title: "Title 4")
                ]
            )
        ]
    }()
    
    
    // List Configuration
    let layout: UICollectionViewLayout = {
        let listConfiguration = UICollectionLayoutListConfiguration(appearance: .sidebar)
        // listConfiguration.leadingSwipeActionsConfigurationProvider
        let layout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        return layout
    }()
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "List"
        collectionView.collectionViewLayout = layout
        configureDataSource()
    }
    
    func configureDataSource() {
        let containerCellRegistration = makeSectionCellRegistration()
        let cellRegistration = makeTitleCellRegistration()
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell? in
            if item.subitems.isEmpty {
                // Cell Registration
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
            } else {
                return collectionView.dequeueConfiguredReusableCell(using: containerCellRegistration, for: indexPath, item: item)
            }
        }

        let snapshot = makeSnapShot()
        self.dataSource.apply(snapshot, to: .main, animatingDifferences: false)
    }
    
    // Section Snapshots
    func makeSnapShot() -> NSDiffableDataSourceSectionSnapshot<Item> {
        var snapshot = NSDiffableDataSourceSectionSnapshot<Item>()

        menuItems.forEach { (item) in
            snapshot.append([item])
            snapshot.append(item.subitems, to: item)
        }
        return snapshot
    }
    
    // Cell Registration
    func makeSectionCellRegistration() -> CellRegistration  {
        UICollectionView.CellRegistration<UICollectionViewListCell, Item> { (cell, indexPath, menuItem) in
            
            // Configuration & ListCell
            var contentConfiguration = cell.defaultContentConfiguration()
            
            contentConfiguration.text = menuItem.title
            contentConfiguration.textProperties.font = .preferredFont(forTextStyle: .headline)
            cell.contentConfiguration = contentConfiguration
            
            let disclosureOptions = UICellAccessory.OutlineDisclosureOptions(style: .header)
            cell.accessories = [.outlineDisclosure(options:disclosureOptions)]
        }
    }
    
    // Cell Registration
    func makeTitleCellRegistration() -> CellRegistration  {
        UICollectionView.CellRegistration<UICollectionViewListCell, Item> { cell, indexPath, menuItem in
            
            // Configuration & ListCell
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = menuItem.title
            cell.contentConfiguration = contentConfiguration
            
            // cell.backgroundConfiguration
        }
    }
    
    func makeDiffableDataSource(sectionReg: CellRegistration, titleReg: CellRegistration) -> UICollectionViewDiffableDataSource<Section, Item> {
        UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell? in
            if item.subitems.isEmpty {
                return collectionView.dequeueConfiguredReusableCell(using: titleReg, for: indexPath, item: item)
            } else {
                return collectionView.dequeueConfiguredReusableCell(using: sectionReg, for: indexPath, item: item)
            }
        }
    }
    
    typealias CellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item>
}

// Data
extension ListViewController {
    enum Section {
        case main
    }

    class Item: Hashable {
        let title: String
        let subitems: [Item]

        init(title: String,
             subitems: [Item] = []) {
            self.title = title
            self.subitems = subitems
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(identifier)
        }
        
        static func == (lhs: Item, rhs: Item) -> Bool {
            return lhs.identifier == rhs.identifier
        }
        private let identifier = UUID()
    }
}
