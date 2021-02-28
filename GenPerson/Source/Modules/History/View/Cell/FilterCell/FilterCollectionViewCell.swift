//
//  FilterCollectionViewCell.swift
//  GenPerson
//
//  Created by Charles on 24/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var viewCenter: UIView!
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelIcon: UILabel!
    @IBOutlet weak var constraintImageViewIconHeight: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func config(item: Any, selected: Any) {
        labelTitle.text = String()
        labelIcon.text  = String()

        constraintImageViewIconHeight.constant = 40

        switch item {
        case is Gender:
            let gender = item as! Gender
            setGender(gender: gender, isSelected: gender == selected as! Gender)

        case is Country:
            let country = item as! Country
            setCountry(country: country, isSelected: country == selected as! Country)

        case is AgeRange:
            let ageRange = item as! AgeRange
            setAgeRange(ageRange: ageRange, isSelected: ageRange == selected as! AgeRange)

        default:
            break
        }
    }

    private func setGender(gender: Gender, isSelected: Bool) {
        labelTitle.text         = gender.raw()
        labelIcon.isHidden      = true
        imageViewIcon.isHidden  = false

        switch gender {
        case .female:
            imageViewIcon.image = UIImage(identifier: ImageIdentifier.iconWoman)
        case .masculine:
            imageViewIcon.image = UIImage(identifier: ImageIdentifier.iconMan)
        default:
            setTextAllWhenRandom()
            labelIcon.isHidden                      = false
            imageViewIcon.isHidden                  = true
            constraintImageViewIconHeight.constant  = 0
        }

        setSelected(isSelected)
    }

    private func setAgeRange(ageRange: AgeRange, isSelected: Bool) {
        let range = ageRange.range()

        if range.0 == 0 && range.1 == 100 {
            setTextAllWhenRandom()
        } else {
            labelTitle.text = ageRange.raw()
        }

        labelIcon.text          = "\(range.0)-\(range.1)"
        labelIcon.isHidden      = false
        imageViewIcon.isHidden  = true

        setSelected(isSelected)
    }

    private func setCountry(country: Country, isSelected: Bool) {
        labelTitle.text         = country.nationality()
        labelIcon.isHidden      = true
        imageViewIcon.isHidden  = false

        switch country {
        case .brazil:
            imageViewIcon.image = UIImage(identifier: ImageIdentifier.iconBrazil)
        case .unitedStates:
            imageViewIcon.image = UIImage(identifier: ImageIdentifier.iconUSA)
        default:
            setTextAllWhenRandom()
            labelIcon.isHidden                      = false
            imageViewIcon.isHidden                  = true
            constraintImageViewIconHeight.constant  = 0
        }

        setSelected(isSelected)
    }

    private func setSelected(_ selected: Bool) {
        let borderColor                     = selected ? Color.mainColor() : Color.textFieldBorder()
        viewBackground.layer.borderColor    = borderColor.cgColor
        viewBackground.backgroundColor      = selected ? Color.mainColorBackground() : Color.viewBackground()
        viewBackground.layer.borderWidth    = selected ? 2 : 1
    }

    private func setTextAllWhenRandom() {
        switch Language.current {
        case .portuguese:
            labelTitle.text = String(identifier: StringIdentifier.commonAllPt)
        case .english:
            labelTitle.text = String(identifier: StringIdentifier.commonAllEng)
        }
    }

}

// MARK: - SetupProtocol
extension FilterCollectionViewCell: SetupProtocol {

    func setup() {
        applyStyle()
    }

    func applyStyle() {
        self.contentView.backgroundColor    = Color.mainBackground()
        viewBackground.backgroundColor      = Color.viewBackground()
        viewBackground.layer.borderColor    = Color.textFieldBorder().cgColor
        viewBackground.layer.borderWidth    = 1
        viewBackground.layer.cornerRadius   = 8
        viewBackground.layer.shadowColor    = UIColor.black.cgColor
        viewBackground.layer.shadowOffset   = CGSize(width: 2, height: 8)
        viewBackground.layer.shadowOpacity  = 0.04
        viewBackground.layer.shadowRadius   = 8
        viewCenter.backgroundColor          = Color.subBackground()

        labelTitle.font = Font.labelTitle()
        labelIcon.font  = Font.buttonFilter()
    }

    func applyLanguage() {
    }

}
