//
//  MenuViewController.swift
//  iOS14UIKitSampler
//
//  Created by Kazuhiro Hayashi on 2020/07/29.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var menuBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuBarButtonItem.menu = UIMenu(title: "", children: [
            UIAction(title: "Edit", image: UIImage(systemName: "square.and.pencil")) { (_) in
                
            },
            UIAction(title: "Delete", image: UIImage(systemName: "xmark.circle"),  attributes: .destructive) { (_) in
            
            }
        ])
        
        
        
        
        
        
        
        
        button.showsMenuAsPrimaryAction = true
        button.menu = UIMenu(title: "", children: [
            UIAction(title: "Edit", image: UIImage(systemName: "square.and.pencil")) { (_) in
                
            },
            UIAction(title: "Delete", image: UIImage(systemName: "xmark.circle"),  attributes: .destructive) { (_) in
            
            }
        ])
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
