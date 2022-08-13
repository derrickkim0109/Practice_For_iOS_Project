//
//  Joke+CoreDataProperties.swift
//  0801-CoreData-Activity
//
//  Created by minsson on 2022/08/01.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }

    @NSManaged public var body: String?
    @NSManaged public var category: String?
    @NSManaged public var id: UUID?

}

extension Joke : Identifiable {

}
