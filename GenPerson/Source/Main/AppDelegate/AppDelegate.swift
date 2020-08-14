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
            let settingsVC  = SettingsViewController.fromNib(owner: self)
        else {
            return
        }

        let tabBarController = UITabBarController()
        if #available(iOS 13.0, *) { tabBarController.overrideUserInterfaceStyle = .light }

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

        let navControllerPerson = UINavigationController(rootViewController: personVC)
        navControllerPerson.navigationBar.prefersLargeTitles    = false
        navControllerPerson.navigationBar.isTranslucent         = true
        navControllerPerson.navigationBar.backgroundColor       = Color.viewBackground()
        navControllerPerson.navigationBar.tintColor             = Color.mainColor()

        let navControllerHistory = UINavigationController(rootViewController: historyVC)
        navControllerHistory.navigationBar.prefersLargeTitles   = false
        navControllerHistory.navigationBar.isTranslucent        = true
        navControllerHistory.navigationBar.backgroundColor      = Color.viewBackground()
        navControllerHistory.navigationBar.tintColor            = Color.mainColor()

        let navControllerSettings = UINavigationController(rootViewController: settingsVC)
        navControllerSettings.navigationBar.prefersLargeTitles  = false
        navControllerSettings.navigationBar.isTranslucent       = true
        navControllerSettings.navigationBar.backgroundColor     = Color.viewBackground()
        navControllerSettings.navigationBar.tintColor           = Color.mainColor()

        if #available(iOS 13.0, *) {
            navControllerPerson.overrideUserInterfaceStyle      = .light
            navControllerHistory.overrideUserInterfaceStyle     = .light
            navControllerSettings.overrideUserInterfaceStyle    = .light
        }

        tabBarController.viewControllers        = [navControllerPerson,
                                                   navControllerHistory,
                                                   navControllerSettings]

        tabBarController.tabBar.tintColor       = Color.mainColor()
        tabBarController.tabBar.backgroundColor = Color.viewBackground()
        tabBarController.tabBar.isTranslucent   = false

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = tabBarController
    }
}
