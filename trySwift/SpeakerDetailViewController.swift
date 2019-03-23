//
//  SpeakerDetailViewController.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/12/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import TrySwiftData

class SpeakerDetailViewController: UITableViewController {

    var speaker: Speaker?
    
    fileprivate enum SpeakerDetail: Int {
        case header, bio, twitter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []

        title = speaker?.name
        configureTableView()
    }
}

// MARK: - Table view data source
extension SpeakerDetailViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = speaker { return 3 }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let speaker = speaker else { fatalError() }
        switch SpeakerDetail(rawValue: indexPath.row)! {
        case .header:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SpeakerTableViewCell
            cell.configure(withSpeaker: speaker, selectionEnabled: false, accessoryEnabled: false, delegate: self, speakerImageDelegate: nil)
            return cell
        case .bio:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TextTableViewCell
            cell.configure(withText: speaker.localizedBio)
            return cell
        case .twitter:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TwitterFollowTableViewCell
            cell.configure(withUsername: speaker.twitter, delegate: self)
            return cell
        }
    }

}

extension SpeakerDetailViewController {
    
    func configureTableView() {
        tableView.register(SpeakerTableViewCell.self)
        tableView.register(TextTableViewCell.self)
        tableView.register(TwitterFollowTableViewCell.self)
        
        tableView.estimatedRowHeight = 83
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
    }
}
