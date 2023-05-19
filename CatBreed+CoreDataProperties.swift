//
//  CatBreed+CoreDataProperties.swift
//  JonathanSivananthan_CatAPI_ProjectB-MobAppDev
//
//  Created by Jonathan Sivananthan on 21/11/22.
//
//

import Foundation
import CoreData


extension CatBreed {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CatBreed> {
        return NSFetchRequest<CatBreed>(entityName: "CatBreed")
    }

    @NSManaged public var desc: String?
    @NSManaged public var image: Data?
    @NSManaged public var name: String?
    @NSManaged public var origin: String?

}

extension CatBreed : Identifiable {

}
