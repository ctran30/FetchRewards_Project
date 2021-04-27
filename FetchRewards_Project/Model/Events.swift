//
//  Events.swift
//  FetchRewards_Project
//
//  Created by Connie Tran on 4/25/21.
//
import Foundation

class Events {
    var events: [Event]
    
    init (allEvents: [Event]) {
        self.events = allEvents
    }
}

extension Events {
    convenience init? (json: [[String:Any]]) {
        
        struct queries {
            static let id = "id"
            static let title = "title"
            static let short_title = "short_title"
            static let datetime = "datetime_local"
            static let type = "type"
            static let venue = "venue"
            static let displaylocation = "display_location"
            static let venueName = "name"
            static let address = "address"
            static let extended = "extended_address"
            //static let performers = "performers"
        }
        
        var events: [Event] = []
        
        for each in json {
            
            //event details
            guard let id = each[queries.id] as? Int else { return nil }
            guard let title = each[queries.title] as? String else { return nil }
            guard let short_title = each[queries.short_title] as? String else { return nil }
            guard let datetime = each[queries.datetime] as? String else { return nil }
            guard let type = each[queries.type] as? String else { return nil }
            guard let venue = each[queries.venue] as? [String:Any] else { return nil }
            
            //venue details
            guard let location = venue[queries.displaylocation] as? String else { return nil }
            guard let name = venue[queries.venueName] as? String else { return nil }
            guard let address = venue[queries.address] as? String else { return nil }
            guard let extended = venue[queries.extended] as? String else { return nil }
            
            //guard let performers = each[queries.performers] as? [Performer] else { return nil }
            
            events.append(Event(id: id, type: type, title: title, short_title: short_title, location: location, datetime: datetime, venue: name, address: address, extended: extended))
        }
        
        self.init(allEvents: events)

    }
    
}
