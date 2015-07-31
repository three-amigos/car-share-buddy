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
        return LocalUserRepository()
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