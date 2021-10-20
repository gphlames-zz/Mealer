//
//  recipedetailsview.swift
//  Hydrate
//
//  Created by user on 29/09/2021.
//  Copyright © 2021 swift tech. All rights reserved.
//

import UIKit

class recipedetailsview: UIView {

    lazy var backbutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        return button
    }()
    lazy var imageview: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    override func layoutSubviews() {
        self.addSubview(backbutton)
        self.addSubview(imageview)
        backbutton.frame = CGRect(x: 5, y: 20, width: 50, height: 50)
        imageview.frame = self.frame
    }
}
