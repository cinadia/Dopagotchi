//
//  UserViewModel.swift
//  Dopagotchi
//
//  Created by Cindy Cui on 2025-08-18.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
class UserViewModel: ObservableObject {
    let context: ModelContext
    private var pets: [Pet] = []
    private var users: [User] = []
    private var activePet: Pet?
    @Published var activePetViewModel: PetViewModel?
    
    init(context: ModelContext) {
        self.context = context
        
        // Fetch existing data
        fetchData()
        
        var currentUser: User {
            if let existingUser = users.first {
                return existingUser
            } else {
                let newUser = User()
                context.insert(newUser)
                try? context.save()
                return newUser
            }
        }
        
        self.activePet = currentUser.pets.first(where: { $0.isActive }) ?? {
            // (this shouldn't be hit)
            let fallback = Pet()
            currentUser.pets.append(fallback)
            try? context.save()
            return fallback
        }()
        
        self.activePetViewModel = PetViewModel(pet: activePet!)
        
        do {
            try context.save()
        } catch {
            print("Failed to set up user: \(error)")
        }
    }
    
    private func fetchData() {
        do {
            let petsDescriptor = FetchDescriptor<Pet>()
            let usersDescriptor = FetchDescriptor<User>()
            
            self.pets = try context.fetch(petsDescriptor)
            self.users = try context.fetch(usersDescriptor)
        } catch {
            print("Failed to fetch data: \(error)")
        }
    }
    
    func checkDailyReset() {
        fetchData()
        
        let defaults = UserDefaults.standard
        let lastSavedDate = defaults.object(forKey: "lastSavedDate") as? Date ?? Date()
        if !Calendar.current.isDateInToday(lastSavedDate) { // TODO: This being in UTC vs local time might be causing the reset to fail
            activePet?.activitiesCompleted = 0
            defaults.set(Date(), forKey: "lastSavedDate")
            try? context.save()
        }
    }
}

