import UIKit

public typealias TableItemSelectionHandlerType = (IndexPath) -> Void

open class TableDataSource<Provider: CollectionDataProvider, Cell: UITableViewCell>:
    NSObject,
    UITableViewDataSource,
    UITableViewDelegate
    where Cell: ConfigurableCell, Provider.T == Cell.T {
    // MARK: - Delegates
    public var collectionItemSelectionHandler: TableItemSelectionHandlerType?
    
    // MARK: - Private Properties
    let provider: Provider
    let tableView: UITableView
    
    // MARK: - Lifecycle
    init(tableView: UITableView, provider: Provider) {
        self.tableView = tableView
        self.provider = provider
        super.init()
        setUp()
    }
    
    func setUp() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - UICollectionViewDataSource
    public func numberOfSections(in collectionView: UITableView) -> Int {
        return provider.numberOfSections()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return provider.numberOfItems(in: section)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier,
//                                                            for: indexPath) as? Cell else {
//                                                                return UITableViewCel()
//        }
//        let item = provider.item(at: indexPath)
//        if let item = item {
//            cell.configure(item, at: indexPath)
//        }
        return UITableViewCell()
    }
    
    // MARK: - UITableViewDelegate
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        collectionItemSelectionHandler?(indexPath)
    }
}

