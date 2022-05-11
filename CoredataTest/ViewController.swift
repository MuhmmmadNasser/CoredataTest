//
//  ViewController.swift
//  CoredataTest
//
//  Created by Mohamed on 10/05/2022.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    var appDelegate:AppDelegate!
    var managedObjestContext: NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjestContext = appDelegate.persistentContainer.viewContext //1
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managedObjestContext)//2
        let movie = NSManagedObject(entity: entity!, insertInto: managedObjestContext)
        /*
        movie.setValue("Iron Man", forKey: "title")
        movie.setValue(8, forKey: "rating")
        movie.setValue(2006, forKey: "releaseYear")
        
        do {
            try managedObjestContext.save()
            print("Added Successfully")
        }catch{
            print(error.localizedDescription)
        }
 */
    }

    @IBAction func fetchDataBtn(_ sender: Any) {
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
//        let predicate = NSPredicate(format: "title == %@", "Iron Man")
//        fetchRequest.predicate = predicate
        do {
            let movies = try managedObjestContext.fetch(fetchRequest)
            /*
            managedObjestContext.delete(movies[0])
            try managedObjestContext.save()
 */
            print("Delete Successful")
            
            for mov in movies {
                print(mov.value(forKey: "title"))
            }
            
        } catch {
            print(error.localizedDescription)
        }
      
    }
    
}

