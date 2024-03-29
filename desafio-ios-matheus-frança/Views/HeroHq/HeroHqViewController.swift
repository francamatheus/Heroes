//
//  HeroHqViewController.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 19/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import UIKit

class HeroHqViewController: UIViewController {
    
    var viewModel = HeroHqViewModel()
    
    var heroId: Int?

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupLayout()
        fetchData()
    }
    
    // MARK: - Init
    convenience init(heroId: Int) {
        self.init()
        self.viewModel.heroId = heroId
    }
    
    // MARK: - Setup
    func setupNavBar() {
        title = "Most Expensive HQ"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupLayout() {
        
        nameLabel.numberOfLines = 2
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)

        descriptionLabel.numberOfLines = 0
        
        pictureImageView.contentMode = .scaleAspectFit
        pictureImageView.backgroundColor = .black
        
        priceLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
    }
    
    func setupData() {
        descriptionLabel.text = viewModel.heroHqData?.description
        nameLabel.text = viewModel.heroHqData?.title
        let url = URL(string: viewModel.heroHqData?.image ?? "")
        pictureImageView.kf.setImage(with: url)
        priceLabel.text = "Price: U$ \(viewModel.heroHqData?.price ?? 0.0)"
    }
    
    // MARK: - Functions
    func fetchData() {
        LoadingOverlay.shared.showOverlay(view: self.view)
        viewModel.fetchList(success: {
            LoadingOverlay.shared.hideOverlayView()
            self.setupData()
        }) { errorMessage in
            LoadingOverlay.shared.hideOverlayView()
            
            let modalViewController = CustomAlertViewController(title: "Error", description: errorMessage,
                                                                firstButtonText: "Try Again", secondButtonText: "Ok",
                                                                firstButtonAction: {
                                                                    self.fetchData()
            })
            modalViewController.modalPresentationStyle = .overCurrentContext
            self.present(modalViewController, animated: true, completion: nil)
        }
    }
}
