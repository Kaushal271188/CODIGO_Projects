//
//  AdsManager.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 05/07/25.
//

import Foundation
import UIKit
import GoogleMobileAds

protocol AdsCustomDelegate {
    func didAdsDismiss()
    func didAdsShow()
}


class AdsManager: NSObject {
    
    var adsCustomDelegate: AdsCustomDelegate? = nil
    
    static let shared = AdsManager()
    
    private var interstitial: GADInterstitialAd?
    private var rewardedAd: GADRewardedAd?
    
    override init() {
        GADMobileAds.sharedInstance().start()
        // Register simulator as test device
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ GADSimulatorID ]
    }
    
    // MARK: - Interstitial Ad
//    func loadInterstitial(adUnitID: String,
//                          completionHandler: @escaping(_ isSuccess: Bool) -> Void) {
//
//    }
    
    func showInterstitial(from viewController: UIViewController,
                          adUnitID: String,
                          completionHandler: @escaping(_ isSuccess: Bool) -> Void) {
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: adUnitID, request: request) { [weak self] ad, error in
            if let error = error {
                print("Failed to load interstitial: \(error.localizedDescription)")
                completionHandler(false)
                return
            }
            self?.interstitial = ad
            self?.interstitial?.fullScreenContentDelegate = self
            self?.interstitial?.present(fromRootViewController: viewController)
            completionHandler(false)
        }
    }
    
    // MARK: - Rewarded Ad
    func loadRewardedAd(adUnitID: String) {
        let request = GADRequest()
        GADRewardedAd.load(withAdUnitID: adUnitID, request: request) { [weak self] ad, error in
            if let error = error {
                print("Failed to load rewarded ad: \(error.localizedDescription)")
                return
            }
            self?.rewardedAd = ad
        }
    }
    
    func showRewardedAd(from viewController: UIViewController, onReward: @escaping () -> Void) {
        if let ad = rewardedAd {
            ad.present(fromRootViewController: viewController) {
                let reward = ad.adReward
                print("User rewarded with \(reward.amount) \(reward.type)")
                onReward()
            }
        } else {
            print("Rewarded ad not ready")
        }
    }
    
    // MARK: - Banner View (Reusable)
    func createBannerView(adUnitID: String, rootViewController: UIViewController) -> GADBannerView {
        let bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = rootViewController
        bannerView.load(GADRequest())
        bannerView.delegate = self
        return bannerView
    }
    
}

//Banner ads Delegate methods
extension AdsManager: GADBannerViewDelegate {
    
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
        print(#function + ": " + error.localizedDescription)
    }
    
    func bannerViewDidRecordClick(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
        print(#function)
    }
    
    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
        print(#function)
        
        
    }
}

//Rewarded ads Delegate methods
extension AdsManager: GADMediationRewardedAdEventDelegate {
    func didRewardUser() {
        print(#function)
    }
    
    func didStartVideo() {
        print(#function)
    }
    
    func didEndVideo() {
        print(#function)
    }
    
    func didRewardUser(with reward: GADAdReward) {
        print(#function)
    }
    
    func reportImpression() {
        print(#function)
    }
    
    func reportClick() {
        print(#function)
    }
    
    func willPresentFullScreenView() {
        print(#function)
    }
    
    func didFailToPresentWithError(_ error: Error) {
        print(#function + ": " + error.localizedDescription)
    }
    
    func willDismissFullScreenView() {
        print(#function)
    }
    
    func didDismissFullScreenView() {
        print(#function)
    }
    
}

//Rewarded ads Delegate methods
extension AdsManager: GADMediationInterstitialAdEventDelegate {
    func willBackgroundApplication() {
        print(#function)
    }
}

extension AdsManager: GADFullScreenContentDelegate {
    
    /// Tells the delegate that an impression has been recorded for the ad.
    func adDidRecordImpression(_ ad: GADFullScreenPresentingAd) {
        print(#function)
    }
    
    /// Tells the delegate that a click has been recorded for the ad.
    func adDidRecordClick(_ ad: GADFullScreenPresentingAd) {
        print(#function)
    }
    
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print(#function + ": \(error.localizedDescription)")
        self.adsCustomDelegate?.didAdsDismiss()
    }
    
    /// Tells the delegate that the ad will present full screen content.
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print(#function)
        self.adsCustomDelegate?.didAdsShow()
    }
    
    /// Tells the delegate that the ad will dismiss full screen content.
    func adWillDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print(#function)
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print(#function)
        self.adsCustomDelegate?.didAdsDismiss()
    }
    
}
