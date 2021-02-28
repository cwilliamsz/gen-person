//
//  PersonViewController.swift
//  GenPerson
//
//  Created by Charles on 04/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var buttonAdd: UIButton!

    // Data Fiels
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var imageViewProfile: UIImageView!
    @IBOutlet weak var imageViewNationality: UIImageView!

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var viewTextName: UIView!
    @IBOutlet weak var labelTextName: UILabel!
    @IBOutlet weak var imageViewStatusName: UIImageView!

    @IBOutlet weak var stackViewFirst: UIStackView!
    @IBOutlet weak var constraintStackViewFirstHeight: NSLayoutConstraint!
    @IBOutlet weak var labelDateOfBirth: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var textFieldDateOfBirth: UITextField!
    @IBOutlet weak var imageViewStatusDateOfBirth: UIImageView!

    @IBOutlet weak var textFieldDocument: UITextField!
    @IBOutlet weak var labelDocument: UILabel!
    @IBOutlet weak var imageViewStatusDocument: UIImageView!
    @IBOutlet weak var buttonDocument: UIButton!

    @IBOutlet weak var stackViewSecond: UIStackView!
    @IBOutlet weak var constraintStackViewSecondHeight: NSLayoutConstraint!
    @IBOutlet weak var labelSexOfBirth: UILabel!
    @IBOutlet weak var textFieldSexOfBirth: UITextField!
    @IBOutlet weak var imageViewStatusSexOfBirth: UIImageView!

    @IBOutlet weak var labelEthnicGroup: UILabel!
    @IBOutlet weak var textFieldEthnicGroup: UITextField!
    @IBOutlet weak var imageViewStatusEthnicGroup: UIImageView!

    @IBOutlet weak var viewThird: UIView!
    @IBOutlet weak var stackViewThird: UIStackView!
    @IBOutlet weak var constraintStackViewThirdHeight: NSLayoutConstraint!
    @IBOutlet weak var labelContact: UILabel!
    @IBOutlet weak var viewTextContact: UIView!
    @IBOutlet weak var labelTextContact: UILabel!
    @IBOutlet weak var imageViewStatusContact: UIImageView!

    @IBOutlet weak var labelRelationship: UILabel!
    @IBOutlet weak var textFieldRelationship: UITextField!
    @IBOutlet weak var imageViewStatusRelationship: UIImageView!

    @IBOutlet weak var labelContactPhone: UILabel!
    @IBOutlet weak var textFieldContactPhone: UITextField!
    @IBOutlet weak var imageViewStatusContactPhone: UIImageView!

    @IBOutlet weak var stackViewFourth: UIStackView!
    @IBOutlet weak var constraintStackViewFourthHeight: NSLayoutConstraint!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var imageViewStatusPhone: UIImageView!

    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var imageViewStatusEmail: UIImageView!

    private let viewModel = PersonViewModel()
    private let defaultCenter = NotificationCenter.default

    var person: Person?

    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyle()
        applyLanguage()
        setupNotifications()
        setLayout(setVertical: UIDevice.current.userInterfaceIdiom != .pad)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLayout(setVertical: traitCollection.horizontalSizeClass == .compact)
    }

    private func loadPerson(_ person: Person) {
        labelTextName.text          = person.name
        textFieldDocument.text      = person.document
        textFieldDateOfBirth.text   = person.dateOfBirth.toString
        textFieldSexOfBirth.text    = Gender(rawValue: person.sexOfBirth)?.raw()
        textFieldEthnicGroup.text   = EthnicGroup(rawValue: person.ethnicGroup)?.raw()
        textFieldEmail.text         = person.email
        textFieldPhone.text         = person.phone

        labelAge.text = viewModel.getAge(person)

        labelTextContact.text       = person.contactName
        textFieldRelationship.text  = Relationship(rawValue: person.contactRelationship)?.raw()
        textFieldContactPhone.text  = person.contactPhone

        let documentIsEnabled       = !person.document.isEmpty
        buttonDocument.isEnabled    = documentIsEnabled
        labelDocument.isEnabled     = documentIsEnabled

        // Profile
        switch viewModel.nationalityWithoutRandom {
        case .brazil:
            imageViewNationality.image = UIImage(identifier: ImageIdentifier.iconBrazil)
        case .unitedStates:
            imageViewNationality.image = UIImage(identifier: ImageIdentifier.iconUSA)
        default:
            break
        }

        let gender = Gender(rawValue: person.sexOfBirth)
        switch gender {
        case .female:
            let icon = UIImage(identifier: ImageIdentifier.iconWoman)
            imageViewProfile.image = icon?.withRenderingMode(.alwaysOriginal)
            viewProfile.layer.borderColor = Color.female().cgColor
        case .masculine:
            let icon = UIImage(identifier: ImageIdentifier.iconMan)
            imageViewProfile.image = icon?.withRenderingMode(.alwaysOriginal)
            viewProfile.layer.borderColor = Color.masculine().cgColor
        default:
            break
        }
    }

}

