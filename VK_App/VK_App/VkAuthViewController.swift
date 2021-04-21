//
//  VkAuthViewController.swift
//  VK_App
//
//  Created by Akbar on 17/04/21.
//

import UIKit
import WebKit

class VkAuthViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAuth()
    }
    
    private func configureAuth() {
        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
                urlComponents.host = "oauth.vk.com"
                urlComponents.path = "/authorize"
                urlComponents.queryItems = [
                    URLQueryItem(name: "client_id", value: "7828458"),
                    URLQueryItem(name: "display", value: "mobile"),
                    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                    URLQueryItem(name: "scope", value: "262150"),
                    URLQueryItem(name: "response_type", value: "token"),
                    URLQueryItem(name: "v", value: "5.68")
                ]
                
                let request = URLRequest(url: urlComponents.url!)
                
                webView.load(request)
    }

}

extension VkAuthViewController: WKNavigationDelegate {

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

        print("access_token \(token)")
        
        let urlone = URL(string: "https://api.vk.com/method/photos.get?album_id=profile&extended=1&v=5.130&access_token=5b00c8464b5ced9f046ef86ae1cffb55f89ac4de8dc2da33efe015df10d8944bd8a007c8cd9a67ff155d4")
                
        // сессия по умолчанию
                let session = URLSession.shared
                
        // задача для запуска
                let task = session.dataTask(with: urlone!) { (data, response, error) in
        // в замыкании данные, полученные от сервера, мы преобразуем в json
                    let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
        // выводим в консоль
                    print(json)
                }
        // запускаем задачу
                task.resume()

        let urlTwo = URL(string: "https://api.vk.com/method/groups.get?extended=1&v=5.130&access_token=5b00c8464b5ced9f046ef86ae1cffb55f89ac4de8dc2da33efe015df10d8944bd8a007c8cd9a67ff155d4")
                
                
        // задача для запуска
                let taskTwo = session.dataTask(with: urlTwo!) { (data, response, error) in
        // в замыкании данные, полученные от сервера, мы преобразуем в json
                    let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
        // выводим в консоль
                    print(json)
                }
        // запускаем задачу
                taskTwo.resume()

        
        let urlThree = URL(string: "https://api.vk.com/method/friends.get?fields=nickname&v=5.130&access_token=5b00c8464b5ced9f046ef86ae1cffb55f89ac4de8dc2da33efe015df10d8944bd8a007c8cd9a67ff155d4")
                
                
        // задача для запуска
                let taskThree = session.dataTask(with: urlThree!) { (data, response, error) in
        // в замыкании данные, полученные от сервера, мы преобразуем в json
                    let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
        // выводим в консоль
                    print(json)
                }
        // запускаем задачу
                taskThree.resume()
        decisionHandler(.cancel)
    }
}
