//
//  ListContentViewController.swift
//  iOS14UIKitSampler
//
//  Created by Kazuhiro Hayashi on 2020/07/30.
//

import UIKit

class ListContentViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    
    var dataSource: [(title: String, subtitle: String)] = [
        ("title1", "subtitle1"),
        ("title2", "subtitle2"),
        ("title3", "subtitle3"),
        ("title4", "subtitle4"),
        ("title5", "subtitle5")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.forEach { (title, subtitle) in
            var configuration = UIListContentConfiguration.subtitleCell()
            configuration.text = title
            configuration.secondaryText = subtitle
            configuration.image = UIImage(systemName: "checkmark")
            configuration.imageProperties.tintColor = UIColor.systemBlue
            let listContentView = UIListContentView(configuration: configuration)
            stackView.addArrangedSubview(listContentView)
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


// ext.
class TableViewCell: UITableViewCell {
    override var isHighlighted: Bool {
        didSet {
            // ❎
        }
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        // ✅
        var content = defaultContentConfiguration().updated(for: state)
        if state.isHighlighted {
            content.text = "isHighlighted"
        }
        
        contentConfiguration = content
    }
}