// MARK: - Actions
extension PersonViewController {
    @IBAction func createPerson(_ sender: Any) {
        setIconCopy()
        setFieldsText()
        loadPerson(viewModel.getPerson())
    }

    @IBAction func copyValue(_ sender: Any) {
        guard !(labelTextName.text?.isEmpty ?? true),
              let button: UIButton = sender as? UIButton else {
            return
        }

        var text = ""

        switch button.tag {
        case 1:
            setFieldsText(viewTextName)
            setIconCopy(imageViewStatusName)
            text = labelTextName.text ?? ""

        case 2:
            setFieldsText(textFieldDateOfBirth)
            setIconCopy(imageViewStatusDateOfBirth)
            text = textFieldDateOfBirth.text ?? ""

        case 3:
            setFieldsText(textFieldDocument)
            setIconCopy(imageViewStatusDocument)
            text = textFieldDocument.text ?? ""

        case 4:
            setFieldsText(textFieldSexOfBirth)
            setIconCopy(imageViewStatusSexOfBirth)
            text = textFieldSexOfBirth.text ?? ""

        case 5:
            setFieldsText(textFieldEthnicGroup)
            setIconCopy(imageViewStatusEthnicGroup)
            text = textFieldEthnicGroup.text ?? ""

        case 6:
            setFieldsText(viewTextContact)
            setIconCopy(imageViewStatusContact)
            text = labelTextContact.text ?? ""

        case 7:
            setFieldsText(textFieldRelationship)
            setIconCopy(imageViewStatusRelationship)
            text = textFieldRelationship.text ?? ""

        case 8:
            setFieldsText(textFieldContactPhone)
            setIconCopy(imageViewStatusContactPhone)
            text = textFieldContactPhone.text ?? ""

        case 9:
            setFieldsText(textFieldPhone)
            setIconCopy(imageViewStatusPhone)
            text = textFieldPhone.text ?? ""

        case 10:
            setFieldsText(textFieldEmail)
            setIconCopy(imageViewStatusEmail)
            text = textFieldEmail.text ?? ""

        default:
            break
        }

        UIPasteboard.general.string = text
    }
}

// MARK: - SetupProtocol
extension PersonViewController: SetupProtocol {

    func setup() {
        DbSetup().loadDB()

        guard let person = self.person else { return }
        loadPerson(person)
    }

