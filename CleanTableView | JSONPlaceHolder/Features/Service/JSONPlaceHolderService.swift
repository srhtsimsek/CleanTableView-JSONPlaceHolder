//
//  JSONPlaceHolderService.swift
//  CleanTableView | JSONPlaceHolder
//
//  Created by Serhat  Şimşek  on 4.08.2023.
//

import Alamofire

enum JsonPlaceHolderPath: String {
    case POST = "/posts"
}

extension JsonPlaceHolderPath {
    func withBaseUrl() -> String {
        return "https://jsonplaceholder.typicode.com\(self.rawValue)"
    }
}

protocol JSONPlaceHolderServiceProtocol {
    func fetcAllPosts(onSuccess: @escaping ([JSONPlaceHolderPostModel]) -> Void, onFail: @escaping (String?) -> Void)
}

struct JSONPlaceHolderService {
    
}

extension JSONPlaceHolderService: JSONPlaceHolderServiceProtocol {
    func fetcAllPosts(onSuccess: @escaping ([JSONPlaceHolderPostModel]) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(JsonPlaceHolderPath.POST.withBaseUrl(), method: .get).validate().responseDecodable(of: [JSONPlaceHolderPostModel].self) { (response) in
            guard let items = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
}
