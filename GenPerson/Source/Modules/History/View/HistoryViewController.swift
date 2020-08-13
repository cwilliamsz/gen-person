//
//  HistoryViewController.swift
//  GenPerson
//
//  Created by Charles on 14/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var buttonFilter: UIButton!
    @IBOutlet weak var constraintViewSearchHeight: NSLayoutConstraint!

    @IBOutlet weak var viewFilter: UIView!
    @IBOutlet weak var collectionViewSection: UICollectionView!
    @IBOutlet weak var collectionViewFilter: UICollectionView!
    @IBOutlet weak var constraintViewFilterHeight: NSLayoutConstraint!
    @IBOutlet weak var constraintCollectionViewFilterHeight: NSLayoutConstraint!
    @IBOutlet weak var constraintCollectionViewSectionHeight: NSLayoutConstraint!

    private let vm = HistoryViewModel()
    private let defaultCenter = NotificationCenter.default
    private var timer = Timer()
    private var showFilter = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNotifications()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reload()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyLanguage()
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchBar.showsCancelButton = false
        view.endEditing(true)
    }

    private func reload() {
        _ = vm.searchIsActive ? searchBar(searchBar, textDidChange: vm.searchText) : vm.reloadData()
        tableView.reloadData()
    }

    private func dismissSearch() {
        view.endEditing(true)
        searchBar.text = String()
        searchBar.showsCancelButton = false
    }

    private func registerNib() {
        tableView.registerNib(UINib(nibName: TableViewCellIdentifier.HistoryCell.rawValue, bundle: nil),
                                    forCellReuseIdentifier: TableViewCellIdentifier.HistoryCell)

        collectionViewFilter.registerNib(UINib.init(nibName: CollectionViewCellIdentifier.FilterCell.rawValue,
                                                    bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.FilterCell.rawValue)

        collectionViewSection.registerNib(UINib.init(nibName: CollectionViewCellIdentifier.SectionFilterCell.rawValue,
                                                    bundle: nil), forCellWithReuseIdentifier: CollectionViewCellIdentifier.SectionFilterCell.rawValue)
    }

    private func setupCollectionViewFilter() {
        let cellSize    = CGSize(width: 160, height: 120)
        let layout      = UICollectionViewFlowLayout()

        layout.scrollDirection          = .horizontal
        layout.itemSize                 = cellSize
        layout.sectionInset             = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing       = 0
        layout.minimumInteritemSpacing  = 10

        collectionViewFilter.collectionViewLayout           = layout
        collectionViewFilter.showsHorizontalScrollIndicator = false
        collectionViewFilter.showsVerticalScrollIndicator   = false
        collectionViewFilter.isScrollEnabled                = true

        collectionViewFilter.delegate   = self
        collectionViewFilter.dataSource = self
    }

    private func setupCollectionViewSection() {
        let cellSize    = CGSize(width: 140, height: 60)
        let layout      = UICollectionViewFlowLayout()

        layout.scrollDirection          = .horizontal
        layout.itemSize                 = cellSize
        layout.sectionInset             = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing       = 0
        layout.minimumInteritemSpacing  = 10

        collectionViewSection.collectionViewLayout           = layout
        collectionViewSection.showsHorizontalScrollIndicator = false
        collectionViewSection.showsVerticalScrollIndicator   = false
        collectionViewSection.isScrollEnabled                = true

        collectionViewSection.delegate   = self
        collectionViewSection.dataSource = self
    }

}

// MARK: - Actions
extension HistoryViewController {

    @IBAction func filter(_ sender: Any) {
        showFilter = !showFilter

        let icon = showFilter ? UIImage(withImageIdentifier: ImageIdentifier.IconUp) : UIImage(withImageIdentifier: ImageIdentifier.IconDown)

        UIView.animate(withDuration: 0.4, animations: {
            self.constraintCollectionViewSectionHeight.constant = self.showFilter ? 60 : 0
            self.constraintCollectionViewFilterHeight.constant  = self.showFilter ? 120 : 0
            self.constraintViewFilterHeight.constant            = self.showFilter ? 188 : 0

            self.buttonFilter.setImage(icon!.withRenderingMode(.alwaysTemplate), for: .normal)
            self.view.layoutIfNeeded()
        })
    }

    @IBAction func tapFilterOption(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        switch button.tag {
        case 1:
            vm.selectFilter(selected: .ageRange)
        case 2:
            vm.selectFilter(selected: .gender)
        case 3:
            vm.selectFilter(selected: .nationality)
        default:
            break
        }

        collectionViewFilter.reloadData()
    }

}

// MARK: - SetupProtocol
extension HistoryViewController: SetupProtocol {

