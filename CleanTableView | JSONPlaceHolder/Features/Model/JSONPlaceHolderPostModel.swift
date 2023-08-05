//
//  JSONPlaceHolderPostModel.swift
//  CleanTableView | JSONPlaceHolder
//
//  Created by Serhat  Şimşek  on 4.08.2023.
//

import Foundation

struct JSONPlaceHolderPostModel: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
