//
//  StaticContents.swift
//  PracticalDemo_RecipeApp
//
//  Created by Kaushal Prajapati on 25/04/25.
//

import Foundation
import UIKit

let APPDELEGATE = UIApplication.shared.delegate as! AppDelegate

class StaticContents {
    
    static let shared = StaticContents()
    
    //Static messages
    struct Message {
        
        static let CheckInternetConnection = Localizable.shared.value(for: .MSG_INTERNET_CONNECTION)
        
        static let CheckLocationService = Localizable.shared.value(for: .MSG_ENABLE_LOCATION_SERVICE)
        static let AskToForceUpdate = Localizable.shared.value(for: .MSG_FORCE_UPDATE_APP)
        
        static let EnterEmailAddress = Localizable.shared.value(for: .MSG_ENTER_EMAIL)
        static let EnterRegisteredEmailAddress = Localizable.shared.value(for: .MSG_REGISTERED_EMAIL)
        static let EnterValidEmailAddress = Localizable.shared.value(for: .MSG_ENTER_VALID_EMAIL)
        
        static let EnterValidPassword = Localizable.shared.value(for: .MSG_ENTER_VALID_PASSWORD)
        static let EnterPassword = Localizable.shared.value(for: .MSG_ENTER_PASSWORD)
        static let EnterYourName = Localizable.shared.value(for: .MSG_ENTER_YOUR_NAME)
        static let EnterYourFirstName = Localizable.shared.value(for: .MSG_ENTER_FIRST_NAME)
        static let EnterYourLastName = Localizable.shared.value(for: .MSG_ENTER_LAST_NAME)
        
        static let EnterRegisteredPhoneNumber = Localizable.shared.value(for: .MSG_ENTER_REGISTERED_PHONE_NUMBER)
        static let EnterPhoneNumber = Localizable.shared.value(for: .MSG_ENTER_PHONE_NUMBER)
        static let EnterValidPhoneNumber = Localizable.shared.value(for: .MSG_INVALID_PHONE_NUMBER)
        
        static let EnterOldPassword = Localizable.shared.value(for: .MSG_ENTER_OLD_PASSWORD)
        static let EnterNewPassword = Localizable.shared.value(for: .MSG_ENTER_NEW_PASSWORD)
        static let EnterConfirmPassword = Localizable.shared.value(for: .MSG_ENTER_CONFIRM_PASSWORD)
        static let CheckOldAndConfirmPassword = Localizable.shared.value(for: .MSG_CHECK_NEW_AND_CONFIRM_PASSWORD)
        
        static let EnterOTP = Localizable.shared.value(for: .MSG_ENTER_OTP)
        static let EnterValidOTP = Localizable.shared.value(for: .MSG_ENTER_VALID_OTP)
        
        static let CameraPermission = Localizable.shared.value(for: .MSG_NO_CAMERA_ACCESS_PERMISSION)
        static let PhotoLibraryPermission = Localizable.shared.value(for: .MSG_NO_PHOTO_LIBRARY_ACCESS_PERMISSION)
        
        static let EnterForAnything = Localizable.shared.value(for: .MSG_ENTER_ANYTHING)
        static let Select0ForAnything = Localizable.shared.value(for: .MSG_SELECT_ANYTHING)
        
    }
    
    //Static constants
    struct Constants {
        //Title of constant name UIs/Views.
        static let OK = Localizable.shared.value(for: .OK)
        static let Cancel = Localizable.shared.value(for: .CANCEL)
        static let Done = Localizable.shared.value(for: .DONE)
        static let Yes = Localizable.shared.value(for: .YES_)
        static let No = Localizable.shared.value(for: .NO_)
        
        static let AppFullName = Localizable.shared.value(for: .APP_FULL_NAME)
        static let AppShortName = Localizable.shared.value(for: .APP_SHORT_NAME)
        static let AlertTitle = Localizable.shared.value(for: .ALERT_TITLE)
        
