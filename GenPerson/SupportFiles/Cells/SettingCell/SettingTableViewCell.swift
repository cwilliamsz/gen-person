//
//  SettingTableViewCell.swift
//  GenPerson
//
//  Created by Charles on 18/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDeatil: UILabel!
    @IBOutlet weak var imageViewIconRight: UIImageView!
    @IBOutlet weak var constraintImageViewIconRightWidth: NSLayoutConstraint!
    @IBOutlet weak var constraintViewIconWidth: NSLayoutConstraint!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var viewIcon: UIView!
    @IBOutlet weak var constraintImageViewCheckWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(isAction: Bool = true, title: String, detail: String = String(), isSelected: Bool = false) {
        labelTitle.text = title
        labelTitle.textAlignment = .left
        labelTitle.font = .systemFont(ofSize: 17, weight: .regular)
        labelTitle.textColor = .darkText
        
        labelDeatil.text = detail
        labelDeatil.textAlignment = .right
        labelDeatil.font = .systemFont(ofSize: 17, weight: .regular)
        labelDeatil.textColor = .lightGray
        
        constraintImageViewIconRightWidth.constant  = isAction ? 20 : 0
        constraintImageViewCheckWidth.constant      = isAction ? 0 : 20
        constraintViewIconWidth.constant            = isAction ? 0 : 20
        
        viewIcon.backgroundColor = .clear
        let image = isSelected ? UIImage(withImageIdentifier: ImageIdentifier.IconCircleSelected) : UIImage(withImageIdentifier: ImageIdentifier.IconCircle)
        iconImageView.image = image?.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = Color.mainColor()
    }
    
    func config(isAction: Bool = true, settingOption: SettingOption) {
        var detail = String()
        var icon = UIImage()
        
        switch settingOption {
        case .gender:
            detail = Gender.current.raw()
            
            viewIcon.backgroundColor = Gender.color
            icon = UIImage(withImageIdentifier: ImageIdentifier.IconGender)
            
        case .nationality:
            detail = Country.currentNationality.nationality()
            
            viewIcon.backgroundColor = Country.color
            icon = UIImage(withImageIdentifier: ImageIdentifier.IconNationality)
            
        case .ageRange:
            detail = AgeRange.current.raw()
            
            viewIcon.backgroundColor = AgeRange.color
            icon = UIImage(withImageIdentifier: ImageIdentifier.IconAgeRange)
            
        case .idiom:
            detail = Language.current.raw()
            
            viewIcon.backgroundColor = Language.color
            icon = UIImage(withImageIdentifier: ImageIdentifier.IconLanguage)
        }
        
        viewIcon.layer.cornerRadius = 8
        viewIcon.layer.masksToBounds = true
        iconImageView.image = icon.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = .white
        
        labelTitle.text = settingOption.raw()
        labelDeatil.text = detail
    }
    
    func applyStyle() {
        labelTitle.textAlignment = .left
        labelTitle.font = .systemFont(ofSize: 17, weight: .regular)
        labelTitle.textColor = .darkText
        
        labelDeatil.textAlignment = .right
        labelDeatil.font = .systemFont(ofSize: 17, weight: .regular)
        labelDeatil.textColor = .lightGray
    }
}
