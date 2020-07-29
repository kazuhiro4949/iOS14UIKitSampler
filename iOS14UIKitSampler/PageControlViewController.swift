//
//  PageControlViewController.swift
//  iOS14UIKitSampler
//
//  Created by Kazuhiro Hayashi on 2020/07/29.
//

import UIKit

class PageControlViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.preferredIndicatorImage = UIImage(systemName: "airplane")
        pageControl.setIndicatorImage(UIImage(systemName: "car"), forPage: 1)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func valueDidChanged(_ sender: UIPageControl) {
        scrollView.setContentOffset(CGPoint(x: scrollView.bounds.width * CGFloat(sender.currentPage), y: 0), animated: true)
    }
}

extension PageControlViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(round(scrollView.contentOffset.x/scrollView.bounds.width))
    }
}