        //Language view
        static let LanguageTitle = Localizable.shared.value(for: .LANGUAGE_TITLE)
        static let LanguageSubtitle = Localizable.shared.value(for: .LANGUAGE_SUBTITLE)
        
        //Currency view
        static let CurrencyTitle = Localizable.shared.value(for: .CURRENCY_TITLE)
        static let CurrencySubtitle = Localizable.shared.value(for: .CURRENCY_SUBTITLE)
        
        //Left menu options
        static let RemoveAds = Localizable.shared.value(for: .REMOVEADS_TITLE)
        static let AboutUs = Localizable.shared.value(for: .ABOUTUS_TITLE)
        static let RateUs = Localizable.shared.value(for: .RATEUS_TITLE)
        static let Share = Localizable.shared.value(for: .SHARE)
        
        static let HomeTabTitle = Localizable.shared.value(for: .HOME_TAB_TITLE)
        static let ToolsTabTitle = Localizable.shared.value(for: .TOOLS_TAB_TITLE)
        static let HistoryTabTitle = Localizable.shared.value(for: .HISTORY_TAB_TITLE)
        static let SettingsTitle = Localizable.shared.value(for: .SETTING_TAB_TITLE)
        
        //Home view
        static let HomeTitle = Localizable.shared.value(for: .HOME_VIEW_TITLE)
        
        //Section and it's options title
        //EMI Calculator
        static let SectionTitleOfEMICalculator = Localizable.shared.value(for: .SECTION_TITLE_OF_EMI_CALCULATOR)
        static let OptionTitleOfLoanEMI = Localizable.shared.value(for: .SECTION_TITLE_OF_EMI_CALCULATOR)
        static let OptionTitleOfLoanCompare = Localizable.shared.value(for: .SECTION_TITLE_OF_MUTUAL_FUND_CALCULATOR)
        static let OptionTitleOfVehicleLoan = Localizable.shared.value(for: .SECTION_TITLE_OF_BANK_CALCULATOR)
        static let OptionTitleOfHomeLoan = Localizable.shared.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        
        //Mutual Fund Calculator
        static let SectionTitleOfMutualFundCalculator = Localizable.shared.value(for: .SECTION_TITLE_OF_MUTUAL_FUND_CALCULATOR)
        static let OptionTitleOfSIPCalculator = Localizable.shared.value(for: .SECTION_TITLE_OF_EMI_CALCULATOR)
        static let OptionTitleOfSWPCalculator = Localizable.shared.value(for: .SECTION_TITLE_OF_MUTUAL_FUND_CALCULATOR)
        static let OptionTitleOfLumSumCalculator = Localizable.shared.value(for: .SECTION_TITLE_OF_BANK_CALCULATOR)
        static let OptionTitleOfGoalCalculator = Localizable.shared.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        
        //Bank Calculator
        static let SectionTitleOfBankCalculator = Localizable.shared.value(for: .SECTION_TITLE_OF_BANK_CALCULATOR)
        static let OptionTitleOfFixedDeposit = Localizable.shared.value(for: .SECTION_TITLE_OF_EMI_CALCULATOR)
        static let OptionTitleOfRDCalculator = Localizable.shared.value(for: .SECTION_TITLE_OF_MUTUAL_FUND_CALCULATOR)
        
