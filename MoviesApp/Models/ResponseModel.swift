//
//  ResponseModel.swift
//  MoviesApp
//
//  Created by Mahmut Gazi Doğan on 1.12.2022.
//

import Foundation

struct ResponseModel: Codable {
    var page:Int?
    var results:[ResultsModel]?
}
