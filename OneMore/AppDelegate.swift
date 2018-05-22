//
//  AppDelegate.swift
//  OneMore
//
//  Created by Thinh Nguyen X on 4/18/18.
//  Copyright © 2018 Thinh Nguyen X. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    static let shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Cannot cast `UIApplication.shared.delegate` to `AppDelegate`.")
        }
        return shared
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let homeViewController = HomeViewController()
        configRootView(viewController:homeViewController)
        configIQKeyboard()
        return true
    }

}

extension AppDelegate {
    func configRootView(viewController: UIViewController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navi = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        UIApplication.shared.statusBarStyle = .lightContent
    }

    fileprivate func configIQKeyboard() {
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().shouldResignOnTouchOutside = true
    }
}