    func setup() {
        applyStyle()

        searchBar.delegate              = self
        tableView.delegate              = self
        tableView.dataSource            = self
        tableView.rowHeight             = UITableView.automaticDimension
        tableView.estimatedRowHeight    = vm.heightForRow

        setupCollectionViewSection()
        setupCollectionViewFilter()
        registerNib()
    }

    func applyStyle() {
        view.backgroundColor                        = Color.viewBackground()
        searchBar.tintColor                         = Color.mainColor()
        viewSearch.backgroundColor                  = Color.viewBackground()
        viewFilter.backgroundColor                  = Color.mainBackground()
        collectionViewSection.backgroundColor       = Color.mainBackground()
        collectionViewFilter.backgroundColor        = Color.mainBackground()
        tableView.backgroundView?.backgroundColor   = Color.viewBackground()
        tableView.backgroundColor                   = Color.viewBackground()
        tableView.tableFooterView                   = UIView()

        buttonFilter.tintColor          = Color.mainColor()
        buttonFilter.backgroundColor    = .clear

        buttonFilter.titleLabel?.font           = Font.buttonFilter()
        buttonFilter.semanticContentAttribute   = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft

        buttonFilter.setImage(UIImage(withImageIdentifier: ImageIdentifier.IconDown).withRenderingMode(.alwaysTemplate), for: .normal)

        constraintCollectionViewSectionHeight.constant  = 0
        constraintCollectionViewFilterHeight.constant   = 0
        constraintViewFilterHeight.constant             = 0
    }

    func applyLanguage() {
        let numberOfFiltersActive = vm.numberOfFiltersActive()
        switch Language.current {
        case .English:
            self.title = String(withCustomIdentifier: StringIdentifier.HistoryTitleEng)
            searchBar.placeholder = String(withCustomIdentifier: StringIdentifier.SearchTitleEng)

            let title = "\(String(withCustomIdentifier: StringIdentifier.FilterTitleEng))(\(numberOfFiltersActive))"
            buttonFilter.setTitle(title, for: .normal)

        case .Portuguese:
            self.title = String(withCustomIdentifier: StringIdentifier.HistoryTitlePt)
            searchBar.placeholder = String(withCustomIdentifier: StringIdentifier.SearchTitlePt)

            let title = "\(String(withCustomIdentifier: StringIdentifier.FilterTitlePt))(\(numberOfFiltersActive))"
            buttonFilter.setTitle(title, for: .normal)
        }
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewCellIdentifier.HistoryCell, forIndexPath: indexPath) as! HistoryTableViewCell
        if let item = vm.item(for: indexPath.row) {
            cell.config(item)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = PersonViewController.fromNib(owner: self) as? PersonViewController,
              let person = vm.item(for: indexPath.row) else { return }

        vc.person = person
        navigationController?.pushViewController(vc, animated: true)
    }

}

// MARK: UISearchBarDelegate
extension HistoryViewController: UISearchBarDelegate {

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        vm.cancelSearch()
        dismissSearch()
        reload()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            guard searchText.count > 2 else { return }
            self.vm.search(text: searchText) {
                self.tableView.reloadData()
            }
        })
    }

}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension HistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.numberOfItemsInSection(tag: collectionView.tag)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.SectionFilterCell.rawValue,
                                                          for: indexPath) as! SectionFilterCollectionViewCell

            if let settingOption = vm.itemForCell(row: indexPath.row, tag: collectionView.tag) as? SettingOption {
                cell.config(settingOption: settingOption,
                            selected: vm.filterSelected,
                            item: vm.optionSelected(settingOption) as Any)
            }

            return cell

        } else {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.FilterCell.rawValue,
                                                          for: indexPath) as! FilterCollectionViewCell

            cell.config(item: vm.itemForCell(row: indexPath.row, tag: collectionView.tag) as Any, selected: vm.optionSelected() as Any)
            return cell

        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = vm.itemForCell(row: indexPath.row, tag: collectionView.tag) else { return }
        guard collectionView.tag != 1 else {
            if let settingOption = item as? SettingOption {
                vm.selectFilter(selected: settingOption)
                collectionViewSection.reloadData()
                collectionViewFilter.reloadData()
            }
            return
        }

        vm.setOption(item: item)
        collectionViewSection.reloadData()
        collectionViewFilter.reloadData()
        reload()
        applyLanguage()
    }

}

// MARK: - Change Language
extension HistoryViewController {

    private func setupNotifications() {
        defaultCenter.addObserver(self,
                                  selector: #selector(changeLanguage),
                                  name: NSNotification.Name(rawValue: NotificationIdentifier.ChangeLanguage.rawValue), object: nil)
    }

    @objc private func changeLanguage() {
        applyLanguage()
        collectionViewSection.reloadData()
        collectionViewFilter.reloadData()
    }

}
