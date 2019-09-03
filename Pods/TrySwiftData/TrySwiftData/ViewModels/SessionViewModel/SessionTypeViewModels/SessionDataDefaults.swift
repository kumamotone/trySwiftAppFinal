//
//  SessionDefaults.swift
//  Pods
//
//  Created by Natasha Murashev on 3/23/17.
//
//

struct SessionDataDefaults: SessionDisplayable {
    
    let customImageAssetURL: URL?
    
    fileprivate let session: Session
    
    init(session: Session) {
        self.session = session
        
        if let assetName = session.imageAssetName {
            customImageAssetURL = Bundle.trySwiftAssetURL(for: assetName)
        } else {
            customImageAssetURL = nil
        }
    }
    
    var title: String {
        return localizedString(for: session.title ?? "TBD", japaneseString: session.titleJP)
    }
    
    var presenter: String {
        return Conference.current.name
    }
    

    var imageURL: URL {
        return Conference.current.logoURL
    }
 
    
    var location: String {
        if let location = session.location {
            return location.localizedName
        } else {
            return Venue.localizedName(for: .conference)
        }
    }
    
    var shortDescription: String {
        return "❤️".localized()
    }
    
    var longDescription: String {
        return Conference.current.localizedDescription
    }
    
    var twitter: String {
        return Conference.current.twitter
    }
    
    var selectable: Bool {
        return false
    }
}
