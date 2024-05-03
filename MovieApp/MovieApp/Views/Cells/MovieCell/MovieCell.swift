//
//  MovieCell.swift
//  MovieApp
//
//  Created by Ayxan Humbatov on 02.03.24.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet private weak var movieImageView:UIImageView!
    @IBOutlet private weak var titleLabel:UILabel!
    @IBOutlet private weak var subtitleLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    fileprivate func setupView(){
        movieImageView.layer.cornerRadius = 8
    }
}
