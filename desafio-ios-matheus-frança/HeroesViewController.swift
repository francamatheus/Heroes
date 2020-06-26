//
//  HeroesViewController.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 19/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import NVActivityIndicatorView
import UIKit

class HeroesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl = UIRefreshControl()
    
    var viewModel = HeroesViewModel()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingOverlay.shared.showOverlay(view: self.view)
        edgesForExtendedLayout = []
        setupTableView()
        fetchData()
        setupNavBar()
    }
    
    // MARK: - Setup
    func setupNavBar() {
        self.title = "Heróis"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: - Setup Functions
    func setupTableView() {
        tableView.register(UINib(nibName: "HeroesTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroesTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 50.0
        tableView.delegate = self
        tableView.dataSource = self
        setupRefresh()
        
    }
    
    func setupRefresh() {
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        refreshControl.tintColor = .red
        tableView.refreshControl = refreshControl
    }
    
    // MARK: - Functions
    @objc func refresh(_ sender: AnyObject) {
        if !viewModel.isFetchingData {
            viewModel.heroesList = []
            tableView.reloadData()
            viewModel.offset = 0 
            fetchData()
        } else {
            refreshControl.endRefreshing()
        }
    }
    
    func fetchData() {
        viewModel.fetchList(success: {
            self.tableView.reloadData()
            self.finishLoading()
        }, error: { errorMessage in
            self.finishLoading()
            self.errorAlert(message: errorMessage, tryAgainMethod: {
                self.fetchData()
            })
        })
    }
    
    func finishLoading() {
        refreshControl.endRefreshing()
        LoadingOverlay.shared.hideOverlayView()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height {
            if !viewModel.isFetchingData {
                fetchData()
            }
        }
    }
}

// MARK: - Cells
extension HeroesViewController {
    
    func cell(for model: Any, in tableView: UITableView, index: IndexPath) -> UITableViewCell {
        if let model = model as? HeroModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeroesTableViewCell", for: index) as? HeroesTableViewCell
            cell?.configCell(data: model)
            return cell ?? UITableViewCell()
        }
        return UITableViewCell()
    }
}

// MARK: - UITablewView Delegate e SataSource
extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.heroesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.heroForIndex(indexPath.row)
        return cell(for: model as Any, in: tableView, index: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nav = self.navigationController else { return }
        AppCoordinator.goToHeroDetail(parent: nav, heroModel: viewModel.heroForIndex(indexPath.row))
    }
}
