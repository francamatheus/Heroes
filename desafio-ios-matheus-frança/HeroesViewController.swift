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

    var viewModel = HeroesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        setupTableView()
        fetchData()
        setupNavBar()
    }
    
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
    }
    
    func fetchData() {
        LoadingOverlay.shared.showOverlay(view: self.view)
        viewModel.fetchList(success: {
            self.tableView.reloadData()
            LoadingOverlay.shared.hideOverlayView()
        }, error: { _ in
            LoadingOverlay.shared.hideOverlayView()
            self.errorAlert(tryAgainMethod: {
                self.fetchData()
            })
        })
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
