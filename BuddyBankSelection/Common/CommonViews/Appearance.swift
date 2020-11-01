//
//  Appearance.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 30/10/2020.
//

import UIKit

final class Appearances {
    class func setGlobalAppearance() {
        UIBarButtonItem.appearance().setTitleTextAttributes([.font: UIFont(isBold: false, withSize: 17)], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([.font: UIFont(isBold: false, withSize: 17)], for: .highlighted)
        UIBarButtonItem.appearance().tintColor = UIColor.lightBlue
        UINavigationBar.appearance().tintColor = .lightBlue
    }
}


extension UIFont {
    convenience init(isBold: Bool, withSize size: CGFloat) {
        self.init(name: isBold ? "ComicSansMS-Bold" : "Comic Sans MS", size: size)!
    }
    
    static var defaultFont: UIFont {
        return UIFont(isBold: false, withSize: 15)
    }
    
    static var boldFont: UIFont {
        return UIFont(isBold: true, withSize: 15)
    }
}

extension UINavigationBar {
    
    func shouldRemoveShadow(_ value: Bool) -> Void {
        if value {
            self.setValue(true, forKey: "hidesShadow")
            self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.shadowImage = UIImage()
        } else {
            self.setValue(false, forKey: "hidesShadow")
        }
    }
}

extension UIColor {
    static var lightBlue: UIColor {
        return UIColor(red: 158/256, green: 224/256, blue: 255/256, alpha: 1)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(in: 0.3 ... 1),
            green: .random(in: 0.3 ... 1),
            blue:  .random(in: 0.3 ... 1),
           alpha: 1.0
        )
    }
}
