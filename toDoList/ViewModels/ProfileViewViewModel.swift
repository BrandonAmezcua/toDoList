//
//  ProfileViewViewModel.swift
//  toDoList
//
//  Created by Brandon Amezcua on 1/21/24.
//

import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase
import Foundation

class ProfileViewViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init () {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    @Published var userList = [User]()
    @Published var user: User?
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
    func findSpecificUser() -> User? {
        for specificUser in userList {
//            print("\nspecificUser:")
//            print(specificUser)
//            print("\nspecificUserID:")
//            print(specificUser.id)
//            print("\ncurrentUserId:")
//            print(currentUserId)
            if specificUser.id == currentUserId {
                print("\nspecificUser.name:")
                print(specificUser.name)
                return User(id: specificUser.id,
                            name: specificUser.name,
                            email: specificUser.email,
                            joined: specificUser.joined)
            }
        }
        return nil
    }
    
    func fetchUser() {
        // get a reference to the database
        let db = Firestore.firestore()
        
        // read the documents at a specific path
        db.collection("users").getDocuments { snapshot, error in
            // check for errors
            if error == nil {
                // no errors
                
                if let snapshot = snapshot {
                    // update the list property in the main thread
                    DispatchQueue.main.async { [self] in
                        // get all the documents and create a user
                        self.userList = snapshot.documents.map { d in
                            
                            // create a user item for each document returned
                            let tempUser = User(id: d["id"] as? String ?? "",
                                        name: d["name"] as? String ?? "",
                                        email: d["email"] as? String ?? "",
                                        joined: d["joined"] as? TimeInterval ?? 0)
                            self.user = findSpecificUser()
                            return tempUser
                        }
                    }
                }
            } else {
                // handle the error
            }
        }
    }
}
