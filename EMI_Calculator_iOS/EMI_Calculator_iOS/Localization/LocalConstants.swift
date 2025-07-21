//
//  StaticConstants.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 20/05/25.
//

import Foundation

class Localizable {
    static let shared = Localizable()
    
    private var bundle: Bundle?

    private init() {
        // Default language
        
        setLanguage(languageCode: getSavedLanguage() ?? Locale.current.languageCode ?? "en") { iSuccess in
            //Do some action here.
        }
    }

    func setLanguage(languageCode: String,
                     completioHandler:@escaping(_ isSucess: Bool) -> Void) {
//        if let path = Bundle.main.path(forResource: languageCode, ofType: "lproj"),
//           let langBundle = Bundle(path: path) {
//            bundle = langBundle
//            saveLanguage(languageCode)
//        } else {
//            bundle = Bundle.main // fallback
//        }
        
        self.saveLanguage(languageCode)
        Bundle.setLanguage(languageCode) { (isSuccess, newBundle) in
            // Send notification to update UI
            self.bundle = newBundle
            NotificationCenter.default.post(name: .LanguageChanged, object: nil)
            completioHandler(isSuccess)
        }
    }

    func localizedString(forKey key: String) -> String {
        return bundle?.localizedString(forKey: key, value: nil, table: nil) ?? key
    }

    private func saveLanguage(_ code: String) {
        do {
            return try UserPreference.setObject(code, forKey: .SelectedLanguageCode)
        } catch {
            print("3.1 : Error while trying to get default selected country code for language selection")
        }
        
    }

    private func getSavedLanguage() -> String? {
        do {
            return try UserPreference.getObject(forKey: .SelectedLanguageCode, castTo: String.self)
        } catch {
            print("1.2 : Error while trying to get default selected country")
            return "en"
        }
    }

    func getCurrentLanguage() -> String {
        return getSavedLanguage() ?? Locale.current.languageCode ?? "en"
    }
    
    func value(for localValue: LocalConstant) -> String {
        self.localizedString(forKey: localValue.rawValue)
//        return NSLocalizedString(localValue.rawValue, comment: "")
    }
}

enum LocalConstant: String {
    
    case APP_FULL_NAME                           = "APP_FULL_NAME"
    case APP_SHORT_NAME                          = "APP_SHORT_NAME"
    
    case ALERT_TITLE                             = "ALERT_TITLE"
    case MSG_INTERNET_CONNECTION                 = "MSG_INTERNET_CONNECTION"
    case MSG_ENABLE_LOCATION_SERVICE             = "MSG_ENABLE_LOCATION_SERVICE"
    case MSG_FORCE_UPDATE_APP                    = "MSG_FORCE_UPDATE_APP"
    case MSG_ENTER_EMAIL                         = "MSG_ENTER_EMAIL"
    case MSG_REGISTERED_EMAIL                    = "MSG_REGISTERED_EMAIL"
    case MSG_ENTER_VALID_EMAIL                   = "MSG_ENTER_VALID_EMAIL"
    case MSG_ENTER_VALID_PASSWORD                = "MSG_ENTER_VALID_PASSWORD"
    case MSG_ENTER_PASSWORD                      = "MSG_ENTER_PASSWORD"
    case MSG_ENTER_YOUR_NAME                     = "MSG_ENTER_YOUR_NAME"
    case MSG_ENTER_FIRST_NAME                    = "MSG_ENTER_FIRST_NAME"
    case MSG_ENTER_LAST_NAME                     = "MSG_ENTER_LAST_NAME"
    case MSG_ENTER_REGISTERED_PHONE_NUMBER       = "MSG_ENTER_REGISTERED_PHONE_NUMBER"
    case MSG_ENTER_PHONE_NUMBER                  = "MSG_ENTER_PHONE_NUMBER"
    case MSG_INVALID_PHONE_NUMBER                = "MSG_INVALID_PHONE_NUMBER"
    case MSG_ENTER_OLD_PASSWORD                  = "MSG_ENTER_OLD_PASSWORD"
    case MSG_ENTER_NEW_PASSWORD                  = "MSG_ENTER_NEW_PASSWORD"
    case MSG_ENTER_CONFIRM_PASSWORD              = "MSG_ENTER_CONFIRM_PASSWORD"
    case MSG_CHECK_NEW_AND_CONFIRM_PASSWORD      = "MSG_CHECK_NEW_AND_CONFIRM_PASSWORD"
    case MSG_ENTER_OTP                           = "MSG_ENTER_OTP"
    case MSG_ENTER_VALID_OTP                     = "MSG_ENTER_VALID_OTP"
    case MSG_NO_CAMERA_ACCESS_PERMISSION         = "MSG_NO_CAMERA_ACCESS_PERMISSION"
    case MSG_NO_PHOTO_LIBRARY_ACCESS_PERMISSION  = "MSG_NO_PHOTO_LIBRARY_ACCESS_PERMISSION"
    case MSG_ENTER_ANYTHING                      = "MSG_ENTER_ANYTHING"
    case MSG_SELECT_ANYTHING                     = "MSG_SELECT_ANYTHING"
    
