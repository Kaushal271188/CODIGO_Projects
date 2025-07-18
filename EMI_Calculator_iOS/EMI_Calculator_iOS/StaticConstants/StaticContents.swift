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
        
        static let CheckInternetConnection = Localizable.value(for: .MSG_INTERNET_CONNECTION)
        
        static let CheckLocationService = Localizable.value(for: .MSG_ENABLE_LOCATION_SERVICE)
        static let AskToForceUpdate = Localizable.value(for: .MSG_FORCE_UPDATE_APP)
        
        static let EnterEmailAddress = Localizable.value(for: .MSG_ENTER_EMAIL)
        static let EnterRegisteredEmailAddress = Localizable.value(for: .MSG_REGISTERED_EMAIL)
        static let EnterValidEmailAddress = Localizable.value(for: .MSG_ENTER_VALID_EMAIL)
        
        static let EnterValidPassword = Localizable.value(for: .MSG_ENTER_VALID_PASSWORD)
        static let EnterPassword = Localizable.value(for: .MSG_ENTER_PASSWORD)
        static let EnterYourName = Localizable.value(for: .MSG_ENTER_YOUR_NAME)
        static let EnterYourFirstName = Localizable.value(for: .MSG_ENTER_FIRST_NAME)
        static let EnterYourLastName = Localizable.value(for: .MSG_ENTER_LAST_NAME)
        
        static let EnterRegisteredPhoneNumber = Localizable.value(for: .MSG_ENTER_REGISTERED_PHONE_NUMBER)
        static let EnterPhoneNumber = Localizable.value(for: .MSG_ENTER_PHONE_NUMBER)
        static let EnterValidPhoneNumber = Localizable.value(for: .MSG_INVALID_PHONE_NUMBER)
        
        static let EnterOldPassword = Localizable.value(for: .MSG_ENTER_OLD_PASSWORD)
        static let EnterNewPassword = Localizable.value(for: .MSG_ENTER_NEW_PASSWORD)
        static let EnterConfirmPassword = Localizable.value(for: .MSG_ENTER_CONFIRM_PASSWORD)
        static let CheckOldAndConfirmPassword = Localizable.value(for: .MSG_CHECK_NEW_AND_CONFIRM_PASSWORD)
        
        static let EnterOTP = Localizable.value(for: .MSG_ENTER_OTP)
        static let EnterValidOTP = Localizable.value(for: .MSG_ENTER_VALID_OTP)
        
        static let CameraPermission = Localizable.value(for: .MSG_NO_CAMERA_ACCESS_PERMISSION)
        static let PhotoLibraryPermission = Localizable.value(for: .MSG_NO_PHOTO_LIBRARY_ACCESS_PERMISSION)
        
        static let EnterForAnything = Localizable.value(for: .MSG_ENTER_ANYTHING)
        static let Select0ForAnything = Localizable.value(for: .MSG_SELECT_ANYTHING)
        
    }
    
    //Static constants
    struct Constants {
        //Title of constant name UIs/Views.
        static let OK = Localizable.value(for: .OK)
        static let Cancel = Localizable.value(for: .CANCEL)
        static let Done = Localizable.value(for: .DONE)
        static let Yes = Localizable.value(for: .YES_)
        static let No = Localizable.value(for: .NO_)
        
        static let AppFullName = Localizable.value(for: .APP_FULL_NAME)
        static let AppShortName = Localizable.value(for: .APP_SHORT_NAME)
        static let AlertTitle = Localizable.value(for: .ALERT_TITLE)
        
        //Language view
        static let LanguageTitle = Localizable.value(for: .LANGUAGE_TITLE)
        static let LanguageSubtitle = Localizable.value(for: .LANGUAGE_SUBTITLE)
        
        //Currency view
        static let CurrencyTitle = Localizable.value(for: .CURRENCY_TITLE)
        static let CurrencySubtitle = Localizable.value(for: .CURRENCY_SUBTITLE)
        
        //Left menu options
        static let RemoveAds = Localizable.value(for: .REMOVEADS_TITLE)
        static let AboutUs = Localizable.value(for: .ABOUTUS_TITLE)
        static let RateUs = Localizable.value(for: .RATEUS_TITLE)
        static let Share = Localizable.value(for: .SHARE)
        
        static let HomeTabTitle = Localizable.value(for: .HOME_TAB_TITLE)
        static let ToolsTabTitle = Localizable.value(for: .TOOLS_TAB_TITLE)
        static let HistoryTabTitle = Localizable.value(for: .HISTORY_TAB_TITLE)
        static let SettingsTitle = Localizable.value(for: .SETTING_TAB_TITLE)
        
        //Home view
        static let HomeTitle = Localizable.value(for: .HOME_VIEW_TITLE)
        
        //Section and it's options title
        //EMI Calculator
        static let SectionTitleOfEMICalculator = Localizable.value(for: .SECTION_TITLE_OF_EMI_CALCULATOR)
        static let OptionTitleOfLoanEMI = Localizable.value(for: .SECTION_TITLE_OF_EMI_CALCULATOR)
        static let OptionTitleOfLoanCompare = Localizable.value(for: .SECTION_TITLE_OF_MUTUAL_FUND_CALCULATOR)
        static let OptionTitleOfVehicleLoan = Localizable.value(for: .SECTION_TITLE_OF_BANK_CALCULATOR)
        static let OptionTitleOfHomeLoan = Localizable.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        
        //Mutual Fund Calculator
        static let SectionTitleOfMutualFundCalculator = Localizable.value(for: .SECTION_TITLE_OF_MUTUAL_FUND_CALCULATOR)
        static let OptionTitleOfSIPCalculator = Localizable.value(for: .SECTION_TITLE_OF_EMI_CALCULATOR)
        static let OptionTitleOfSWPCalculator = Localizable.value(for: .SECTION_TITLE_OF_MUTUAL_FUND_CALCULATOR)
        static let OptionTitleOfLumSumCalculator = Localizable.value(for: .SECTION_TITLE_OF_BANK_CALCULATOR)
        static let OptionTitleOfGoalCalculator = Localizable.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        
        //Bank Calculator
        static let SectionTitleOfBankCalculator = Localizable.value(for: .SECTION_TITLE_OF_BANK_CALCULATOR)
        static let OptionTitleOfFixedDeposit = Localizable.value(for: .SECTION_TITLE_OF_EMI_CALCULATOR)
        static let OptionTitleOfRDCalculator = Localizable.value(for: .SECTION_TITLE_OF_MUTUAL_FUND_CALCULATOR)
        
        //Useful Tools
        static let SectionTitleOfUsefulTools = Localizable.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        static let OptionTitleOfGSTCalculator = Localizable.value(for: .SECTION_TITLE_OF_EMI_CALCULATOR)
        static let OptionTitleOfAgeCalculator = Localizable.value(for: .SECTION_TITLE_OF_MUTUAL_FUND_CALCULATOR)
        static let OptionTitleOfCashCounter = Localizable.value(for: .SECTION_TITLE_OF_BANK_CALCULATOR)
        static let OptionTitleOfCompoundInterect = Localizable.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        static let OptionTitleOfAmountToWord = Localizable.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        
        //Post office Calculator
        static let SectionTitleOfPostOfficeCalculator = Localizable.value(for: .SECTION_TITLE_OF_POST_OFFICE_CALCULATOR)
        static let OptionTitleOfPublicProvidentFund = Localizable.value(for: .SECTION_TITLE_OF_EMI_CALCULATOR)
        static let OptionTitleOfSeniorCitizenSavingScheme = Localizable.value(for: .SECTION_TITLE_OF_MUTUAL_FUND_CALCULATOR)
        static let OptionTitleOfSukanyaSamriddhi = Localizable.value(for: .SECTION_TITLE_OF_BANK_CALCULATOR)
        static let OptionTitleOfKishanVikasPatra = Localizable.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        static let OptionTitleOfNationalSavingCertificate = Localizable.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        
        //Insurance Calculator
        static let SectionTitleOfInsuranceCalculator = Localizable.value(for: .SECTION_TITLE_OF_INSURANCE_CALCULATOR)
        static let OptionTitleOfPMJeevanJyotiBima = Localizable.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        static let OptionTitleOfPMSurakshaBima = Localizable.value(for: .SECTION_TITLE_OF_USEFUL_TOOLS)
        
        
        //Introduction view
        static let IntroPage1Title = Localizable.value(for: .INTRO_PAGE_1_TITLE)
        static let IntroPage1Description = Localizable.value(for: .INTRO_PAGE_1_DESCRIPTION)
        
        static let IntroPage2Title = Localizable.value(for: .INTRO_PAGE_2_TITLE)
        static let IntroPage2Description = Localizable.value(for: .INTRO_PAGE_2_DESCRIPTION)
        
        static let IntroPage3Title = Localizable.value(for: .INTRO_PAGE_3_TITLE)
        static let IntroPage3Description = Localizable.value(for: .INTRO_PAGE_3_DESCRIPTION)
        
        static let IntroPage4Title = Localizable.value(for: .INTRO_PAGE_4_TITLE)
        static let IntroPage4Description = Localizable.value(for: .INTRO_PAGE_4_DESCRIPTION)
        
        //Place holder
        static let PlaceHolderOfLoanAmount = Localizable.value(for: .PLACEHOLDER_LOAN_AMOUNT)
        static let PlaceHolderOfInterestRate = Localizable.value(for: .PLACEHOLDER_INTEREST_RATE)
        static let PlaceHolderOfTenureInYears = Localizable.value(for: .PLACEHOLDER_TENURE_IN_YEAR)
        static let PlaceHolderOfTenureInMonths = Localizable.value(for: .PLACEHOLDER_TENURE_IN_MONTH)
        
        //General validation message
        static let GeneralMessageForRequire = Localizable.value(for: .MSG_IS_REQUIRE)
        static let GeneralMessageForMustRequire = Localizable.value(for: .MSG_MUST_VALID)
        static let GeneralMessageForNotValid = Localizable.value(for: .MSG_NOT_VALID)
        static let GeneralMessageForNotBeNegative = Localizable.value(for: .MSG_CAN_NOT_BE_NEGATIVE)
        
        
        //Tools tabs
        static let ToolsViewTitle = Localizable.value(for: .TOOLS_VIEW_TITLE)
        static let CurrencyExchangeTitle = Localizable.value(for: .CURRENCY_EXCHAGE_TITLE)
        static let CurrencyExchangeDescripion = Localizable.value(for: .CURRENCY_EXCHAGE_DESCRIPTION)
        
        static let TimezoneExchangeTitle = Localizable.value(for: .TIMEZONE_EXCHAGE_TITLE)
        static let TimezoneExchangeDesciption = Localizable.value(for: .TIMEZONE_EXCHAGE_DESCRIPTION)
        
        static let GSTCalculatorTitle = Localizable.value(for: .GST_CALCULATOR_TITLE)
        static let GSTCalculatorDescripion = Localizable.value(for: .GST_CALCULATOR_DESCRIPTION)
        
        static let VATCalculatorTitle = Localizable.value(for: .VAT_CALCULATOR_TITLE)
        static let VATCalculatorDescripion = Localizable.value(for: .VAT_CALCULATOR_DESCRIPTION)
        
        static let InflationCalculatorTitle = Localizable.value(for: .INFLATION_CALCULATOR_TITLE)
        static let InflationCalculatorDescripion = Localizable.value(for: .INFLATION_CALCULATOR_DESCRIPTION)
        
        static let DiscountCalculatorTitle = Localizable.value(for: .DISCOUNT_CALCULATOR_TITLE)
        static let DiscountCalculatorDescripion = Localizable.value(for: .DISCOUNT_CALCULATOR_DESCRIPTION)
        
        static let PercentageCalculatorTitle = Localizable.value(for: .PERCENTAGE_CALCULATOR_TITLE)
        static let PercentageCalculatorDescripion = Localizable.value(for: .PERCENTAGE_CALCULATOR_DESCRIPTION)
        
        static let PercentageChangeCalculatorTitle = Localizable.value(for: .PERCENTAGE_CHANGE_CALCULATOR_TITLE)
        static let PercentageChangeCalculatorDescripion = Localizable.value(for: .PERCENTAGE_CHANGE_CALCULATOR_DESCRIPTION)
        
        static let PercentageDefferenceCalculatorTitle = Localizable.value(for: .PERCENTAGE_DIFFERENCE_CALCULATOR_TITLE)
        static let PercentageDefferenceCalculatorDescripion = Localizable.value(for: .PERCENTAGE_DIFFERENCE_CALCULATOR_DESCRIPTION)
        
        
        
        
        
        
        
        
        
        
        
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
