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
            case .English:
                title = String(withCustomIdentifier: StringIdentifier.AgeRangeTitleEng)
                
            case .Portuguese:
                title = String(withCustomIdentifier: StringIdentifier.AgeRangeTitlePt)
            }
            
            let range = (item as! AgeRange).range()
            detail = "\(range.0)-\(range.1)"
            
        case .gender:
            switch Language.current {
            case .English:
                title = String(withCustomIdentifier: StringIdentifier.GenderTitleEng)
                
            case .Portuguese:
                title = String(withCustomIdentifier: StringIdentifier.GenderTitlePt)
            }
            
            detail = (item as! Gender).raw()
            
        case .nationality:
            switch Language.current {
            case .English:
                title = String(withCustomIdentifier: StringIdentifier.NationalityTitleEng)
                
            case .Portuguese:
                title = String(withCustomIdentifier: StringIdentifier.NationalityTitlePt)
            }
            
            detail = (item as! Country).nationality()
            
        default:
            break
        }
        
        if detail == String(withCustomIdentifier: StringIdentifier.CommonRandomPt) {
            detail = String(withCustomIdentifier: StringIdentifier.CommonAllPt)
        } else if detail == String(withCustomIdentifier: StringIdentifier.CommonRandomEng) {
            detail = String(withCustomIdentifier: StringIdentifier.CommonAllEng)
        }
        
        let attrs1 = [NSAttributedString.Key.font : Font.labelTag(),
                       NSAttributedString.Key.foregroundColor : Color.mainColor()]

        let attrs2 = [NSAttributedString.Key.font : Font.labelSubTag(),
                      NSAttributedString.Key.foregroundColor : Color.mainColor()]

        let attributedString1 = NSMutableAttributedString(string: title, attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string: "\n\(detail)", attributes: attrs2)

        attributedString1.append(attributedString2)
        labelTitle.attributedText = attributedString1
        
        let isSelected = settingOption == selected
        labelTitle.backgroundColor     = isSelected ? Color.mainColorBackground() : Color.mainBackground()
        labelTitle.layer.borderColor   = isSelected ? Color.mainColorBackground().cgColor : UIColor.clear.cgColor
        labelTitle.backgroundColor     = isSelected ? Color.mainColorBackground() : Color.subBackground()
        labelTitle.layer.borderWidth   = isSelected ? 2 : 0
        
    }

}
