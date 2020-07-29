//
//  TableViewController.swift
//  iOS14UIKitSampler
//
//  Created by Kazuhiro Hayashi on 2020/07/29.
//

import UIKit

class TableViewController: UITableViewController {
    var dataSource: [(name: String, storyboardId: String)] = [
        ("PageControl", "PageControlViewController"),
        ("New Controls", "NewControlsViewController"),
        ("Menu", "MenuViewController"),
        ("UIControls", "UIControlViewController"),
        ("Sidebar", "SidebarModalViewController"),
        ("List", "ListViewController"),
        ("ListContentView", "ListContentViewController"),
        ("UIPasteboard", "UIPasteboardViewController")
        
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        clearsSelectionOnViewWillAppear = true
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(systemName: "checkmark")
        content.text = dataSource[indexPath.row].name
        content.imageProperties.tintColor = .blue
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: dataSource[indexPath.row].storyboardId, bundle: nil)
            .instantiateInitialViewController()!
        navigationController?.pushViewController(vc, animated: true)
    }
}
