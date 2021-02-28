//
//  SettingsViewController.swift
//  GenPerson
//
//  Created by Charles on 21/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var viewModel = SettingsViewModel()
    private var isActionCells = true
    private let defaultCenter = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNotifications()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard isActionCells else { return }
        tableView.reloadData()
    }

    private func loadData() {
        guard isActionCells else { return }
        let options: [[SettingOption]] = [[.gender, .nationality, .ageRange], [.idiom]]
        viewModel.load(items: options)
    }

    private func registerNib() {
        tableView.registerNib(UINib(nibName: TableViewCellIdentifier.settingCell.rawValue, bundle: nil),
        forCellReuseIdentifier: TableViewCellIdentifier.settingCell)
    }

    func viewConfig(isAction: Bool = false, items: [[Any]], titleDetail: String = String()) {
        isActionCells = isAction
        viewModel.load(items: items)
        tableView.reloadData()

        guard !isAction else { return }
        self.title = titleDetail
    }

}

// MARK: - SetupProtocol
extension SettingsViewController: SetupProtocol {

    func setup() {
        applyStyle()
        applyLanguage()
        registerNib()

        tableView.dataSource        = self
        tableView.delegate          = self
        tableView.tableFooterView   = UIView()

        loadData()
    }

    func applyStyle() {
        view.overrideUserInterfaceStyle      = .light
        tableView.overrideUserInterfaceStyle = .light

        view.backgroundColor                        = UIColor.white
        tableView.backgroundView?.backgroundColor   = .white
        tableView.backgroundColor                   = Color.tableViewBackground()
    }

    func applyLanguage() {
        switch Language.current {
        case .portuguese:
            self.title = String(identifier: StringIdentifier.settingsTitlePt)
        case .english:
            self.title = String(identifier: StringIdentifier.settingsTitleEng)
        }
    }

}

// MARK: - TableView
extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = Color.tableViewBackground()
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.heightForHeaderInSection(isActionCells)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(TableViewCellIdentifier.settingCell,
                                                                     forIndexPath: indexPath)
        guard let settingCell = cell as? SettingTableViewCell else {
            return UITableViewCell()
        }

        if isActionCells, let item = viewModel.getItem(indexPath: indexPath) {
            settingCell.config(isAction: isActionCells, settingOption: item)
        } else {
            settingCell.config(isAction: isActionCells,
                               title: viewModel.getTitle(indexPath: indexPath),
                               detail: viewModel.getDetail(indexPath: indexPath),
                               isSelected: viewModel.isSelected(indexPath: indexPath))
        }

        return settingCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard isActionCells else {
            viewModel.saveSelected(indexPath: indexPath)
            navigationController?.popViewController(animated: true)
            return
        }

        guard let settingsVC = SettingsViewController.fromNib(owner: self) as? SettingsViewController else {
            return
        }

        settingsVC.viewConfig(isAction: false,
                      items: viewModel.getItemsForDetail(indexPath: indexPath),
                      titleDetail: viewModel.getTitle(indexPath: indexPath))

        navigationController?.pushViewController(settingsVC, animated: true)
    }

}

// MARK: - Change Language
extension SettingsViewController {

    private func setupNotifications() {
        let notificationName = NSNotification.Name(rawValue: NotificationIdentifier.changeLanguage.rawValue)
        defaultCenter.addObserver(self, selector: #selector(changeLanguage),
                                  name: notificationName,
                                  object: nil)
    }

    @objc private func changeLanguage() {
        applyLanguage()
    }

}
