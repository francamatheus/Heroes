//
//  HeroesModel.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 22/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

// swiftlint:disable line_length
let descriptionMock = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ornare ipsum quam, eu dapibus neque venenatis ac. Aliquam pharetra dui urna, eget elementum dolor rutrum rhoncus. Vestibulum consectetur pulvinar nibh condimentum sollicitudin. Donec eget elit eget enim tempus efficitur a non velit. Pellentesque vel dui quam. Sed fringilla faucibus dolor, vulputate accumsan nibh. Suspendisse dapibus dui sed arcu volutpat, sed cursus elit facilisis. Morbi faucibus consequat vestibulum. Mauris finibus ligula vitae sem euismod semper. Sed enim velit, dictum non nunc quis, tempus rutrum velit. Fusce tristique, mi a ullamcorper dapibus, est dolor aliquam massa, rhoncus porttitor tortor mi in ex. Sed quis dapibus risus, eu placerat turpis. Nulla ullamcorper feugiat malesuada. Aenean metus augue, imperdiet vitae cursus sed, vulputate sit amet tellus. Sed consectetur sapien lacus. Nunc mattis nisi at sagittis blandit. Morbi eu nisl et mauris tempus ultrices ut vitae purus. Sed molestie convallis eros, ut hendrerit dui finibus a. Mauris eu ipsum congue, finibus nunc id, consequat eros"

import Foundation

class HeroModel: Codable {
    var image: String
    var name: String
    var id: String
    var description: String
    
    init(image: String, name: String, id: String, description: String = descriptionMock ) {
        self.image = image
        self.name = name
        self.id = id
        self.description = description
    }
}
