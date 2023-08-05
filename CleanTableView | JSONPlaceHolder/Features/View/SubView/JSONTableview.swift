//
//  JSONTableview.swift
//  CleanTableView | JSONPlaceHolder
//
//  Created by Serhat  Şimşek  on 4.08.2023.
//

import UIKit

protocol JSONTableViewInputProtocol {
    func updateItems(items: [JSONPlaceHolderPostModel])
}
protocol JSONTableViewOutputProtocol: AnyObject {
    func updateItem(item: JSONPlaceHolderPostModel)
}

class JSONTableview: NSObject {
    private lazy var items: [JSONPlaceHolderPostModel] = []
    /// Json tableView output models
    weak var delegateTableviewOutput: JSONTableViewOutputProtocol?
}

extension JSONTableview: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegateTableviewOutput?.updateItem(item: items[indexPath.row])
    }
}

extension JSONTableview: JSONTableViewInputProtocol {
    func updateItems(items: [JSONPlaceHolderPostModel]) {
        self.items = items
    }
}
