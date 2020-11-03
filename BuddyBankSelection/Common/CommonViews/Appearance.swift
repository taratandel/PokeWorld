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
    static var veryLightBlue: UIColor {
        return UIColor(rgb: 0xc8e7ff)
    }
    static var cutePink: UIColor {
        return UIColor(rgb: 0xffcbf2)
    }
    
    static var cuteVelvet : UIColor {
        return UIColor(rgb: 0xe5b3fe)
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(in: 0.4 ... 1),
            green: .random(in: 0.4 ... 1),
            blue:  .random(in: 0.4 ... 1),
           alpha: 1.0
        )
    }
    
    static func darkRandom() -> UIColor {
        return UIColor(
        red:   .random(in: 0.0 ... 0.5),
        green: .random(in: 0.0 ... 0.5),
        blue:  .random(in: 0.0 ... 0.5),
            alpha: 0.8
        )
    }
}
