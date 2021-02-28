//
//  StringIdentifier.swift
//  GenPerson
//
//  Created by Charles on 05/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation

enum StringIdentifier: String, CustomIdentifier {

    case commonDateFormat = "common_date_format"
    case commonFormatToDate = "common_format_to_date"

    // MARK: - English
    case commonRandomEng = "common_random_eng"
    case commonGenerateEng = "common_generate_eng"
    case commonNewEng = "common_new_eng"
    case commonAllEng = "common_all_eng"

    case phonePrefixEng = "phone_prefix_eng"

    case personTitleEng = "person_title_eng"
    case personNameEng = "person_name_eng"
    case personDocumentEng = "person_document_eng"
    case personDateOfBirthEng = "person_date_of_birth_eng"
    case personSexOfBirthEng = "person_sex_of_birth_eng"
    case personEthnicGroupEng = "person_group_ethnic_eng"
    case personContactEng = "person_contact_eng"
    case personRelationshipEng = "person_relationship_eng"
    case personPhoneEng = "person_phone_eng"
    case personEmailEng = "person_email_eng"
    case personAgeYearEng = "person_age_year_eng"
    case personAgeMonthEng = "person_age_month_eng"
    case personAgeDayEng = "person_age_day_eng"

    case historyTitleEng = "history_title_eng"

    case buttonCreateEng = "button_create_eng"
    case buttonSettingsEng = "button_settings_eng"

    case settingsTitleEng = "settings_title_eng"

    case genderTitleEng = "gender_title_eng"
    case genderFemaleEng = "gender_female_eng"
    case genderMasculineEng = "gender_masculine_eng"

    case ethnicGroupWhiteEng = "ethnic_group_white_eng"
    case ethnicGroupBlackEng = "ethnic_group_black_eng"
    case ethnicGroupBrownEng = "ethnic_group_brown_eng"
    case ethnicGroupRedEng = "ethnic_group_red_eng"
    case ethnicGroupYellowEng = "ethnic_group_yellow_eng"

    case relationshipMotherEng = "relationship_mother_eng"
    case relationshipSisterEng = "relationship_sister_eng"
    case relationshipDaughterEng = "relationship_daughter_eng"

    case relationshipFatherEng = "relationship_father_eng"
    case relationshipBrotherEng = "relationship_brother_eng"
    case relationshipSonEng = "relationship_son_eng"

    case relationshipFriendEng = "relationship_friend_eng"
    case relationshipSpouseEng = "relationship_spouse_eng"
    case relationshipPartnerEng = "relationship_partner_eng"
    case relationshipParentEng = "relationship_parent_eng"
    case relationshipOtherEng = "relationship_other_eng"

    case nationalityTitleEng = "nationality_title_eng"
    case nationalityUSAEng = "nationality_usa_eng"
    case nationalityBREng = "nationality_br_eng"

    case ageRangeTitleEng = "age_range_title_eng"
    case ageRangeOlderEng = "age_range_older_eng"
    case ageRangeMinorEng = "age_range_minor_eng"
    case ageRangeBabyEng = "age_range_baby_eng"
    case ageRangeChildEng = "age_range_child_eng"
    case ageRangeTeenEng = "age_range_teen_eng"
    case ageRangeYoungEng = "age_range_young_eng"
    case ageRangeAdultEng = "age_range_adult_eng"
    case ageRangeElderlyEng = "age_range_elderly_eng"

    case idiomTitleEng = "idiom_title_eng"
    case idiomPortugueseEng = "idiom_portuguese_eng"
    case idiomEnglishEng = "idiom_english_eng"

    case filterTitleEng = "filter_title_eng"

    case searchTitleEng = "search_placeholder_eng"

    // MARK: - Portuguese
    case commonRandomPt = "common_random_pt"
    case commonGeneratePt = "common_generate_pt"
    case commonNewPt = "common_new_pt"
    case commonAllPt = "common_all_pt"

    case phonePrefixPt = "phone_prefix_pt"

    case personTitlePt = "person_title_pt"
    case personNamePt = "person_name_pt"
    case personDocumentPt = "person_document_pt"
    case personDateOfBirthPt = "person_date_of_birth_pt"
    case personSexOfBirthPt = "person_sex_of_birth_pt"
    case personEthnicGroupPt = "person_group_ethnic_pt"
    case personContactPt = "person_contact_pt"
    case personRelationshipPt = "person_relationship_pt"
    case personPhonePt = "person_phone_pt"
    case personEmailPt = "person_email_pt"
    case personAgeYearPt = "person_age_year_pt"
    case personAgeMonthPt = "person_age_month_pt"
    case personAgeDayPt = "person_age_day_pt"

    case historyTitlePt = "history_title_pt"

    case buttonCreatePt = "button_create_pt"
    case buttonSettingsPt = "button_settings_pt"

    case settingsTitlePt = "settings_title_pt"

    case genderTitlePt = "gender_title_pt"
    case genderFemalePt = "gender_female_pt"
    case genderMasculinePt = "gender_masculine_pt"

    case ethnicGroupWhitePt = "ethnic_group_white_pt"
    case ethnicGroupBlackPt = "ethnic_group_black_pt"
    case ethnicGroupBrownPt = "ethnic_group_brown_pt"
    case ethnicGroupRedPt = "ethnic_group_red_pt"
    case ethnicGroupYellowPt = "ethnic_group_yellow_pt"

    case relationshipMotherPt = "relationship_mother_pt"
    case relationshipSisterPt = "relationship_sister_pt"
    case relationshipDaughterPt = "relationship_daughter_pt"

    case relationshipFatherPt = "relationship_father_pt"
    case relationshipBrotherPt = "relationship_brother_pt"
    case relationshipSonPt = "relationship_son_pt"

    case relationshipFriendPt = "relationship_friend_pt"
    case relationshipSpousePt = "relationship_spouse_pt"
    case relationshipPartnerPt = "relationship_partner_pt"
    case relationshipParentPt = "relationship_parent_pt"
    case relationshipOtherPt = "relationship_other_pt"

    case nationalityTitlePt = "nationality_title_pt"
    case nationalityUSAPt = "nationality_usa_pt"
    case nationalityBRPt = "nationality_br_pt"

    case ageRangeTitlePt = "age_range_title_pt"
    case ageRangeOlderPt = "age_range_older_pt"
    case ageRangeMinorPt = "age_range_minor_pt"
    case ageRangeBabyPt = "age_range_baby_pt"
    case ageRangeChildPt = "age_range_child_pt"
    case ageRangeTeenPt = "age_range_teen_pt"
    case ageRangeYoungPt = "age_range_young_pt"
    case ageRangeAdultPt = "age_range_adult_pt"
    case ageRangeElderlyPt = "age_range_elderly_pt"

    case idiomTitlePt = "idiom_title_pt"
    case idiomPortuguesePt = "idiom_portuguese_pt"
    case idiomEnglishPt = "idiom_english_pt"

    case filterTitlePt = "filter_title_pt"

    case searchTitlePt = "search_placeholder_pt"
}
