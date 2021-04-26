//
//  ViewController.swift
//  FetchRewards_Project
//
//  Created by Connie Tran on 4/24/21.
//
import Foundation
import UIKit

class MainController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    var api = SeatGeekAPI()

    private struct Constants {
        static let height: CGFloat = 175
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        searchBar.delegate = self
    }
    
    lazy var dataSource: DataSource = {
        var fetchedEvents: [Event] = []
        api.getEvents() { res, error in
            guard let res = res else { return }
            self.reload(events: res.events)
        }
        return DataSource(events: fetchedEvents, tableView: self.tableView)
    }()
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.height
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailController = segue.destination as! DetailsController
        detailController.event = dataSource.getEvent(at: tableView.indexPathForSelectedRow!)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        api.getSearch(searchText) { res, error in
            guard let res = res else { return }
            self.reload(events: res.events)
        }
    }
    
    func reload(events: [Event]) {
        dataSource.update(with: events)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}
