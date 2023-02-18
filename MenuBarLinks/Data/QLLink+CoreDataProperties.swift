//
//  QLLink+CoreDataProperties.swift
//  MenuBarLinks
//
//  Created by Dhanuka Perera on 18/02/2023.
//
//

import Foundation
import CoreData


extension QLLink {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QLLink> {
        return NSFetchRequest<QLLink>(entityName: "QLLink")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    
    var wrappedID: UUID {id!}
    var wrappedTitle : String {title!}
    var wrappedURL : URL {URL(string:url!)!}

}

extension QLLink : Identifiable {

}
