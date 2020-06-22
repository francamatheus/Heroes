//
//  HeroesTableViewCell.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 22/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import UIKit
//import Kingfisher


class HeroesTableViewCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    
    func configCell(data: HeroModel) {
        setImage(image: data.image)
        name.text = data.name
    }
    
    func setImage(image: String) {
//        let url = URL(string: image)
//        picture.kf.setImage(with: url)
    }
}