        //Useful Tools
        static let SectionTitleOfUsefulTools = Localizable.shared.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        static let OptionTitleOfGSTCalculator = Localizable.shared.value(for: .SECTION_TITLE_OF_EMI_CALCULATOR)
        static let OptionTitleOfAgeCalculator = Localizable.shared.value(for: .SECTION_TITLE_OF_MUTUAL_FUND_CALCULATOR)
        static let OptionTitleOfCashCounter = Localizable.shared.value(for: .SECTION_TITLE_OF_BANK_CALCULATOR)
        static let OptionTitleOfCompoundInterect = Localizable.shared.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        static let OptionTitleOfAmountToWord = Localizable.shared.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        
        //Post office Calculator
        static let SectionTitleOfPostOfficeCalculator = Localizable.shared.value(for: .SECTION_TITLE_OF_POST_OFFICE_CALCULATOR)
        static let OptionTitleOfPublicProvidentFund = Localizable.shared.value(for: .SECTION_TITLE_OF_EMI_CALCULATOR)
        static let OptionTitleOfSeniorCitizenSavingScheme = Localizable.shared.value(for: .SECTION_TITLE_OF_MUTUAL_FUND_CALCULATOR)
        static let OptionTitleOfSukanyaSamriddhi = Localizable.shared.value(for: .SECTION_TITLE_OF_BANK_CALCULATOR)
        static let OptionTitleOfKishanVikasPatra = Localizable.shared.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        static let OptionTitleOfNationalSavingCertificate = Localizable.shared.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        
        //Insurance Calculator
        static let SectionTitleOfInsuranceCalculator = Localizable.shared.value(for: .SECTION_TITLE_OF_INSURANCE_CALCULATOR)
        static let OptionTitleOfPMJeevanJyotiBima = Localizable.shared.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        static let OptionTitleOfPMSurakshaBima = Localizable.shared.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        
        
        //Introduction view
        static let IntroPage1Title = Localizable.shared.value(for: .INTRO_PAGE_1_TITLE)
        static let IntroPage1Description = Localizable.shared.value(for: .INTRO_PAGE_1_DESCRIPTION)
        
        static let IntroPage2Title = Localizable.shared.value(for: .INTRO_PAGE_2_TITLE)
        static let IntroPage2Description = Localizable.shared.value(for: .INTRO_PAGE_2_DESCRIPTION)
        
        static let IntroPage3Title = Localizable.shared.value(for: .INTRO_PAGE_3_TITLE)
        static let IntroPage3Description = Localizable.shared.value(for: .INTRO_PAGE_3_DESCRIPTION)
        
        static let IntroPage4Title = Localizable.shared.value(for: .INTRO_PAGE_4_TITLE)
        static let IntroPage4Description = Localizable.shared.value(for: .INTRO_PAGE_4_DESCRIPTION)
        
        //Place holder
        static let PlaceHolderOfLoanAmount = Localizable.shared.value(for: .PLACEHOLDER_LOAN_AMOUNT)
        static let PlaceHolderOfInterestRate = Localizable.shared.value(for: .PLACEHOLDER_INTEREST_RATE)
        static let PlaceHolderOfTenureInYears = Localizable.shared.value(for: .PLACEHOLDER_TENURE_IN_YEAR)
        static let PlaceHolderOfTenureInMonths = Localizable.shared.value(for: .PLACEHOLDER_TENURE_IN_MONTH)
        
        //General validation message
        static let GeneralMessageForRequire = Localizable.shared.value(for: .MSG_IS_REQUIRE)
        static let GeneralMessageForMustRequire = Localizable.shared.value(for: .MSG_MUST_VALID)
        static let GeneralMessageForNotValid = Localizable.shared.value(for: .MSG_NOT_VALID)
        static let GeneralMessageForNotBeNegative = Localizable.shared.value(for: .MSG_CAN_NOT_BE_NEGATIVE)
        
        
        //Tools tabs
        static let ToolsViewTitle = Localizable.shared.value(for: .TOOLS_VIEW_TITLE)
        static let CurrencyExchangeTitle = Localizable.shared.value(for: .CURRENCY_EXCHAGE_TITLE)
        static let CurrencyExchangeDescripion = Localizable.shared.value(for: .CURRENCY_EXCHAGE_DESCRIPTION)
        
        static let TimezoneExchangeTitle = Localizable.shared.value(for: .TIMEZONE_EXCHAGE_TITLE)
        static let TimezoneExchangeDesciption = Localizable.shared.value(for: .TIMEZONE_EXCHAGE_DESCRIPTION)
        
        static let GSTCalculatorTitle = Localizable.shared.value(for: .GST_CALCULATOR_TITLE)
        static let GSTCalculatorDescripion = Localizable.shared.value(for: .GST_CALCULATOR_DESCRIPTION)
        
