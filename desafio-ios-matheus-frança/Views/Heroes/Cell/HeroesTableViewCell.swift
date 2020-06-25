//
//  HeroesTableViewCell.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 22/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Kingfisher
import UIKit

class HeroesTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        picture.makeRounded()
        picture.contentMode = .scaleAspectFill
        self.selectionStyle = .none
    }
    
    func configCell(data: HeroModel) {
        setImage(image: data.image ?? "")
        nameLabel.text = data.name
    }
    
    func setImage(image: String) {
        let url = URL(string: image)
        picture.kf.setImage(with: url)
    }
}

extension UIImageView {

    func makeRounded() {

        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
