//
//  SeatGeekAPI.swift
//  FetchRewards_Project
//
//  Created by Connie Tran on 4/24/21.
//

import Foundation

class SeatGeekAPI {
    
    let clientID = "MjE3NjU3Nzl8MTYxOTA1MzM2MC4yMTkwMTUx"
    let clientSecret = "5fbbfb632d1d3de5b35ad3a6b63bbe01ea22b1ee5a598eb298da0fff42bccf14"
    let endpointURL = "https://api.seatgeek.com/2/"
    let downloader = JSONDownloader()
    
    //API call for events
    func getEvents (completion: @escaping (Events?, String?) -> Void) {
        let url = endpointURL + "events?client_id=" + clientID
        
        //fetch event data
        fetchData (with: url) { res, err in
            guard let res = res else {
                completion(nil, err)
                return
            }
            
            let events = Events(json: res)
            completion(events, nil)
        }
        
    }
    
    //API call for event search    
    func getSearch (_ query: String, completion: @escaping (Events?, String?) -> Void) {
        let url = endpointURL + "events?q=\(query)&client_id=" + clientID
        
        //fetch search data
        fetchData (with: url) { res, err in
            guard let res = res else {
                completion(nil, err)
                return
            }
            
            let events = Events(json: res)
            completion(events, nil)
        }
        
    }
    
    //API call for image
    func getImage (completion: @escaping (Performers?, String?) -> Void) {
        let url = endpointURL + "performers?client_id=" + clientID
        fetchData (with: url) { res, err in
            guard let res = res else {
                completion(nil, err)
                return
            }
            
            let performers = Performers(json: res)
            completion(performers, nil)
        }
    }
    
    
    typealias Results = [[String: Any]]
    
    private func fetchData (with endpointURL: String, completion: @escaping (Results?, String?) -> Void) {
        downloader.jsonTask (with: URLRequest(url: URL(string: endpointURL)!)) { json, err in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, "JSON Error")
                    return
                }
                
                guard let res = json["events"] as? [[String:Any]] else {
                    completion([], "Parse Error")
                    return
                }
                
                completion (res, nil)
            }
        }.resume()
    }
    
}
