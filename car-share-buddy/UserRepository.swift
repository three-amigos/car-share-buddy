//
//  UserRepository.swift
//  car-share-buddy
//
//  Created by Adnan on 31/07/2015.
//  Copyright © 2015 three-amigos. All rights reserved.
//

import Foundation
import Swift

struct User {
    let name: String
    let carReg: String?
}

protocol UserRepository {
    func getAll() -> [User]
    
    func getByName(name: String) -> User?
    
    func add(user: User) -> User?
    
    func delete(user: User) -> User?
    
    func updateByName(user: User) -> User?
    
}

class UserRepositoryFactory {
    
    class func getRepository() -> UserRepository {
        return ArrayUserRepository()
    }
    
}

class ArrayUserRepository: UserRepository {

    private var userArray:[User] = []
    
    func getAll() -> [User] {
        return userArray
    }
    
    func getByName(name: String) -> User? {
        
        for user in userArray {
            if user.name == name {
                return user
            }
        }
        
        return nil
    }
    
    func add(user: User) -> User? {
        let prev = getByName(user.name)
        
        if prev != nil {
            delete(prev!)
        }
        
        userArray.append(user)
        
        return prev
    }
    
    func delete(user: User) -> User? {
        
        for (index, u) in userArray.enumerate() {
            if (u.name == user.name) {
                userArray.removeAtIndex(index)
                return user
            }
        }
        
        return nil
    }
    
    func updateByName(user: User) -> User? {
        if let prev = getByName(user.name) {
            delete(prev)
            userArray.append(user)
            return prev
        }
        
        return nil
    }
    
}

class LocalUserRepository: UserRepository {
    
    func getAll() -> [User] {
        return []
    }
    
    func getByName(name: String) -> User? {
        return nil
    }
    
    func add(user: User) -> User? {
        return nil
    }
    
    func delete(user: User) -> User? {
        return nil
    }
    
    func updateByName(user: User) -> User? {
        return nil
    }

}