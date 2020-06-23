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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = hero?.description
        nameLabel.text = hero?.name
        descriptionLabel.numberOfLines = 0
        
        let url = URL(string: hero?.image ?? "")
        pictureImageView.kf.setImage(with: url)
        pictureImageView.contentMode = .scaleAspectFill
        
        hqButton.titleLabel?.text = "MOST EXPENSIVE HQ"

        // Do any additional setup after loading the view.
    }
    
    func setupNavBar() {
        
    }
    
    convenience init(heroModel: HeroModel) {
        self.init()
        self.hero = heroModel
    }
}
