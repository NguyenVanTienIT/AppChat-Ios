//
//  UIViewExtenstion.swift
//  AppChat
//
//  Created by Tiến Nguyễn Văn on 18/12/2022.
//

import Foundation
import UIKit

extension UIView {
    var borderWidth : CGFloat {
         set {
             layer.borderWidth = newValue
         }

         get {
             return layer.borderWidth
         }
     }
    
    var width: CGFloat {
        return layer.frame.width
    }
    
    var height: CGFloat {
        return layer.frame.height
    }
    
    var top: CGFloat {
        return layer.frame.origin.y
    }
    
    var bottom: CGFloat {
        return layer.frame.origin.y + layer.frame.height
    }
    
    var left: CGFloat {
        return layer.frame.origin.x
    }
    
    var right: CGFloat {
        return layer.frame.origin.x + layer.frame.width
    }
}