    func applyStyle() {
        view.backgroundColor        = .white
        viewContent.backgroundColor = Color.mainBackground()
        scrollView.backgroundColor  = Color.mainBackground()

        viewProfile.backgroundColor     = .clear
        viewProfile.layer.borderWidth   = 2
        viewProfile.layer.masksToBounds = true
        viewProfile.layer.cornerRadius  = viewProfile.frame.height / 2
        viewProfile.layer.borderColor   = Color.textFieldBorder().cgColor

        viewThird.backgroundColor     = Color.subBackground()
        viewThird.layer.borderWidth   = 1
        viewThird.layer.borderColor   = Color.textFieldBorder().cgColor
        viewThird.layer.masksToBounds = true
        viewThird.layer.cornerRadius  = 8

        [stackViewFirst, stackViewSecond, stackViewThird, stackViewFourth].forEach { (stackView) in
            stackView?.subviews.forEach({ (subView) in
                subView.backgroundColor = Color.subBackground()
            })
        }

        [labelName, labelDocument, labelDateOfBirth, labelSexOfBirth, labelEthnicGroup, labelContact,
         labelRelationship, labelPhone, labelContactPhone, labelEmail].forEach { (label) in
            label?.font      = Font.labelTitle()
            label?.textColor = Color.labelTitleText()
        }

        labelAge.font       = Font.labelDetail()
        labelAge.textColor  = Color.labelDetailText()

        setFieldsText()
        setIconCopy()

        buttonAdd.layer.cornerRadius    = buttonAdd.frame.height / 2
        buttonAdd.backgroundColor       = Color.mainColor()
        buttonAdd.layer.masksToBounds   = true
        buttonAdd.titleLabel?.font      = Font.buttonGenerate()
        buttonAdd.setTitleColor(Color.buttonGenerateTitle(), for: .normal)
        buttonAdd.layer.shadowColor     = UIColor.black.cgColor
        buttonAdd.layer.shadowOffset    = CGSize(width: 0.0, height: 5.0)
        buttonAdd.layer.shadowRadius    = 10.0
        buttonAdd.layer.shadowOpacity   = 0.3
    }

    func applyLanguage() {
        switch Language.current {
        case .portuguese:
            self.title              = String(identifier: StringIdentifier.personTitlePt)
            labelName.text          = String(identifier: StringIdentifier.personNamePt)
            labelDocument.text      = String(identifier: StringIdentifier.personDocumentPt)
            labelDateOfBirth.text   = String(identifier: StringIdentifier.personDateOfBirthPt)
            labelSexOfBirth.text    = String(identifier: StringIdentifier.personSexOfBirthPt)
            labelEthnicGroup.text   = String(identifier: StringIdentifier.personEthnicGroupPt)
            labelContact.text       = String(identifier: StringIdentifier.personContactPt)
            labelRelationship.text  = String(identifier: StringIdentifier.personRelationshipPt)
            labelPhone.text         = String(identifier: StringIdentifier.personPhonePt)
            labelEmail.text         = String(identifier: StringIdentifier.personEmailPt)
            labelContactPhone.text  = String(identifier: StringIdentifier.personPhonePt)

            buttonAdd.setTitle(String(identifier: StringIdentifier.commonGeneratePt), for: .normal)

            self.tabBarItem = UITabBarItem(title: String(identifier: StringIdentifier.commonNewPt),
                                            image: UIImage(identifier: ImageIdentifier.iconAdd),
                                            tag: 0)

            guard tabBarController?.tabBar.items?.count ?? 0 > 2 else { return }
            tabBarController?.tabBar.items![1].title = String(identifier: StringIdentifier.historyTitlePt)
            tabBarController?.tabBar.items![2].title = String(identifier: StringIdentifier.settingsTitlePt)
        case .english:
            self.title              = String(identifier: StringIdentifier.personTitleEng)
            labelName.text          = String(identifier: StringIdentifier.personNameEng)
            labelDocument.text      = String(identifier: StringIdentifier.personDocumentEng)
            labelDateOfBirth.text   = String(identifier: StringIdentifier.personDateOfBirthEng)
            labelSexOfBirth.text    = String(identifier: StringIdentifier.personSexOfBirthEng)
            labelEthnicGroup.text   = String(identifier: StringIdentifier.personEthnicGroupEng)
            labelContact.text       = String(identifier: StringIdentifier.personContactEng)
            labelPhone.text         = String(identifier: StringIdentifier.personPhoneEng)
            labelEmail.text         = String(identifier: StringIdentifier.personEmailEng)
            labelRelationship.text  = String(identifier: StringIdentifier.personRelationshipEng)
            labelContactPhone.text  = String(identifier: StringIdentifier.personPhoneEng)

            buttonAdd.setTitle(String(identifier: StringIdentifier.commonGenerateEng), for: .normal)

            tabBarItem = UITabBarItem(title: String(identifier: StringIdentifier.commonNewEng),
                                            image: UIImage(identifier: ImageIdentifier.iconAdd),
                                            tag: 0)

            guard self.tabBarController?.tabBar.items?.count ?? 0 > 2 else { return }
            tabBarController?.tabBar.items![1].title = String(identifier: StringIdentifier.historyTitleEng)
            tabBarController?.tabBar.items![2].title = String(identifier: StringIdentifier.settingsTitleEng)
        }
    }

}

