//
//  Performers.swift
//  FetchRewards_Project
//
//  Created by Connie Tran on 4/26/21.
//

import Foundation

class Performers {
    var performers: [Performer]
    
    init (allPerformers: [Performer]) {
        self.performers = allPerformers
    }
}

extension Performers {
    convenience init? (json: [[String:Any]]) {
        
        struct queries {
            static let image = "image"
        }
        
        var performers: [Performer] = []
        
        for each in json {
            
            //performer image
            guard let image = each[queries.image] as? String else { return nil }
            
            performers.append(Performer(image: image))
        }
        
        self.init(allPerformers: performers)

    }
    
}
