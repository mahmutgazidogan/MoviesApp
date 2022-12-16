//
//  MoviesTableViewCell.swift
//  MoviesApp
//
//  Created by Mahmut Gazi Doğan on 1.12.2022.
//

import UIKit
import Kingfisher

class MoviesTableViewCell: UITableViewCell {
    @IBOutlet weak var imageOnCell: UIImageView!
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(movieDetail: ResultsModel) {
        imageOnCell.kf.setImage(with:  URL(string: "https://image.tmdb.org/t/p/original\(movieDetail.backdrop_path ?? "")"))
        originalTitleLabel.text = movieDetail.original_title
        overviewLabel.text = movieDetail.overview
    }
}
