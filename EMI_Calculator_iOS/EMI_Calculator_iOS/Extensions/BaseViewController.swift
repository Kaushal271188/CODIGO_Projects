//
//  BaseViewController.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 05/07/25.
//

import UIKit
import GoogleMobileAds

class BaseViewController: UIViewController {

    private var bannerView: GADBannerView!
    private var contentViewController: UIViewController!
    
    init(contentViewController: UIViewController) {
        self.contentViewController = contentViewController
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupViewFormate()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BaseViewController {
    
    private func setupViewFormate() {
        
        addChild(contentViewController)
        view.addSubview(contentViewController.view)
        contentViewController.didMove(toParent: self)
        contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = StaticContents.AdsInformation.AdUnitID_Banner // Replace with your Ad Unit ID
        bannerView.rootViewController = self
//        bannerView.load(with: Request)
        view.addSubview(bannerView)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Content view above banner
            contentViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            contentViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentViewController.view.bottomAnchor.constraint(equalTo: bannerView.topAnchor),
            
            // Banner at the bottom
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 50) // banner height
        ])
        
    }
    
}
