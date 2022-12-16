//
//  MovieViewController.swift
//  MoviesApp
//
//  Created by Mahmut Gazi Doğan on 4.12.2022.
//

import UIKit
import Foundation
import Kingfisher

class MovieViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var dataList = [ResultsModel]()
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fillData()
    }
    
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func fillData() {
        service.getAllTitle { [weak self] model in
            self?.dataList = model
            self?.tableView.reloadData()
        } onFail: { error in
            print(error)
        }
    }
}


extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Detail", bundle: nil)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let movieDetail = self.dataList[indexPath.row]
        detailViewController.movieDetail = movieDetail
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellMovies") as? MoviesTableViewCell else { return UITableViewCell() }
        let dataList = dataList[indexPath.row]
        cell.configure(movieDetail: dataList)
        return cell
    }
}
