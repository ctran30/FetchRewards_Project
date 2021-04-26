//
//  TableController.swift
//  FetchRewards_Project
//
//  Created by Connie Tran on 4/25/21.
//

import Foundation
import UIKit

class TableController: UITableViewCell {
    
    static let identifier = "EventCell"
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var favoriteLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with view: TableDetails, row: Int) {
        let defaults = UserDefaults.standard
        let favorite = defaults.bool(forKey: "\(view.id)")
        
        if favorite == true {
            favoriteLabel.isHidden = false
        } else {
            favoriteLabel.isHidden = true
        }
        
        //eventImage.
        titleLabel.text = view.title
        venueLabel.text = view.location
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        
        let date = formatter.date(from: view.datetime)
        formatter.dateFormat = "EEE, MMM dd, yyyy - hh:mm a"
        formatter.timeZone = NSTimeZone.local
        let time = formatter.string(from: date!)
        dateTimeLabel.text = time
        
    }
}

struct TableDetails {
    var id: Int
    var type: String
    var title: String
    var location: String
    var datetime: String
    
    init (id: Int, type: String, title: String, location: String, datetime: String) {
        self.id = id
        self.type = type
        self.title = title
        self.location = location
        self.datetime = datetime
    }
}
