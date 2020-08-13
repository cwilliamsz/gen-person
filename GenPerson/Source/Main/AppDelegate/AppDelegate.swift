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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initialViewController()
        return true
    }

    // MARK: Initial View Controller
    func initialViewController() {
        guard let personController  = PersonViewController.fromNib(owner: self),
            let historyController   = HistoryViewController.fromNib(owner: self),
            let settingsController  = SettingsViewController.fromNib(owner: self)
        else {
            return
        }

        let tabBarController = UITabBarController()
        if #available(iOS 13.0, *) { tabBarController.overrideUserInterfaceStyle = .light }

        switch Language.current {
        case .Portuguese:
            personController.tabBarItem = UITabBarItem(title: String(withCustomIdentifier: StringIdentifier.CommonNewPt),
                                                       image: UIImage(withImageIdentifier: ImageIdentifier.IconAdd),
                                                       tag: 0)

            historyController.tabBarItem = UITabBarItem(title: String(withCustomIdentifier: StringIdentifier.HistoryTitlePt),
                                                        image: UIImage(withImageIdentifier: ImageIdentifier.IconHistory),
                                                        tag: 1)

            settingsController.tabBarItem = UITabBarItem(title: String(withCustomIdentifier: StringIdentifier.SettingsTitlePt),
                                                        image: UIImage(withImageIdentifier: ImageIdentifier.IconSettings),
                                                        tag: 2)

        case .English:
            personController.tabBarItem = UITabBarItem(title: String(withCustomIdentifier: StringIdentifier.CommonNewEng),
                                                       image: UIImage(withImageIdentifier: ImageIdentifier.IconAdd),
                                                       tag: 0)

            historyController.tabBarItem = UITabBarItem(title: String(withCustomIdentifier: StringIdentifier.HistoryTitleEng),
                                                        image: UIImage(withImageIdentifier: ImageIdentifier.IconHistory),
                                                        tag: 1)

            settingsController.tabBarItem = UITabBarItem(title: String(withCustomIdentifier: StringIdentifier.SettingsTitleEng),
                                                         image: UIImage(withImageIdentifier: ImageIdentifier.IconSettings),
                                                         tag: 2)
        }

        let navControllerPerson = UINavigationController(rootViewController: personController)
        navControllerPerson.navigationBar.prefersLargeTitles    = false
        navControllerPerson.navigationBar.isTranslucent         = true
        navControllerPerson.navigationBar.backgroundColor       = Color.viewBackground()
        navControllerPerson.navigationBar.tintColor             = Color.mainColor()

        let navControllerHistory = UINavigationController(rootViewController: historyController)
        navControllerHistory.navigationBar.prefersLargeTitles   = false
        navControllerHistory.navigationBar.isTranslucent        = true
        navControllerHistory.navigationBar.backgroundColor      = Color.viewBackground()
        navControllerHistory.navigationBar.tintColor            = Color.mainColor()

        let navControllerSettings = UINavigationController(rootViewController: settingsController)
        navControllerSettings.navigationBar.prefersLargeTitles  = false
        navControllerSettings.navigationBar.isTranslucent       = true
        navControllerSettings.navigationBar.backgroundColor     = Color.viewBackground()
        navControllerSettings.navigationBar.tintColor           = Color.mainColor()

        if #available(iOS 13.0, *) {
            navControllerPerson.overrideUserInterfaceStyle      = .light
            navControllerHistory.overrideUserInterfaceStyle     = .light
            navControllerSettings.overrideUserInterfaceStyle    = .light
        }

        tabBarController.viewControllers        = [navControllerPerson, navControllerHistory, navControllerSettings]
        tabBarController.tabBar.tintColor       = Color.mainColor()
        tabBarController.tabBar.backgroundColor = Color.viewBackground()
        tabBarController.tabBar.isTranslucent   = false

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = tabBarController
    }
}