// MARK: - Style
extension PersonViewController {

    private func setLayout(setVertical: Bool) {
        [stackViewFirst, stackViewSecond, stackViewThird, stackViewFourth].forEach { (stackView) in
            stackView?.axis = setVertical ? .vertical : .horizontal
        }

        constraintStackViewFirstHeight.constant     = setVertical ? 156 : 78
        constraintStackViewSecondHeight.constant    = setVertical ? 156 : 78
        constraintStackViewThirdHeight.constant     = setVertical ? 156 : 78
        constraintStackViewFourthHeight.constant    = setVertical ? 156 : 78
    }

    private func setIconCopy(_ current: UIImageView = UIImageView()) {
        guard let icon = UIImage(identifier: ImageIdentifier.iconCopy) else { return }

        [imageViewStatusName,
         imageViewStatusDocument,
         imageViewStatusDateOfBirth,
         imageViewStatusSexOfBirth,
         imageViewStatusEthnicGroup,
         imageViewStatusContact,
         imageViewStatusRelationship,
         imageViewStatusPhone,
         imageViewStatusContactPhone,
         imageViewStatusEmail].forEach { (imageView) in
            imageView?.image     = icon.withRenderingMode(.alwaysTemplate)
            imageView?.tintColor = imageView == current ? Color.iconCopySelected() : Color.iconCopyDefault()
        }
    }

    private func setFieldsText(_ view: UIView = UIView()) {
        [textFieldDocument,
         textFieldDateOfBirth,
         textFieldSexOfBirth,
         textFieldEthnicGroup,
         textFieldRelationship,
         textFieldPhone,
         textFieldContactPhone,
         textFieldEmail].forEach { (textField) in
            let isCurrentView = textField == view
            let backgroundColor = isCurrentView ? Color.mainColorBackground() : Color.textFieldBackground()
            let borderColor = isCurrentView ? Color.iconCopySelected() : Color.textFieldBorder()

            textField?.backgroundColor      = backgroundColor
            textField?.layer.borderColor    = borderColor.cgColor
            textField?.layer.borderWidth    = isCurrentView ? 2 : 1
            textField?.font                 = Font.textFieldText()
            textField?.textColor            = Color.textFieldText()
            textField?.layer.cornerRadius   = 6
            textField?.layer.masksToBounds  = true
            textField?.isEnabled            = false
        }

        [viewTextName, viewTextContact].forEach { (viewText) in
            let isCurrentView = viewText == view
            let backgroundColor = isCurrentView ? Color.mainColorBackground() : Color.textFieldBackground()
            let borderColor = isCurrentView ? Color.iconCopySelected() : Color.textFieldBorder()

            viewText?.layer.borderColor  = borderColor.cgColor
            viewText?.backgroundColor    = backgroundColor
            viewText?.layer.borderWidth  = isCurrentView ? 2 : 1
            viewText?.layer.cornerRadius = 6
        }

        [labelTextName, labelTextContact].forEach { (label) in
            label?.backgroundColor  = Color.subBackground()
            label?.textColor        = Color.textFieldText()
            label?.font             = Font.textFieldText()
        }
    }

}

// MARK: - Change Language
extension PersonViewController {

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
