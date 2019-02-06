//
//  ViewController.swift
//  VenueExplorer
//
//  Created by Duc Tran on 8/27/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // baseURL - endpoint - parameters (client secret + clientId + search keys)
        let baseURL = "https://api.foursquare.com/v2/"
        let path = "venues/search?ll=40.7,-74&client_id=EV3LGPWPNGBQ2MRFABCW0AEIAWYNMKHQ0EPS3RDTINSRMAD2&client_secret=XANXUPKQXL2KRSPP5I241IYXXUJUU0QVOMGJMQJ2M14OVT0X&v=20160827"
        let urlString = "\(baseURL)\(path)"
        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)
        
        let networkProcessing = NetworkProcessing(request: urlRequest)
        
        networkProcessing.downloadJSON { (json, httpResponse, error) in
            if let dictionary = json {
                if let metaDict = dictionary["meta"] as? [String : Any] {
                    let requestID = metaDict["requestId"] as! String
                    print(requestID)
                }
            }
        }

    }
    
}















