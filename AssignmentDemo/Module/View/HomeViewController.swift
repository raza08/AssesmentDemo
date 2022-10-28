//
//  HomeViewController.swift
//  AssignmentDemo
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    let viewModel = HomeViewModel()
    
    //MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupTableViewDelegates()
        getDataToDisplay()
    }
    
    //MARK: - Custom methods
    
    /// Setup tableview delegates and data sources
    private func setupTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = loadCarouselHeaderView()
        tableView.register(UINib(nibName: Constants.cellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    /// Get data from view model to display on UI
    private func getDataToDisplay() {
        viewModel.getItemTodisplay()
        tableView.reloadData()
    }
}

//MARK: - Tableview delegates and data source methods
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemModel?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        let item = viewModel.itemModel?.items?[indexPath.row]
        cell.setUpCellData(item: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return loadSearchHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}

extension HomeViewController {
    func loadSearchHeaderView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        let searchView = SearchView()
        searchView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchView)
        searchView.searchBarItem.delegate = self
        
        NSLayoutConstraint.activate([
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            searchView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            searchView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        return view
    }
    
    func loadCarouselHeaderView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 350))
        let carouselView = CarouselView()
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(carouselView)
        
        NSLayoutConstraint.activate([
            carouselView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            carouselView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            carouselView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            carouselView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        return view
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            viewModel.doneSearch()
            tableView.reloadData()
        } else {
            DispatchQueue.global(qos: .background).async {
                self.viewModel.itemModel?.items?.removeAll()
                self.viewModel.itemModel?.items = self.viewModel.filterItemModel?.items?.filter({$0.name?.contains(searchText) == true })
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}
