//
//  HomeViewController.swift
//  OneMore
//
//  Created by Thinh Nguyen X on 4/26/18.
//  Copyright © 2018 Thinh Nguyen X. All rights reserved.
//

import UIKit
import SwiftUtils
import DLPageMenu

private struct Config {
    static let width = kScreenSize.width
    static let height = kScreenSize.height * Ratio.horizontal
    static let tintuc = "Tin Tức"
    static let ketqua = "Kết Quả"
    static let lich = "Lịch Đấu"
}

enum TabIndex : Int {
    case newsTab = 0
    case resultTab = 1
    case calendarTab = 2
}

typealias PageContenType = ViewController

enum ViewController: Int {
    case news = 1
    case result = 2
    case calendar = 3
}
final class HomeViewController: UIViewController {

    @IBOutlet private weak var optionView: UIView!
    @IBOutlet private weak var imageView: UIImageView!

    lazy var animationView = UIView()
    private var currentPageIndex = 0
    private var arrayVC: [UIViewController] = []
    var viewControllers = [UIViewController]()

    private var lastPendingViewControllerIndex = 1
    private var currentViewController: UIViewController?
    private let pageVC = UIPageViewController(transitionStyle: .scroll,
                                              navigationOrientation: .horizontal,
                                              options: nil)

    private var news = ViewController.news.rawValue
    private var calendar = ViewController.calendar.rawValue
    private var result = ViewController.result.rawValue

    lazy var newsVC: UIViewController = {
        let newsVC = NewsViewController()
        return newsVC
    }()
    lazy var resultVC : UIViewController = {
        let resultVC = ResultViewController()
        return resultVC
    }()
    lazy var calendarVC : UIViewController = {
        let calendarVC = CalendarViewController()
        return calendarVC
    }()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        //configUIFC()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }



    private func configUI() {
        navigationController?.isNavigationBarHidden = true
        configPageMenu()
    }

    private func initData() {
        viewControllers.append(newsVC)
        viewControllers.append(resultVC)
        viewControllers.append(calendarVC)
    }

    private func configPageMenu() {
        viewControllers.append(newsVC)
        viewControllers.append(resultVC)
        viewControllers.append(calendarVC)
        newsVC.title = Config.tintuc
        resultVC.title = Config.ketqua
        calendarVC.title = Config.lich
        configMenuOption()
    }

    // Page menu UI option
    private func configMenuOption() {
        var option = PageMenuOption(frame: CGRect(x: 0,
                                                  y: optionView.frame.origin.y * Ratio.horizontal,
                                                  width: optionView.frame.width * Ratio.horizontal,
                                                  height: optionView.frame.height * Ratio.horizontal))
        option.frame.origin.y = optionView.frame.origin.y * Ratio.horizontal
        option.menuItemHeight = 25
        option.menuItemWidth = kScreenSize.width / 3 - 20
        option.menuTitleColorNormal = App.Color.gray126
        option.menuTitleColorSelected = App.Color.yellow251
        option.menuItemBackgroundColorNormal = App.Color.mainBlue
        option.menuItemBackgroundColorSelected = .clear
        option.menuIndicatorColor = App.Color.yellow251
        option.menuIndicatorHeight = 2
        let pageMenu = DLPageMenu(viewControllers: viewControllers, option: option)
        pageMenu.backgroundColor = App.Color.mainBlue
        view.addSubview(pageMenu)
    }
}