        static let VATCalculatorTitle = Localizable.shared.value(for: .VAT_CALCULATOR_TITLE)
        static let VATCalculatorDescripion = Localizable.shared.value(for: .VAT_CALCULATOR_DESCRIPTION)
        
        static let InflationCalculatorTitle = Localizable.shared.value(for: .INFLATION_CALCULATOR_TITLE)
        static let InflationCalculatorDescripion = Localizable.shared.value(for: .INFLATION_CALCULATOR_DESCRIPTION)
        
        static let DiscountCalculatorTitle = Localizable.shared.value(for: .DISCOUNT_CALCULATOR_TITLE)
        static let DiscountCalculatorDescripion = Localizable.shared.value(for: .DISCOUNT_CALCULATOR_DESCRIPTION)
        
        static let PercentageCalculatorTitle = Localizable.shared.value(for: .PERCENTAGE_CALCULATOR_TITLE)
        static let PercentageCalculatorDescripion = Localizable.shared.value(for: .PERCENTAGE_CALCULATOR_DESCRIPTION)
        
        static let PercentageChangeCalculatorTitle = Localizable.shared.value(for: .PERCENTAGE_CHANGE_CALCULATOR_TITLE)
        static let PercentageChangeCalculatorDescripion = Localizable.shared.value(for: .PERCENTAGE_CHANGE_CALCULATOR_DESCRIPTION)
        
        static let PercentageDefferenceCalculatorTitle = Localizable.shared.value(for: .PERCENTAGE_DIFFERENCE_CALCULATOR_TITLE)
        static let PercentageDefferenceCalculatorDescripion = Localizable.shared.value(for: .PERCENTAGE_DIFFERENCE_CALCULATOR_DESCRIPTION)
        
        
        
        
        
        
        
        
        
        
        
    }
    
    //Cell Ids
    struct CellIdentifier {
        static let GridViewCell = "RecipeInfoCell_Grid"
        static let RowViewCell = "RecipeInfoCell_Row"
    }
    
    //Storyboard
    enum StoryBoard: String {
        case Main = "Main"
        case Authentication = "Authentication"
    }

    struct FileName {
        static let Countries = "Countries"
        static let LanguageList = "LanguageList"
        static let CountriesWithLanguage = "CountriesWithLanguage"
    }
    
    struct FileExtension {
        static let JSON = "json"
        static let Txt = "txt"
        static let Text = "text"
    }
    
    
//    enum AdsInformation: String {
//        case AppID = "ca-app-pub-3456634445221608~4307607135"
////        case AdUnitID = "ca-app-pub-3456634445221608/9368362124"
//
//        case AdUnitID_Banner = "\(appId)/2435281174"//Testing banner ID
//        case AdUnitID_Interstitial = "ca-app-pub-3940256099942544/4411468910"//Testing Interstitial ID
//        case AdUnitID_Native = "ca-app-pub-3940256099942544/3986624511"//Testing Native ID
//        case AdUnitID_Rewarded = "ca-app-pub-3940256099942544/1712485313"//Testing Rewarded ID
//        case AdUnitID_RewardedInterstitial = "ca-app-pub-3940256099942544/6978759866"//Testing Rewarded Interstitial ID
//
//    }
    
    struct AdsInformation {
        static let AppID = "ca-app-pub-3940256099942544"
        let AppID = "ca-app-pub-3456634445221608~4307607135"
        //        let AdUnitID = "ca-app-pub-3456634445221608/9368362124"
        
        static let AdUnitID_Banner                 = "\(AdsInformation.AppID)/2435281174"//Testing banner ID
        static let AdUnitID_Interstitial           = "\(AdsInformation.AppID)/4411468910"//Testing Interstitial ID
        static let AdUnitID_Native                 = "\(AdsInformation.AppID)/3986624511"//Testing Native ID
        static let AdUnitID_Rewarded               = "\(AdsInformation.AppID)/1712485313"//Testing Rewarded ID
        static let AdUnitID_RewardedInterstitial   = "\(AdsInformation.AppID)/6978759866"//Testing Rewarded Interstitial ID
    }
    
}
