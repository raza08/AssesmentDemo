//
//  HomeModel.swift
//  AssignmentDemo
//

import Foundation

/// Model is defined to store the data which will be visible to view
struct HomeModel: Codable {
    var items: [Item]?
    
    init(items: [Item]? = nil) {
        self.items = items
    }
}

// MARK: - Item
struct Item: Codable {
    let name: String?
    let image: String?

    init(name: String? = nil, image: String? = nil) {
        self.name = name
        self.image = image
    }
    
    enum CodingKeys: String, CodingKey {
        case name, image
    }
}
