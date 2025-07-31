//
//  WebVC.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 30/07/25.
//

import UIKit
import WebKit

class WebVC: UIViewController {

    @IBOutlet weak var lblOfNavTitle: UILabel!
    @IBOutlet weak var lblOfNavSubTitle: UILabel!
    
    @IBOutlet weak var btnOfBack: UIButton!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    var viewModel: WebInfoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setViewFormate()
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

extension WebVC {
    
    func setViewFormate() {
        
        if let tempURL = URL(string: self.viewModel.model.content),
            UIApplication.shared.canOpenURL(tempURL) {
            
            let urlRequest = URLRequest(url: tempURL,
                                        cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                        timeoutInterval: TimeInterval(60))
            self.webView?.load(urlRequest)
            
        }else {
            self.webView?.loadHTMLString(self.viewModel.model.content, baseURL: nil)
        }
        
        self.activityView?.startAnimating()
        
    }
    
    @IBAction func btnOfBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension WebVC: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityView?.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.activityView?.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.activityView?.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.activityView?.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        self.activityView?.stopAnimating()
    }
}
