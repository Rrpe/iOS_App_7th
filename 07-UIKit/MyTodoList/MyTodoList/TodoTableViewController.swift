//
//  TodoTableViewController.swift
//  MyTodoList
//
//  Created by KimJunsoo on 3/20/25.
//

import UIKit

class TodoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Todo List"
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    

}
