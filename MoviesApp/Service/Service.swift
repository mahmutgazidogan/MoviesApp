//
//  Service.swift
//  MoviesApp
//
//  Created by Mahmut Gazi Doğan on 6.12.2022.
//

import UIKit
import Foundation

class Service {
    func getAllTitle(onSuccess:@escaping ([ResultsModel]) -> Void, onFail:@escaping (String?) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=5c4396df206a1be40c522966e6fcc2ba") else { return }
        URLSession.shared.dataTask(with: url){ data,response,error in
            if error != nil || data == nil {
                onFail("error")
                return
            }
            do{
                let answer = try JSONDecoder().decode(ResponseModel.self, from: data!)
                if let comingDataList = answer.results {
                    onSuccess(comingDataList)
                }
            } catch{
                onFail(error.localizedDescription)
            }
        }.resume()
    }
}
