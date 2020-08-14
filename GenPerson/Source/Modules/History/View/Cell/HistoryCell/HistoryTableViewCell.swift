//
//  HistoryTableViewCell.swift
//  GenPerson
//
//  Created by Charles on 14/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var buttonProfile: UIButton!
    @IBOutlet weak var imageViewNationality: UIImageView!

    private let attrs1 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular),
                  NSAttributedString.Key.foregroundColor: UIColor.black]

    private let attrs2 = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular),
                  NSAttributedString.Key.foregroundColor: UIColor.lightGray]

    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func config(_ person: Person) {
        let ageInfo = person.dateOfBirth.getAge()

        let attributedString1 = NSMutableAttributedString(string: person.name,
                                                          attributes: attrs1)

        let attributedString2 = NSMutableAttributedString(string: "\n\(String(format: ageInfo.1, ageInfo.0))",
                                                          attributes: attrs2)

        attributedString1.append(attributedString2)
        labelTitle.attributedText = attributedString1

        // Country icon
        let country = Country(rawValue: person.country)
        switch country {
        case .brazil:
            imageViewNationality.image = UIImage(identifier: ImageIdentifier.iconBrazil)
        case .unitedStates:
            imageViewNationality.image = UIImage(identifier: ImageIdentifier.iconUSA)
        default:
            imageViewNationality.isHidden = true
        }

        // Profile icon
        let gender = Gender(rawValue: person.sexOfBirth)

        switch gender {
        case .female:
            buttonProfile.setImage(UIImage(identifier: ImageIdentifier.iconWoman).withRenderingMode(.alwaysOriginal),
            for: .normal)
            buttonProfile.layer.borderColor = Color.female().cgColor
        case .masculine:
            buttonProfile.setImage(UIImage(identifier: ImageIdentifier.iconMan).withRenderingMode(.alwaysOriginal),
            for: .normal)
            buttonProfile.layer.borderColor = Color.masculine().cgColor
        default:
            break
        }
    }

    private func applyStyle() {
        self.backgroundColor = .white

        buttonProfile.layer.masksToBounds = true
        buttonProfile.layer.cornerRadius = buttonProfile.frame.height / 2
        buttonProfile.layer.borderWidth = 1
        buttonProfile.backgroundColor = .clear

        imageViewNationality.layer.masksToBounds = true
        imageViewNationality.layer.cornerRadius = imageViewNationality.frame.height / 2
    }

}
