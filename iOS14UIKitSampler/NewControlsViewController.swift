//
//  NewControlsViewController.swift
//  iOS14UIKitSampler
//
//  Created by Kazuhiro Hayashi on 2020/07/29.
//

import UIKit

class NewControlsViewController: UIViewController {
    @IBOutlet weak var datePickerButton: UIButton!
    
    override var canBecomeFirstResponder: Bool {
        true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerButton.addAction(UIAction { [weak self] _ in
            self?.present(
                UIStoryboard(name: "DatePickerViewController", bundle: nil).instantiateInitialViewController()!,
                animated: true,
                completion: nil)
        }, for: .touchUpInside)

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func colorPickerButtonTouchUpInside(_ sender: UIButton) {
        let vc = UIColorPickerViewController()
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
}

extension NewControlsViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        print(viewController.selectedColor)
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        
    }
}
