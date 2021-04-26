//
//  DetailsController.swift
//  FetchRewards_Project
//
//  Created by Connie Tran on 4/24/21.
//

import Foundation
import UIKit

class DetailsController: UIViewController {
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var favoritesButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var extendedLabel: UILabel!
    
    var event: Event?
    
    override func viewDidLoad() {
        let defaults = UserDefaults.standard
        let favorite = defaults.bool(forKey: "\(event!.id)")
        
        if favorite == true {
            favoritesButton.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
        } else {
            favoritesButton.setImage(UIImage.init(systemName: "heart"), for: .normal)
        }
        
        eventImage.image = UIImage(systemName: "ticket")
        titleLabel.text = event?.title
        venueLabel.text = event?.venue
        addressLabel.text = event?.address
        extendedLabel.text = event?.extended
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        
        let date = formatter.date(from: event!.datetime)
        formatter.dateFormat = "EEE, MMM dd, yyyy - hh:mm a"
        formatter.timeZone = NSTimeZone.local
        let time = formatter.string(from: date!)
        dateTimeLabel.text = time
        
    }
    
    @IBAction func favorited(_ sender: Any) {
        let defaults = UserDefaults.standard
        let favorite = defaults.bool(forKey: "\(event!.id)")
        
        if favorite == true {
            favoritesButton.setImage(UIImage.init(systemName: "heart"), for: .normal)
            defaults.removeObject(forKey: "\(event!.id)")
        } else {
            favoritesButton.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
            defaults.set(true, forKey: "\(event!.id)")
        }
    }
    
    
}
