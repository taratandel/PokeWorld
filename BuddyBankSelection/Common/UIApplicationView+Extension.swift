//
//  UIApplicationViewGettable.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 02/11/2020.
//

import UIKit

extension UIApplication {
    var topViewController: UIViewController?{
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if keyWindow?.rootViewController == nil{
            return keyWindow?.rootViewController
        }
        
        var pointedViewController = keyWindow?.rootViewController
        
        while  pointedViewController?.presentedViewController != nil {
            switch pointedViewController?.presentedViewController {
            case let navagationController as UINavigationController:
                pointedViewController = navagationController.viewControllers.last
            default:
                pointedViewController = pointedViewController?.presentedViewController
            }
        }
        return pointedViewController
    }
}

protocol TopViewControllerGettable  {
    var topViewController: UIViewController? { get }
    var topNavController: UINavigationController? { get }
    var topTabController: UITabBarController? { get }
}

extension TopViewControllerGettable {
    var topViewController: UIViewController? {
        return UIApplication.shared.topViewController
    }
    
    var topNavController: UINavigationController? {
        return UIApplication.shared.topViewController as? UINavigationController
    }
    
    var topTabController: UITabBarController? {
        return UIApplication.shared.topViewController as? UITabBarController
    }
}

