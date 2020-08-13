//
//  StringIdentifier.swift
//  GenPerson
//
//  Created by Charles on 05/05/20.
//  Copyright © 2020 cwilliamszd. All rights reserved.
//

import Foundation

enum StringIdentifier: String, CustomIdentifier {

    case CommonDateFormat = "common_date_format"
    case CommonFormatToDate = "common_format_to_date"

    // MARK: - English
    case CommonRandomEng = "common_random_eng"
    case CommonGenerateEng = "common_generate_eng"
    case CommonNewEng = "common_new_eng"
    case CommonAllEng = "common_all_eng"

    case PhonePrefixEng = "phone_prefix_eng"

    case PersonTitleEng = "person_title_eng"
    case PersonNameEng = "person_name_eng"
    case PersonDocumentEng = "person_document_eng"
    case PersonDateOfBirthEng = "person_date_of_birth_eng"
    case PersonSexOfBirthEng = "person_sex_of_birth_eng"
    case PersonEthnicGroupEng = "person_group_ethnic_eng"
    case PersonContactEng = "person_contact_eng"
    case PersonRelationshipEng = "person_relationship_eng"
    case PersonPhoneEng = "person_phone_eng"
    case PersonEmailEng = "person_email_eng"
    case PersonAgeYearEng = "person_age_year_eng"
    case PersonAgeMonthEng = "person_age_month_eng"
    case PersonAgeDayEng = "person_age_day_eng"

    case HistoryTitleEng = "history_title_eng"

    case ButtonCreateEng = "button_create_eng"
    case ButtonSettingsEng = "button_settings_eng"

    case SettingsTitleEng = "settings_title_eng"

    case GenderTitleEng = "gender_title_eng"
    case GenderFemaleEng = "gender_female_eng"
    case GenderMasculineEng = "gender_masculine_eng"

    case EthnicGroupWhiteEng = "ethnic_group_white_eng"
    case EthnicGroupBlackEng = "ethnic_group_black_eng"
    case EthnicGroupBrownEng = "ethnic_group_brown_eng"
    case EthnicGroupRedEng = "ethnic_group_red_eng"
    case EthnicGroupYellowEng = "ethnic_group_yellow_eng"

    case RelationshipMotherEng = "relationship_mother_eng"
    case RelationshipSisterEng = "relationship_sister_eng"
    case RelationshipDaughterEng = "relationship_daughter_eng"

    case RelationshipFatherEng = "relationship_father_eng"
    case RelationshipBrotherEng = "relationship_brother_eng"
    case RelationshipSonEng = "relationship_son_eng"

    case RelationshipFriendEng = "relationship_friend_eng"
    case RelationshipSpouseEng = "relationship_spouse_eng"
    case RelationshipPartnerEng = "relationship_partner_eng"
    case RelationshipParentEng = "relationship_parent_eng"
    case RelationshipOtherEng = "relationship_other_eng"

    case NationalityTitleEng = "nationality_title_eng"
    case NationalityUSAEng = "nationality_usa_eng"
    case NationalityBREng = "nationality_br_eng"

    case AgeRangeTitleEng = "age_range_title_eng"
    case AgeRangeOlderEng = "age_range_older_eng"
    case AgeRangeMinorEng = "age_range_minor_eng"
    case AgeRangeBabyEng = "age_range_baby_eng"
    case AgeRangeChildEng = "age_range_child_eng"
    case AgeRangeTeenEng = "age_range_teen_eng"
    case AgeRangeYoungEng = "age_range_young_eng"
    case AgeRangeAdultEng = "age_range_adult_eng"
    case AgeRangeElderlyEng = "age_range_elderly_eng"

    case IdiomTitleEng = "idiom_title_eng"
    case IdiomPortugueseEng = "idiom_portuguese_eng"
    case IdiomEnglishEng = "idiom_english_eng"

    case FilterTitleEng = "filter_title_eng"

    case SearchTitleEng = "search_placeholder_eng"

    // MARK: - Portuguese
    case CommonRandomPt = "common_random_pt"
    case CommonGeneratePt = "common_generate_pt"
    case CommonNewPt = "common_new_pt"
    case CommonAllPt = "common_all_pt"

    case PhonePrefixPt = "phone_prefix_pt"

    case PersonTitlePt = "person_title_pt"
    case PersonNamePt = "person_name_pt"
    case PersonDocumentPt = "person_document_pt"
    case PersonDateOfBirthPt = "person_date_of_birth_pt"
    case PersonSexOfBirthPt = "person_sex_of_birth_pt"
    case PersonEthnicGroupPt = "person_group_ethnic_pt"
    case PersonContactPt = "person_contact_pt"
    case PersonRelationshipPt = "person_relationship_pt"
    case PersonPhonePt = "person_phone_pt"
    case PersonEmailPt = "person_email_pt"
    case PersonAgeYearPt = "person_age_year_pt"
    case PersonAgeMonthPt = "person_age_month_pt"
    case PersonAgeDayPt = "person_age_day_pt"

    case HistoryTitlePt = "history_title_pt"

    case ButtonCreatePt = "button_create_pt"
    case ButtonSettingsPt = "button_settings_pt"

    case SettingsTitlePt = "settings_title_pt"

    case GenderTitlePt = "gender_title_pt"
    case GenderFemalePt = "gender_female_pt"
    case GenderMasculinePt = "gender_masculine_pt"

    case EthnicGroupWhitePt = "ethnic_group_white_pt"
    case EthnicGroupBlackPt = "ethnic_group_black_pt"
    case EthnicGroupBrownPt = "ethnic_group_brown_pt"
    case EthnicGroupRedPt = "ethnic_group_red_pt"
    case EthnicGroupYellowPt = "ethnic_group_yellow_pt"

    case RelationshipMotherPt = "relationship_mother_pt"
    case RelationshipSisterPt = "relationship_sister_pt"
    case RelationshipDaughterPt = "relationship_daughter_pt"

    case RelationshipFatherPt = "relationship_father_pt"
    case RelationshipBrotherPt = "relationship_brother_pt"
    case RelationshipSonPt = "relationship_son_pt"

    case RelationshipFriendPt = "relationship_friend_pt"
    case RelationshipSpousePt = "relationship_spouse_pt"
    case RelationshipPartnerPt = "relationship_partner_pt"
    case RelationshipParentPt = "relationship_parent_pt"
    case RelationshipOtherPt = "relationship_other_pt"

    case NationalityTitlePt = "nationality_title_pt"
    case NationalityUSAPt = "nationality_usa_pt"
    case NationalityBRPt = "nationality_br_pt"

    case AgeRangeTitlePt = "age_range_title_pt"
    case AgeRangeOlderPt = "age_range_older_pt"
    case AgeRangeMinorPt = "age_range_minor_pt"
    case AgeRangeBabyPt = "age_range_baby_pt"
    case AgeRangeChildPt = "age_range_child_pt"
    case AgeRangeTeenPt = "age_range_teen_pt"
    case AgeRangeYoungPt = "age_range_young_pt"
    case AgeRangeAdultPt = "age_range_adult_pt"
    case AgeRangeElderlyPt = "age_range_elderly_pt"

    case IdiomTitlePt = "idiom_title_pt"
    case IdiomPortuguesePt = "idiom_portuguese_pt"
    case IdiomEnglishPt = "idiom_english_pt"

    case FilterTitlePt = "filter_title_pt"

    case SearchTitlePt = "search_placeholder_pt"
}
