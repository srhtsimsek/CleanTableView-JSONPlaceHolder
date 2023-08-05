//
//  JSONPlaceHolderViewController.swift
//  CleanTableView | JSONPlaceHolder
//
//  Created by Serhat  Şimşek  on 4.08.2023.
//

import UIKit

class JSONPlaceHolderViewController: UIViewController {
    
    @IBOutlet weak var tableViewJsonPlaceHolder: UITableView!
    private let jsonTableView: JSONTableview = JSONTableview()
    private let jsonService: JSONPlaceHolderServiceProtocol = JSONPlaceHolderService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDelegate()
        initService()
    }
    
    func initDelegate(){
        tableViewJsonPlaceHolder.dataSource = jsonTableView
        tableViewJsonPlaceHolder.delegate = jsonTableView
        jsonTableView.delegateTableviewOutput = self
    }
    func initService(){
        jsonService.fetcAllPosts { [weak self] (models) in
            self?.jsonTableView.updateItems(items: models)
            self?.tableViewJsonPlaceHolder.reloadData()
        } onFail: { (data) in
            print(data ?? "" )
        }
    }
}

extension JSONPlaceHolderViewController: JSONTableViewOutputProtocol {
    func updateItem(item: JSONPlaceHolderPostModel) {
        print(item.body)
    }
}
