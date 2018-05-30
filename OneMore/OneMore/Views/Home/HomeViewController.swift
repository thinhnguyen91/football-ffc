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
    static let height = kScreenSize.height
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
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var contentView: UIView!
    
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
    private var images: [String] = ["3", "2", "6", "4", "5", "1", "7"]
    fileprivate var indexScrollView = Int()
    private var timer: Timer?
    
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        TimerManager.share.float = CGFloat(images.count)
        TimerManager.share.scrollView = scrollView
        TimerManager.share.startRelay()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = currentViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        TimerManager.share.stopRelay()
    }

    private func configUI() {
        navigationController?.isNavigationBarHidden = true
        configPageMenu()
        contentView.backgroundColor = App.Color.mainBlue
        configPageControl()
         configScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.isDirectionalLockEnabled = false
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
                                                  y: contentView.frame.maxY * Ratio.horizontal,
                                                  width: optionView.frame.width * Ratio.horizontal,
                                                  height: optionView.frame.height * Ratio.horizontal))
        option.frame.origin.y = contentView.frame.maxY
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
    
    // configPageControl
    private func configPageControl() {
        pageControl.backgroundColor = .clear
        pageControl.pageIndicatorTintColor = App.Color.gray126
        pageControl.currentPageIndicatorTintColor = App.Color.yellow251
    }
    
    private func configScrollView() {
        scrollView.clear()
        configImage()
        let widthContent = Config.width * CGFloat(images.count)
        let heightContent = scrollView.height
        scrollView.contentSize = CGSize(width: widthContent, height: heightContent)
        scrollView.isScrollEnabled = images.count > 1
        scrollView.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleContentViewAfterClicked))
        scrollView.addGestureRecognizer(tapGesture)
        pageControl.numberOfPages = images.count
        pageControl.addTarget(self, action: #selector(changePage(sender:)), for: .valueChanged)
    }
    
    private func configImage() {
        for subView in scrollView.subviews {
            subView.removeFromSuperview()
        }
        for i in 0..<images.count {
            let image = images[i]
            let imageView = UIImageView()
            let x = Config.width * CGFloat(i)
            imageView.frame = CGRect(x: x, y: -20, width: Config.width, height: scrollView.height + 20)
            imageView.contentMode = .scaleToFill
            imageView.backgroundColor = .white
            imageView.image = UIImage(named: image)
            indexScrollView = i
            scrollView.contentSize.width = scrollView.width * CGFloat(i + 1)
            scrollView.addSubview(imageView)
        }
    }

    @objc private func changePage(sender: AnyObject) {
        let x = CGFloat(pageControl.currentPage) * scrollView.width
        scrollView.setContentOffset(CGPoint(x: x, y :0), animated: true)
    }

    @objc private func handleContentViewAfterClicked() {
      
    }
}

// MARK: - UIScrollViewDelegate
extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == self.scrollView else { return }
        pageControl.currentPage = Int(scrollView.current)
        scrollView.contentOffset.y = 0
    }
}
