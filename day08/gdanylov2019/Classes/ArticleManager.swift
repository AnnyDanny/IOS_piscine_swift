//
//  ArticleManager.swift
//  gdanylov2019_Example
//
//  Created by Ganna DANYLOVA on 4/12/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import CoreData
import gdanylov2019

public class ArticleManager {
    
    let articleFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
    
    public let object : NSManagedObjectContext
    
    public init() {
        let myBundle = Bundle(identifier: "org.cocoapods.gdanylov2019")
        guard let modelURL = myBundle?.url(forResource: "article", withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        
        object = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
        object.persistentStoreCoordinator = psc
        
        guard let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
                fatalError("Unable to resolve document directory")
            }
        let storeURL = docURL.appendingPathComponent("article.sqlite")
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
    }
    
    public func newArticle() -> Article {
        return NSEntityDescription.insertNewObject(forEntityName: "Article", into: self.object) as! Article
//        let createNewArticle = NSEntityDescription.insertNewObject(forEntityName: "Article", into:
//        self.object) as! Article
//        return createNewArticle
    }
    
    public func getAllArticles() -> [Article] {
        let articleFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        
        do {
            let fetchObject = try object.fetch(articleFetch) as! [Article]
//            articleFetch.returnsObjectsAsFaults = false
            return fetchObject
        }
        catch {
            fatalError("Failed to fetch articleFetch getAllArticles: \(error)")
        }
    }
    
    public func getArticles(withLang lang: String) -> [Article] {
        let articleFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        articleFetch.predicate = NSPredicate(format: "language == %@", lang)
        do {
            let fetchObject = try object.fetch(articleFetch) as! [Article]
            articleFetch.returnsObjectsAsFaults = false
            return fetchObject
        }
        catch {
            fatalError("Failed to fetch articleFetch getArticles with lang: \(error)")
        }
    }
    
    public func getArticles(containString str: String) -> [Article] {
        var returnsObjectsAsFaults: Bool {
            let articleFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
            articleFetch.predicate = NSPredicate(format: "title CONTAINS %@ || content CONTAINS %@", str, str)
            return false
        }
        do {
              let fetchObject = try object.fetch(articleFetch) as! [Article]
                articleFetch.returnsObjectsAsFaults = false
              return fetchObject
        }
        catch {
              return []
        }
    }
    
    public func removeArticle(article : Article) {
        object.delete(article)
    }
    
    public func save() {
        do {
            try object.save()
        }
        catch {
            fatalError("Not saved \(error)")
        }
    }
}
