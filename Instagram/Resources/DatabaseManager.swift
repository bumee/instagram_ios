//
//  DatabaseManager.swift
//  Instagram
//
//  Created by kibum on 2023/02/14.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    // MARK: - public
    
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
          completion(true)
    }
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void){
        let key = email.safeDatabaseKey()
        print(key)
        database.child(key).setValue(["username": username]) {error, _ in
            if error == nil {
                // succeed
                completion(true)
                return
            } 
            else {
                // fail
                completion(false)
                return
            }
        }
    }
}
