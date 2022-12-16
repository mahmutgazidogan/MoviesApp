//
//  DetailViewController.swift
//  MoviesApp
//
//  Created by Mahmut Gazi Doğan on 1.12.2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailOverview: UILabel!
    @IBOutlet weak var detailTitleLabel: UILabel!
    
    var movieDetail: ResultsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        detailOverview.text = movieDetail?.overview
        detailTitleLabel.text = movieDetail?.original_title
        detailImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original\(movieDetail?.backdrop_path ?? "")"))
    }
}
