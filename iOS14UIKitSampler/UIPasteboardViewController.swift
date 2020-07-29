//
//  UIPasteboardViewController.swift
//  iOS14UIKitSampler
//
//  Created by Kazuhiro Hayashi on 2020/07/30.
//

import UIKit

class UIPasteboardViewController: UIViewController {
    @IBOutlet weak var pasteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pasteButton.addAction(UIAction { _ in
            UIPasteboard.general.detectValues(for: [.probableWebURL]) { (result) in
                print(try? result.get())
            }
        }, for: .touchUpInside)
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
