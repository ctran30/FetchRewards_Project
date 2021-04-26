//
//  Event.swift
//  FetchRewards_Project
//
//  Created by Connie Tran on 4/24/21.
//

import Foundation

class Event {
    var id: Int
    var type: String
    var title: String
    var short_title: String
    var location: String
    var datetime: String
    
    var venue: String
    var address: String
    var extended: String
    
    init (id: Int, type: String, title: String, short_title: String, location: String, datetime: String, venue: String, address: String, extended: String) {
        self.id = id
        self.type = type
        self.title = title
        self.short_title = short_title
        self.location = location
        self.datetime = datetime
        
        self.venue = venue
        self.address = address
        self.extended = extended
    }
}
