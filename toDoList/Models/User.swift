//
//  user.swift
//  toDoList
//
//  Created by Brandon Amezcua on 1/21/24.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