    case OK                                      = "OK"
    case YES_                                    = "YES_"
    case NO_                                     = "NO_"
    case CANCEL                                  = "CANCEL"
    case DONE                                    = "DONE"
    case SETTINGS                                = "SETTINGS"
    case DELETE                                  = "DELETE"
    case ALLOW                                   = "ALLOW"
    case DONT_ALLOW                              = "DONT_ALLOW"
    case LOGOUT                                  = "LOGOUT"
    case CALL                                    = "CALL"
    case TOLL_FREE_NUMBER                        = "TOLL_FREE_NUMBER"
    case UPDATE                                  = "UPDATE"
    case EXIT                                    = "EXIT"
    case TAKE_PHOTO                              = "TAKE_PHOTO"
    case CAMERA_ROLL                             = "CAMERA_ROLL"
    case PHOTO_LIBRARY                           = "PHOTO_LIBRARY"
    case VIDEO_LIBRARY                           = "VIDEO_LIBRARY"
    case MSG_ENTER_CUSTOMER_ID                   = "MSG_ENTER_CUSTOMER_ID"
    case MSG_ENTER_VALID_CUSTOMER_ID             = "MSG_ENTER_VALID_CUSTOMER_ID"
    case MSG_ENTER_VALID_MOBILE_NUMBER           = "MSG_ENTER_VALID_MOBILE_NUMBER"
    case MSG_ENTER_VALID_MOBILE_NO               = "MSG_ENTER_VALID_MOBILE_NO"
    case MSG_ENTER_FEEDBACK_TYPE                 = "MSG_ENTER_FEEDBACK_TYPE"
       
    //View wise content
    //Language selection view
    case LANGUAGE_TITLE                          = "LANGUAGE_TITLE"
    case LANGUAGE_SUBTITLE                       = "LANGUAGE_SUBTITLE"
    
    //Language selection view
    case CURRENCY_TITLE                          = "CURRENCY_TITLE"
    case CURRENCY_SUBTITLE                       = "CURRENCY_SUBTITLE"
    
    case REMOVEADS_TITLE                         = "REMOVEADS_TITLE"
    case ABOUTUS_TITLE                           = "ABOUTUS_TITLE"
    case RATEUS_TITLE                            = "RATEUS_TITLE"
    case SHARE                                   = "SHARE"
    
    case HOME_TAB_TITLE                          = "HOME_TAB_TITLE"
    case TOOLS_TAB_TITLE                         = "TOOLS_TAB_TITLE"
    case HISTORY_TAB_TITLE                       = "HISTORY_TAB_TITLE"
    case SETTING_TAB_TITLE                       = "SETTING_TAB_TITLE"
    
    
    //Home view
    case HOME_VIEW_TITLE                         = "HOME_VIEW_TITLE"
    
    //EMI Calculator
    case SECTION_TITLE_OF_EMI_CALCULATOR = "SECTION_TITLE_OF_EMI_CALCULATOR"
    case OPTION_TITLE_OF_LOAN_EMI = "OPTION_TITLE_OF_LOAN_EMI"
    case OPTION_TITLE_OF_LOAN_COMPARE = "OPTION_TITLE_OF_LOAN_COMPARE"
    case OPTION_TITLE_OF_VEHICLE_LOAN = "OPTION_TITLE_OF_VEHICLE_LOAN"
    case OPTION_TITLE_OF_HOME_LOAN = "OPTION_TITLE_OF_HOME_LOAN"
    
