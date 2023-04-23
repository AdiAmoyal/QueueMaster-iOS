//
//  CoreDataViewModel.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 30/03/2023.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
        } catch {
            print("Error saving Core Data. \(error)")
        }
    }
}

class CoreDataViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    
    @Published var clients: [Client] = []
    @Published var queues: [Queue] = []
    
    init() {
        fetchClients()
        fetchQueues()
    }
    
    func saveData() {
        manager.save()
        fetchClients()
        fetchQueues()
    }
        
    // MARK: Clients Functions
    
    func fetchClients() {
        let request = NSFetchRequest<Client>(entityName: "Client")
        
        let sort = NSSortDescriptor(keyPath: \Client.name, ascending: true)
        request.sortDescriptors = [sort]
        
        do {
            clients = try manager.context.fetch(request)
        } catch {
            print("Error fetching clients. \(error.localizedDescription)")
        }
        
    }
    
    func addClient(name: String, phone: String, notes: String) {
        let newClient = Client(context: manager.context)
        newClient.name = name
        newClient.phone = phone
        newClient.notes = notes
        saveData()
    }
    
    func updateClient(client: Client) {
        // MARK: Add logic for update client
        
        saveData()
    }
    
    func deleteClient(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = clients[index]
        manager.context.delete(entity)
        saveData()
    }
    
    // MARK: Queues Functions
    
    func fetchQueues() {
        let request = NSFetchRequest<Queue>(entityName: "Queue")
        
        do {
            queues = try manager.context.fetch(request)
        } catch {
            print("Error fetching clients. \(error.localizedDescription)")
        }
        
    }
    
    func addQueue(client: Client, date: Date, description: String, category: Category) {
        let newQueue = Queue(context: manager.context)
        newQueue.client = client
        newQueue.dateAdded = date
        newQueue.des = description
        
        saveData()
    }
    
    func updateQueue(queue: Queue) {
        // MARK: Add logic for update queue
        
        saveData()
    }
    
    func deleteQueue(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = queues[index]
        manager.context.delete(entity)
        saveData()
    }
    
}
