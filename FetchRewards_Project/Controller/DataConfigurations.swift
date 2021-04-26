//
//  DataConfigurations.swift
//  FetchRewards_Project
//
//  Created by Connie Tran on 4/25/21.
//
import Foundation
import UIKit

class DataSource: NSObject, UITableViewDataSource {
    private var events: [Event]
    let tableView: UITableView
    
    init (events: [Event], tableView: UITableView) {
        self.events = events
        self.tableView = tableView
        super.init()
    }
    
    func update (with events: [Event]) {
        self.events = events
    }
    
    func sections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView (_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableController.identifier, for: indexPath) as! TableController
        let event = events[indexPath.row]
        let view = TableDetails(id: event.id, type: event.type, title: event.title, location: event.location, datetime: event.datetime)
        cell.configure(with: view, row: indexPath.row)
        return cell
    }
    
    func getEvent (at indexPath: IndexPath) -> Event {
        return events[indexPath.row]
    }
}
