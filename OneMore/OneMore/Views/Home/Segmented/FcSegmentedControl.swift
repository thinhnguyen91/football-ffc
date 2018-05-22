//
//  FcSegmentedControl.swift
//  OneMore
//
//  Created by Thinh Nguyen X on 4/26/18.
//  Copyright © 2018 Thinh Nguyen X. All rights reserved.
//

import UIKit
import SwiftUtils

final class FcSegmentedControl: UISegmentedControl {

    //    func drawRect(){
    //        super.drawRect()
    //        initUI()
    //    }

    func initUI(){
        setupBackground()
        setupFonts()
    }

    func setupBackground(){
        let backgroundImage = UIImage(named: "segmented_unselected_bg")
        let dividerImage = UIImage(named: "segmented_separator_bg")
        let backgroundImageSelected = UIImage(named: "segmented_selected_bg")

        setBackgroundImage(backgroundImage, for: UIControlState(), barMetrics: .default)
        setBackgroundImage(backgroundImageSelected, for: .highlighted, barMetrics: .default)
        setBackgroundImage(backgroundImageSelected, for: .selected, barMetrics: .default)

        setDividerImage(dividerImage, forLeftSegmentState: UIControlState(), rightSegmentState: .selected, barMetrics: .default)
        setDividerImage(dividerImage, forLeftSegmentState: .selected, rightSegmentState: UIControlState(), barMetrics: .default)
        setDividerImage(dividerImage, forLeftSegmentState: UIControlState(), rightSegmentState: UIControlState(), barMetrics: .default)
    }

    func setupFonts(){
        let font = Font.Hiragino.w3(size: 15)

        let normalTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.black,
            NSAttributedStringKey.font: font
        ]

        setTitleTextAttributes(normalTextAttributes, for: UIControlState())
        setTitleTextAttributes(normalTextAttributes, for: .highlighted)
        setTitleTextAttributes(normalTextAttributes, for: .selected)
    }

}
