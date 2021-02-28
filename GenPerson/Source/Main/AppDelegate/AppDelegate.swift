//
//  AppDelegate.swift
//  GenPerson
//
//  Created by Charles on 04/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initialViewController()
        return true
    }

    // MARK: Initial View Controller
    func initialViewController() {
        guard let personVC  = PersonViewController.fromNib(owner: self),
            let historyVC   = HistoryViewController.fromNib(owner: self),
            let settingsVC  = SettingsViewController.fromNib(owner: self) else {
            return
        }

        let tabBarController = UITabBarController()
        tabBarController.overrideUserInterfaceStyle = .light

        switch Language.current {
        case .portuguese:
            personVC.tabBarItem = UITabBarItem(title: String(identifier: StringIdentifier.commonNewPt),
                                               image: UIImage(identifier: ImageIdentifier.iconAdd),
                                               tag: 0)

            historyVC.tabBarItem = UITabBarItem(title: String(identifier: StringIdentifier.historyTitlePt),
                                                image: UIImage(identifier: ImageIdentifier.iconHistory),
                                                tag: 1)

            settingsVC.tabBarItem = UITabBarItem(title: String(identifier: StringIdentifier.settingsTitlePt),
                                                 image: UIImage(identifier: ImageIdentifier.iconSettings),
                                                 tag: 2)

        case .english:
            personVC.tabBarItem = UITabBarItem(title: String(identifier: StringIdentifier.commonNewEng),
                                               image: UIImage(identifier: ImageIdentifier.iconAdd),
                                               tag: 0)

            historyVC.tabBarItem = UITabBarItem(title: String(identifier: StringIdentifier.historyTitleEng),
                                                image: UIImage(identifier: ImageIdentifier.iconHistory),
                                                tag: 1)

            settingsVC.tabBarItem = UITabBarItem(title: String(identifier: StringIdentifier.settingsTitleEng),
                                                 image: UIImage(identifier: ImageIdentifier.iconSettings),
                                                 tag: 2)
        }

        [personVC, historyVC, settingsVC].forEach { (viewController) in
            let navigationController = setNavigationController(for: viewController)
            tabBarController.viewControllers?.append(navigationController)
        }

        tabBarController.tabBar.tintColor       = Color.mainColor()
        tabBarController.tabBar.backgroundColor = Color.viewBackground()
        tabBarController.tabBar.isTranslucent   = false

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = tabBarController
    }

    func setNavigationController(for viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles    = false
        navigationController.navigationBar.isTranslucent         = true
        navigationController.navigationBar.backgroundColor       = Color.viewBackground()
        navigationController.navigationBar.tintColor             = Color.mainColor()
        navigationController.overrideUserInterfaceStyle          = .light
        return navigationController
    }
}
