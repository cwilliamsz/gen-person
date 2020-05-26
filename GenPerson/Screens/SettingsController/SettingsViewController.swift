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
    
    private var vm = SettingsViewModel()
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
        vm.load(items: options)
    }
    
    private func registerNib() {
        tableView.registerNib(UINib(nibName: TableViewCellIdentifier.SettingCell.rawValue, bundle: nil),
        forCellReuseIdentifier: TableViewCellIdentifier.SettingCell)
    }
    
    func viewConfig(isAction: Bool = false, items: [[Any]], titleDetail: String = String()) {
        isActionCells = isAction
        vm.load(items: items)
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
        case .Portuguese:
            self.title = String(withCustomIdentifier: StringIdentifier.SettingsTitlePt)
        case .English:
            self.title = String(withCustomIdentifier: StringIdentifier.SettingsTitleEng)
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
        return vm.heightForHeaderInSection(isActionCells)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return vm.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfItems(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(TableViewCellIdentifier.SettingCell, forIndexPath: indexPath) as? SettingTableViewCell
        else {
            return UITableViewCell()
        }
        
        if isActionCells, let item = vm.getItem(indexPath: indexPath) {
            cell.config(isAction: isActionCells, settingOption: item)
            
        } else {
            cell.config(isAction: isActionCells,
                        title: vm.getTitle(indexPath: indexPath),
                        detail: vm.getDetail(indexPath: indexPath),
                        isSelected: vm.isSelected(indexPath: indexPath))
        }
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard isActionCells else {
            vm.saveSelected(indexPath: indexPath)
            navigationController?.popViewController(animated: true)
            return
        }
        
        guard let vc = SettingsViewController.fromNib(owner: self) as? SettingsViewController else { return }
        vc.viewConfig(isAction: false,
                      items: vm.getItemsForDetail(indexPath: indexPath),
                      titleDetail: vm.getTitle(indexPath: indexPath))
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - Change Language
extension SettingsViewController {
    
    private func setupNotifications() {
        defaultCenter.addObserver(self, selector: #selector(changeLanguage),
                                  name: NSNotification.Name(rawValue: NotificationIdentifier.ChangeLanguage.rawValue),
                                  object: nil)
    }
    
    @objc private func changeLanguage() {
        applyLanguage()
    }
    
}
