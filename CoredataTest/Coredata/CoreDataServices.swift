//
//  CoreDataServices.swift
//  CoredataTest
//
//  Created by Mohamed on 10/05/2022.
//

import Foundation
import UIKit
import CoreData

/*
extension CodingUserInfoKey{
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}
*/
class CoreDataServices {
    
    let appDelegate: AppDelegate!
    let managedObjectContext: NSManagedObjectContext!
    let entity: NSEntityDescription!
    
    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "Movie", in: managedObjectContext)
    }
    
    func saveMovie(movie: MovieData) {
        
        let saveMovie = NSManagedObject(entity: entity, insertInto: managedObjectContext)
        
        saveMovie.setValue(movie.rating, forKey: "rating")
        saveMovie.setValue(movie.title, forKey: "title")
        saveMovie.setValue(movie.releaseYear, forKey: "releaseYear")
        
        do {
            print("SAVE DATA")
            try managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func fetchMovie() -> [Movie] {
        
        let fetchRequest = NSFetchRequest<Movie>(entityName: "Movie")
        var result: [Movie] = []
        
        do {
            result =  try managedObjectContext.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
        return result
    }
    
    func deleteMovie(movie: Movie) {
        
        managedObjectContext.delete(movie)
        print("Delete object")
        do {
            try managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
            print("Not Delete any object")
        }
    }
}
