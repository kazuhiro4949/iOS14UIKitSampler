//
//  UIControlViewController.swift
//  iOS14UIKitSampler
//
//  Created by Kazuhiro Hayashi on 2020/07/30.
//

import UIKit

class UIControlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let frame = CGRect(x: 0, y: 100, width: 320, height: 36)

        let segmentControl = UISegmentedControl(frame: frame, actions: [
            UIAction(title: "segment1") { _ in
                // ...
            },
            UIAction(title: "segment2") { _ in
                // ...
            },
            UIAction(title: "segment3") { _ in
                // ...
            }
        ])
        
        view.addSubview(segmentControl)
        
        
        let button = UIButton(type: .close)
        button.addAction(UIAction { (_) in
            // ...
        }, for: .touchUpInside)
        
        let uiSwitch =  UISwitch(frame: frame)
        uiSwitch.addAction(UIAction { (_) in
            // ...
        }, for: .valueChanged)
        
        let slider = UISlider(frame: frame)
        uiSwitch.addAction(UIAction { (_) in
            // ...
        }, for: .valueChanged)
        
        let action = UIAction { (_) in
            // ...
        }
        
        button.removeAction(action, for: .touchUpInside)
        
        view.addSubview(button)
        view.addSubview(uiSwitch)
        view.addSubview(slider)

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
