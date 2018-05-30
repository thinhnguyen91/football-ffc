//
//  UIScrollViewExt.swift
//  OneMore
//
//  Created by Thinh Nguyen on 5/29/18.
//  Copyright © 2018 Thinh Nguyen X. All rights reserved.
//

import Foundation
import SwiftUtils

extension UIScrollView {
    var height: CGFloat {
        return bounds.size.height
    }
    
    var width: CGFloat {
        return bounds.size.width
    }
    
    var contentOffsetX: CGFloat {
        return contentOffset.x
    }
    
    var current: CGFloat {
        return round(contentOffsetX / width)
    }
    
    var pageLeft: CGFloat {
        return contentOffsetX - width
    }
    
    var pageRight: CGFloat {
        return contentOffsetX + width
    }
    
    func frame(x: CGFloat, y: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
}
