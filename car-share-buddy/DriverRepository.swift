//
//  DriverRepository.swift
//  car-share-buddy
//
//  Created by Adnan on 31/07/2015.
//  Copyright © 2015 three-amigos. All rights reserved.
//

import Foundation
import Swift

struct Driver {
    let name: String
    let carReg: String?
}

protocol DriverRepository {
    func getAll() -> [Driver]
    
    func getByName(name: String) -> Driver?
    
    func add(Driver: Driver) -> Driver?
    
    func delete(Driver: Driver) -> Driver?
    
    func updateByName(Driver: Driver) -> Driver?
    
}

class DriverRepositoryFactory {
    
    private static let instance: DriverRepository = ArrayDriverRepository()
    
    class func getRepository() -> DriverRepository {
        return instance
    }
    
}

class ArrayDriverRepository: DriverRepository {

    private var DriverArray:[Driver] = []
    
    func getAll() -> [Driver] {
        return DriverArray
    }
    
    func getByName(name: String) -> Driver? {
        
        for Driver in DriverArray {
            if Driver.name == name {
                return Driver
            }
        }
        
        return nil
    }
    
    func add(Driver: Driver) -> Driver? {
        let prev = getByName(Driver.name)
        
        if prev != nil {
            delete(prev!)
        }
        
        DriverArray.append(Driver)
        
        return prev
    }
    
    func delete(Driver: Driver) -> Driver? {
        
        for (index, u) in DriverArray.enumerate() {
            if (u.name == Driver.name) {
                DriverArray.removeAtIndex(index)
                return Driver
            }
        }
        
        return nil
    }
    
    func updateByName(Driver: Driver) -> Driver? {
        if let prev = getByName(Driver.name) {
            delete(prev)
            DriverArray.append(Driver)
            return prev
        }
        
        return nil
    }
    
}

class LocalDriverRepository: DriverRepository {
    
    func getAll() -> [Driver] {
        return []
    }
    
    func getByName(name: String) -> Driver? {
        return nil
    }
    
    func add(Driver: Driver) -> Driver? {
        return nil
    }
    
    func delete(Driver: Driver) -> Driver? {
        return nil
    }
    
    func updateByName(Driver: Driver) -> Driver? {
        return nil
    }

}