    //Mutual Fund Calculator
    case SECTION_TITLE_OF_MUTUAL_FUND_CALCULATOR = "SECTION_TITLE_OF_MUTUAL_FUND_CALCULATOR"
    case OPTION_TITLE_OF_SIP_CALCULATOR = "OPTION_TITLE_OF_SIP_CALCULATOR"
    case OPTION_TITLE_OF_SWP_CALCULATOR = "OPTION_TITLE_OF_SWP_CALCULATOR"
    case OPTION_TITLE_OF_LUMPSUM_CALCULATOR = "OPTION_TITLE_OF_LUMPSUM_CALCULATOR"
    case OPTION_TITLE_OF_GOAL_CALCULATOR = "OPTION_TITLE_OF_GOAL_CALCULATOR"

    //Bank Calculator
    case SECTION_TITLE_OF_BANK_CALCULATOR = "SECTION_TITLE_OF_BANK_CALCULATOR"
    case OPTION_TITLE_OF_FIXED_DEPOSIT = "OPTION_TITLE_OF_FIXED_DEPOSIT"
    case OPTION_TITLE_OF_RD_CALCULATOR = "OPTION_TITLE_OF_RD_CALCULATOR"
    
    //Useful Tools
    case SECTION_TITLE_OF_USEFUL_TOOLS = "SECTION_TITLE_OF_USEFUL_TOOLS"
    case OPTION_TITLE_OF_GST_CALCULATOR = "OPTION_TITLE_OF_GST_CALCULATOR"
    case OPTION_TITLE_OF_AGE_CALCULATOR = "OPTION_TITLE_OF_AGE_CALCULATOR"
    case OPTION_TITLE_OF_CASH_COUNTER = "OPTION_TITLE_OF_CASH_COUNTER"
    case OPTION_TITLE_OF_COMPOUND_INTERECT = "OPTION_TITLE_OF_COMPOUND_INTERECT"
    case OPTION_TITLE_OF_AMOUNT_TO_WORD = "OPTION_TITLE_OF_AMOUNT_TO_WORD"
    
    //Post office Calculator
    case SECTION_TITLE_OF_POST_OFFICE_CALCULATOR = "SECTION_TITLE_OF_POST_OFFICE_CALCULATOR"
    case OPTION_TITLE_OF_PUBLIC_PROVIDENT_FUND = "OPTION_TITLE_OF_PUBLIC_PROVIDENT_FUND"
    case OPTION_TITLE_OF_SENIOR_CITIZEN_SAVING_SCHEME = "OPTION_TITLE_OF_SENIOR_CITIZEN_SAVING_SCHEME"
    case OPTION_TITLE_OF_SUKANYA_SAMRIDDHI = "OPTION_TITLE_OF_SUKANYA_SAMRIDDHI"
    case OPTION_TITLE_OF_KISHAN_VIKAS_PATRA = "OPTION_TITLE_OF_KISHAN_VIKAS_PATRA"
    case OPTION_TITLE_OF_NATIONAL_SAVING_CERTIFICATE = "OPTION_TITLE_OF_NATIONAL_SAVING_CERTIFICATE"
    
    //Insurance Calculator
    case SECTION_TITLE_OF_INSURANCE_CALCULATOR = "SECTION_TITLE_OF_INSURANCE_CALCULATOR"
    case OPTION_TITLE_OF_PM_JEEVAN_JYOTI_BIMA = "OPTION_TITLE_OF_PM_JEEVAN_JYOTI_BIMA"
    case OPTION_TITLE_OF_PM_SURAKSHA_BIMA = "OPTION_TITLE_OF_PM_SURAKSHA_BIMA"
    
    //Home view options
    case PERSONAL_LOAN_TITLE                = "PERSONAL_LOAN_TITLE"
    case MORTGAGE_LOAN_TITLE                = "MORTGAGE_LOAN_TITLE"
    case CAR_LOAN_TITLE                     = "CAR_LOAN_TITLE"
    case BUSINESS_LOAN_TITLE                = "BUSINESS_LOAN_TITLE"
    case AI_VISION_CASH_COUNTER_TITLE       = "AI_VISION_CASH_COUNTER_TITLE"
    case FIXED_DEPOSIT_TITLE                = "FIXED_DEPOSIT_TITLE"
    case RECURRING_DEPOSITE_TITLE           = "RECURRING_DEPOSITE_TITLE"
    case SIP_CALCULATOR_TITLE               = "SIP_CALCULATOR_TITLE"
    case SIMPLE_INTEREST_TITLE              = "SIMPLE_INTEREST_TITLE"
    case PUBLIC_PROVIDENT_FUND_TITLE        = "PUBLIC_PROVIDENT_FUND_TITLE"
    case POST_OFFICE_MIS_CALCULATOR_TITLE   = "POST_OFFICE_MIS_CALCULATOR_TITLE"
    
