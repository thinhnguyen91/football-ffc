//
//  Color.swift
//  OneMore
//
//  Created by Thinh Nguyen on 5/27/18.
//  Copyright © 2018 Thinh Nguyen X. All rights reserved.
//

import UIKit

extension App {
    struct Color {
        static let navigationBar = UIColor.black
        static let tableHeaderView = UIColor.gray
        static let tableFooterView = UIColor.red
        static let tableCellTextLabel = UIColor.yellow
        static let naviBar = red214
        static let toolBar = black565656
        static let pickerView = grayCDCDCD
        
        static func button(state: UIControlState) -> UIColor {
            switch state {
            case .normal: return .blue
            default: return .gray
            }
        }
        static let gray102 = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        static let gray242 = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        static let black565656 = #colorLiteral(red: 0.3372308612, green: 0.3375118077, blue: 0.3372743726, alpha: 1)
        static let grayCDCDCD = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        static let red214 = #colorLiteral(red: 0.8378158212, green: 0.1756822765, blue: 0.232298106, alpha: 1)
        static let red180 = #colorLiteral(red: 0.7058823529, green: 0.08235294118, blue: 0.1019607843, alpha: 1)
        static let gray212 = #colorLiteral(red: 0.831372549, green: 0.831372549, blue: 0.831372549, alpha: 1)
        static let gray126 = #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1)
        static let blue251 = #colorLiteral(red: 0.2980392157, green: 0.5607843137, blue: 0.9830927253, alpha: 1)
        static let gray217 = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
        static let appRed = #colorLiteral(red: 0.8392156863, green: 0.1764705882, blue: 0.2235294118, alpha: 1)
        static let appPink = #colorLiteral(red: 0.8941176471, green: 0.007843137255, blue: 0.4980392157, alpha: 1)
        static let mainBlue = #colorLiteral(red: 0.1019607843, green: 0.1803921569, blue: 0.3450980392, alpha: 1)
        static let blue13 = #colorLiteral(red: 0.05098039216, green: 0.1176470588, blue: 0.2705882353, alpha: 1)
        static let blue008 = #colorLiteral(red: 0.03137254902, green: 0.08235294118, blue: 0.1803921569, alpha: 1)
        static let yellow251 = #colorLiteral(red: 0.9843137255, green: 0.6901960784, blue: 0.231372549, alpha: 1)
        static let gray184 = #colorLiteral(red: 0.7214889526, green: 0.7216145396, blue: 0.7214810252, alpha: 1)
        static let blue007 = #colorLiteral(red: 0.01864526048, green: 0.4776622653, blue: 1, alpha: 1)
        static let yellow255 = #colorLiteral(red: 1, green: 0.9882352941, blue: 0.8392156863, alpha: 1)
        static let gray220 = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
    }
}
