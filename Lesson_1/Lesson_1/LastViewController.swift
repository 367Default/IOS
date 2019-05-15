//
//  LastViewController.swift
//  Lesson_1
//
//  Created by Ruslan Tagiev on 12/05/2019.
//  Copyright © 2019 Ruslan Tagiev. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

class LastViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        //logoutVK()
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "6978158"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        
        let session = Session.instance
        session.vkToken = token!
        print(session.vkToken)
        
        Alamofire.request("https://api.vk.com/method/friends.get?v=5.52&access_token=\(token!)").responseJSON { (response) in
            print(response.value)
        }
        Alamofire.request("https://api.vk.com/method/photos.getAll?v=5.52&access_token=\(token!)").responseJSON { (response) in
            print(response.value)
        }
        Alamofire.request("https://api.vk.com/method/groups.get?v=5.52&access_token=\(token!)").responseJSON { (response) in
            print(response.value)
        }
        
        decisionHandler(.cancel)
    }
    
    func logoutVK() {
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            dataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(),
                                 for: records.filter { $0.displayName.contains("vk") },
                                 completionHandler: { })
        }
    }
    
}