    //Tools tab
    case TOOLS_VIEW_TITLE = "TOOLS_VIEW_TITLE"
    case CURRENCY_EXCHAGE_TITLE = "CURRENCY_EXCHAGE_TITLE"
    case CURRENCY_EXCHAGE_DESCRIPTION = "CURRENCY_EXCHAGE_DESCRIPTION"
    
    case TIMEZONE_EXCHAGE_TITLE = "TIMEZONE_EXCHAGE_TITLE"
    case TIMEZONE_EXCHAGE_DESCRIPTION = "TIMEZONE_EXCHAGE_DESCRIPTION"
    
    case GST_CALCULATOR_TITLE = "GST_CALCULATOR_TITLE"
    case GST_CALCULATOR_DESCRIPTION = "GST_CALCULATOR_DESCRIPTION"
    
    case VAT_CALCULATOR_TITLE = "VAT_CALCULATOR_TITLE"
    case VAT_CALCULATOR_DESCRIPTION = "VAT_CALCULATOR_DESCRIPTION"
    
    case INFLATION_CALCULATOR_TITLE = "INFLATION_CALCULATOR_TITLE"
    case INFLATION_CALCULATOR_DESCRIPTION = "INFLATION_CALCULATOR_DESCRIPTION"
    
    case DISCOUNT_CALCULATOR_TITLE = "DISCOUNT_CALCULATOR_TITLE"
    case DISCOUNT_CALCULATOR_DESCRIPTION = "DISCOUNT_CALCULATOR_DESCRIPTION"
    
    case PERCENTAGE_CALCULATOR_TITLE = "PERCENTAGE_CALCULATOR_TITLE"
    case PERCENTAGE_CALCULATOR_DESCRIPTION = "PERCENTAGE_CALCULATOR_DESCRIPTION"
    
    case PERCENTAGE_CHANGE_CALCULATOR_TITLE = "PERCENTAGE_CHANGE_CALCULATOR_TITLE"
    case PERCENTAGE_CHANGE_CALCULATOR_DESCRIPTION = "PERCENTAGE_CHANGE_CALCULATOR_DESCRIPTION"
    
    case PERCENTAGE_DIFFERENCE_CALCULATOR_TITLE = "PERCENTAGE_DIFFERENCE_CALCULATOR_TITLE"
    case PERCENTAGE_DIFFERENCE_CALCULATOR_DESCRIPTION = "PERCENTAGE_DIFFERENCE_CALCULATOR_DESCRIPTION"
    
    
    //Introduction view
    case INTRO_PAGE_1_TITLE                       = "INTRO_PAGE_1_TITLE"
    case INTRO_PAGE_1_DESCRIPTION                 = "INTRO_PAGE_1_DESCRIPTION"
    
    case INTRO_PAGE_2_TITLE                       = "INTRO_PAGE_2_TITLE"
    case INTRO_PAGE_2_DESCRIPTION                 = "INTRO_PAGE_2_DESCRIPTION"
    
    case INTRO_PAGE_3_TITLE                       = "INTRO_PAGE_3_TITLE"
    case INTRO_PAGE_3_DESCRIPTION                 = "INTRO_PAGE_3_DESCRIPTION"
    
    case INTRO_PAGE_4_TITLE                       = "INTRO_PAGE_4_TITLE"
    case INTRO_PAGE_4_DESCRIPTION                 = "INTRO_PAGE_4_DESCRIPTION"
    
    case PLACEHOLDER_LOAN_AMOUNT                  = "PLACEHOLDER_LOAN_AMOUNT"
    case PLACEHOLDER_INTEREST_RATE                = "PLACEHOLDER_INTEREST_RATE"
    case PLACEHOLDER_TENURE_IN_YEAR               = "PLACEHOLDER_TENURE_IN_YEAR"
    case PLACEHOLDER_TENURE_IN_MONTH              = "PLACEHOLDER_TENURE_IN_MONTH"
    
    case MSG_IS_REQUIRE                           = "MSG_IS_REQUIRE"
    case MSG_MUST_VALID                           = "MSG_MUST_VALID"
    case MSG_NOT_VALID                            = "MSG_NOT_VALID"
    case MSG_CAN_NOT_BE_NEGATIVE                  = "MSG_CAN_NOT_BE_NEGATIVE"
    
    
}
