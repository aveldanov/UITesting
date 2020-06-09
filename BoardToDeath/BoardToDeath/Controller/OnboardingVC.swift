//
//  OnboardingVC.swift
//  BoardToDeath
//
//  Created by Caleb Stultz on 1/15/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import UIKit

class OnboardingVC: UIPageViewController {

    lazy var orderedViewControllers: [UIViewController] = {
        return [newVC(withID: VCID_ONBOARD_1),
                newVC(withID: VCID_ONBOARD_2),
                newVC(withID: VCID_ONBOARD_3)]
    }()
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = VIEW_ID_ONBOARD_VIEW
        
        dataSource = self
        delegate = self
        configurePageControl()
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func newVC(withID id: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id)
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.currentPage = 0
        pageControl.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(pageControl)
    }
}

extension OnboardingVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = orderedViewControllers.index(of: viewController) else { return nil }
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else { return orderedViewControllers.last }
        
        guard orderedViewControllers.count > previousIndex else { return nil }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = orderedViewControllers.index(of: viewController) else { return nil }
        
        let nextIndex = vcIndex + 1
        
        guard nextIndex >= 0 else { return orderedViewControllers.first }
        
        guard orderedViewControllers.count > nextIndex else { return nil }
        
        return orderedViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let pageContentViewController = pageViewController.viewControllers?[0] else { return }
        guard let currentVCPage = orderedViewControllers.index(of: pageContentViewController) else { return }
        pageControl.currentPage = currentVCPage
    }
}
