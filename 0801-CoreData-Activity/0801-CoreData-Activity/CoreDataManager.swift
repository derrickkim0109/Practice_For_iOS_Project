//
//  CoreDataManager.swift
//  0801-CoreData-Activity
//
//  Created by minsson on 2022/08/01.
//

import Foundation

import CoreData

class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {}
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
        // stage area의 역할
    }
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "XCDataModel")
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
        return container
    }()
    
    func saveModel(_ model: Model) {
        // 어떻게 저장하는지 구현
        let joke = Joke(context: viewContext)
        
        joke.setValue(model.id, forKey: "id")
        joke.setValue(model.category.rawValue, forKey: "category")
        joke.setValue(model.content, forKey: "body")
        
        do {
            try viewContext.save() // stage area에서 commit하는 과정과 같음
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func fetch() -> [Model] {
        let context = persistentContainer.viewContext
        do {
            let jokes = try context.fetch(Joke.fetchRequest())
            let model = jokes.map { data in
                return Model.init(content: data.body!, category: Model.Category(rawValue: data.category!) ?? .유행어, id: data.id!)
            }
            return model
        } catch {
            
        }
        return [Model]()
    }
    
    func fetch<T: NSManagedObject>(request: NSFetchRequest<T>) -> [T] {
        do {
            let fetchResult = try self.viewContext.fetch(request)
            return fetchResult
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    @discardableResult
    func delete(object: NSManagedObject) -> Bool {
        self.viewContext.delete(object)
        do {
            try viewContext.save()
            return true
        } catch {
            return false
        }
    }
    
    @discardableResult
    func deleteAll<T: NSManagedObject>(request: NSFetchRequest<T>) -> Bool {
        let request: NSFetchRequest<NSFetchRequestResult> = T.fetchRequest()
        let delete = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try viewContext.execute(delete)
            return true
        } catch {
            return false
        }
    }
}
