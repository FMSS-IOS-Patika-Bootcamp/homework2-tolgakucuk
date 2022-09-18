//
//  WebViewController.swift
//  Homework2
//
//  Created by Tolga on 18.09.2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var movieTrailerLink: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView(withTrailer: movieTrailerLink)
    }
    
    private func loadWebView(withTrailer trailer: String?) {
        guard let trailer = trailer else {return}
        if let url = URL.init(string: trailer) {
            let urlRequest = URLRequest.init(url: url)
            webView.load(urlRequest)
        }
    }

}
