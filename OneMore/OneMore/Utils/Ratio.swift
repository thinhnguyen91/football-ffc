//
//  Ratio.swift
//  OneMore
//
//  Created by Thinh Nguyen X on 4/18/18.
//  Copyright © 2018 Thinh Nguyen X. All rights reserved.
//

import Foundation
import SwiftUtils

struct Ratio {

    static let horizontal = kScreenSize.width / DeviceType.iPhone6.size.width
    static let vertical = kScreenSize.height / DeviceType.iPhone6.size.height
    public static let widthIPhone6 = UIScreen.main.bounds.width / UIScreen.widthIphone6
}

extension UIScreen {

    public static var widthIphone6: CGFloat {
        return 375
    }
}
