//
//  JSONDownloader.swift
//  FetchRewards_Project
//
//  Created by Connie Tran on 4/25/21.
//

import Foundation

class JSONDownloader {
    let session: URLSession
    
    init (configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init () {
        self.init(configuration: .default)
    }
    
    typealias JSON = [String: AnyObject]
    typealias JSONTaskCompletionHander = (JSON?, String?) -> Void
    
    func jsonTask (with request: URLRequest, completion: @escaping JSONTaskCompletionHander) -> URLSessionDataTask {
        let task = session.dataTask (with: request) { data, res, err in
            guard let httpResponse = res as? HTTPURLResponse else {
                completion(nil, "Fetch failed")
                return
            }
            if (httpResponse.statusCode == 200) {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
                        completion(json, nil)
                    } catch {
                        completion(nil, "JSON Conversion failed")
                    }
                }
            } else {
                completion(nil, "Invalid Data")
            }
            
            
        }
        return task
    }
    
}
