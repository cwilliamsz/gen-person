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

    func config(settingOption: SettingOption, selected: SettingOption, item: Any) {
        var title = String()
        var detail = String()

        switch settingOption {
        case .ageRange:
            switch Language.current {
            case .english:
                title = String(identifier: StringIdentifier.ageRangeTitleEng)

            case .portuguese:
                title = String(identifier: StringIdentifier.ageRangeTitlePt)
            }

            let range = (item as! AgeRange).range()
            detail = "\(range.0)-\(range.1)"

        case .gender:
            switch Language.current {
            case .english:
                title = String(identifier: StringIdentifier.genderTitleEng)

            case .portuguese:
                title = String(identifier: StringIdentifier.genderTitlePt)
            }

            detail = (item as! Gender).raw()

        case .nationality:
            switch Language.current {
            case .english:
                title = String(identifier: StringIdentifier.nationalityTitleEng)

            case .portuguese:
                title = String(identifier: StringIdentifier.nationalityTitlePt)
            }

            detail = (item as! Country).nationality()

        default:
            break
        }

        if detail == String(identifier: StringIdentifier.commonRandomPt) {
            detail = String(identifier: StringIdentifier.commonAllPt)
        } else if detail == String(identifier: StringIdentifier.commonRandomEng) {
            detail = String(identifier: StringIdentifier.commonAllEng)
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
