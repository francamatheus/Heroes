//
//  HeroDetailViewController.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 19/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController {
    
    var hero: HeroModel?

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var hqButton: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupNavBar()
        setupData()
    }
    
    // MARK: - Init
    convenience init(heroModel: HeroModel) {
        self.init()
        self.hero = heroModel
    }
    
    // MARK: - Setup
    func setupNavBar() {
        self.title = hero?.name
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupLayout() {
        nameLabel.numberOfLines = 2
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        descriptionLabel.numberOfLines = 0
        
        pictureImageView.contentMode = .scaleAspectFill
        
        hqButton.setTitle("MOST EXPENSIVE HQ", for: .normal)
        hqButton.tintColor = .white
        hqButton.backgroundColor = .red
        hqButton.clipsToBounds = true
        hqButton.layer.cornerRadius = 12
    }
    
    func setupData() {
        nameLabel.text = hero?.name
        descriptionLabel.text = hero?.description
        let url = URL(string: hero?.image ?? "")
        pictureImageView.kf.setImage(with: url)
    }
    
    // MARK: - Actions
    @IBAction func goToHq(_ sender: Any) {
        guard let nav = self.navigationController, let id = hero?.id else { return }
        AppCoordinator.goToHeroHq(parent: nav, heroId: id)
    }
}
