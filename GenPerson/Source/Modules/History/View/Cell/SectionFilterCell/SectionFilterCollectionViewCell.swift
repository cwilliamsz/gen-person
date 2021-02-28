//
//  SectionFilterCollectionViewCell.swift
//  GenPerson
//
//  Created by Charles on 25/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

class SectionFilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyle()
    }

    private func applyStyle() {
        labelTitle.layer.cornerRadius  = labelTitle.frame.height / 2
        labelTitle.layer.masksToBounds = true
    }

    func config(settingOption: SettingOption, selected: SettingOption, item: DetailProtocol) {
        var title = String()
        var detail = String()

        switch settingOption {
        case .ageRange:
            title = item.title()

            guard let ageRange = item as? AgeRange else {
                return
            }

            let range = ageRange.range()
            detail = "\(range.0)-\(range.1)"

        default:
            title = item.title()
            detail = item.description()
        }

        if detail == String(identifier: StringIdentifier.commonRandomPt) {
            detail = String(identifier: StringIdentifier.commonAllPt)
        }

        let attrs1 = [NSAttributedString.Key.font: Font.labelTag(),
                       NSAttributedString.Key.foregroundColor: Color.mainColor()]

        let attrs2 = [NSAttributedString.Key.font: Font.labelSubTag(),
                      NSAttributedString.Key.foregroundColor: Color.mainColor()]

        let attributedString1 = NSMutableAttributedString(string: title, attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: "\n\(detail)", attributes: attrs2)

        attributedString1.append(attributedString2)
        labelTitle.attributedText = attributedString1

        let isSelected = settingOption == selected
        let mainColor = Color.mainColorBackground()
        labelTitle.backgroundColor     = isSelected ? mainColor : Color.mainBackground()
        labelTitle.layer.borderColor   = isSelected ? mainColor.cgColor : UIColor.clear.cgColor
        labelTitle.backgroundColor     = isSelected ? mainColor : Color.subBackground()
        labelTitle.layer.borderWidth   = isSelected ? 2 : 0
    }

}
