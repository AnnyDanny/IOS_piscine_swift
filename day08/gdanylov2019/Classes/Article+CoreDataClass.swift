//
//  Article+CoreDataClass.swift
//  
//
//  Created by Ganna DANYLOVA on 4/12/19.
//
//

import Foundation
import CoreData

@objc(Article)
public class Article: NSManagedObject {
    var title : String?
    var content : String?
    var language : String?
    var image : NSData?
    var creationDate : NSDate?
    var modificationDate : NSDate?
    override func description(){
        return ("title--->", \(title), "content--->", \(content), "language--->", \(language), "image--->", \(image),
        "creationDate--->", \(creationDate), "modificationDate--->", \(modificationDate))
    }
}
