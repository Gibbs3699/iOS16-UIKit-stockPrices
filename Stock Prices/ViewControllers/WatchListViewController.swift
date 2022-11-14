//
//  WatchListViewController.swift
//  Stock Prices
//
//  Created by TheGIZzz on 29/10/2565 BE.
//

import UIKit

class WatchListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSearchController()
        setupTitleView()
    }

    private func setupSearchController() {
        let resultVC = SearchResultsViewController()
        let searchVC = UISearchController(searchResultsController: resultVC)
        resultVC.delegate = self
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
    }
    
    private func setupTitleView() {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 120))
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: titleView.width-20, height: titleView.height))
        label.text = "Stock Prices"
        label.font = .systemFont(ofSize: 40, weight: .bold)
        titleView.addSubview(label)
        
        navigationItem.titleView = titleView
    }
}

extension WatchListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              let resultVC = searchController.searchResultsController as? SearchResultsViewController,
              !query.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        resultVC.update(with: ["GOOG"])
        print(query)
    }
}

extension WatchListViewController: SearchResultsViewDelegate {
    
    func searchResultViewControllerDidSelect(searchResult: String) {
        //
    }
    
}
