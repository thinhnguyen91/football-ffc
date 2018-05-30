//
//  TimerManager.swift
//  MyApp
//
//  Created by Thinh Nguyen X on 1/30/18.
//  Copyright © 2018 Asian Tech Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

private struct Config {
    static let motionImageDuration = 6
}
final class TimerManager {
    static let share = TimerManager()
    private var timer: Timer?
    var scrollView: UIScrollView?
    var float: CGFloat?

    // MARK: - stopRelay
    func pauseRelay() {
        timer?.invalidate()
    }

    func stopRelay() {
        timer?.fire()
    }

    func startRelay() {
        pauseRelay()
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(Config.motionImageDuration),
                                     target: self,
                                     selector: #selector(transferredNextPage),
                                     userInfo: nil,
                                     repeats: true)
    }

    @objc fileprivate func transferredNextPage() {
        guard let scrollView = scrollView, let float = float else { return }
        updateContentOffset(scroll: scrollView, float: float)
    }

   fileprivate func updateContentOffset(scroll: UIScrollView, float: CGFloat) {
        guard scroll == scrollView else { return }
        let maxWidth: CGFloat = scroll.width * float
        var slideToX = scroll.contentOffsetX + scroll.width
        if  slideToX == maxWidth {
            slideToX = 0
        }
        scrollView?.scrollRectToVisible(scroll.frame(x: slideToX, y: 0), animated: true)
    }
}
