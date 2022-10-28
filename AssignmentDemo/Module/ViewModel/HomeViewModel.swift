//
//  HomeViewModel.swift
//  AssignmentDemo
//

import Foundation

/// Home view model
/// Class will be used to define methods and buisness logic for the view
final class HomeViewModel {
    
    var itemModel: HomeModel?
    var filterItemModel: HomeModel?
    
    func getItemTodisplay() {
        let data = mockData.data(using: .utf8)
        if let itemData = data {
            do {
                let model = try JSONDecoder().decode(HomeModel.self, from: itemData)
                itemModel = model
                filterItemModel = model
            } catch {
                print("Error while creating model")
            }
        }
    }
    
    func doneSearch() {
        itemModel = filterItemModel
    }
}

var mockData: String {
    """
    {
        "items": [
            {
                "name": "Item 1",
                "image": "Image url"
            },
            {
                "name": "Item 2",
                "image": "Image url"
            },
            {
                "name": "Item 3",
                "image": "Image url"
            },
            {
                "name": "Item 4",
                "image": "Image url"
            },
            {
                "name": "Item 5",
                "image": "Image url"
            },
            {
                "name": "Item 6",
                "image": "Image url"
            },
            {
                "name": "Item 7",
                "image": "Image url"
            },
            {
                "name": "Item 8",
                "image": "Image url"
            },
            {
                "name": "Item 9",
                "image": "Image url"
            },
            {
                "name": "Item 10",
                "image": "Image url"
            },
            {
                "name": "Item 11",
                "image": "Image url"
            },
            {
                "name": "Item 12",
                "image": "Image url"
            },
            {
                "name": "Item 13",
                "image": "Image url"
            },
            {
                "name": "Item 14",
                "image": "Image url"
            },
            {
                "name": "Item 15",
                "image": "Image url"
            },
            {
                "name": "Item 16",
                "image": "Image url"
            },
            {
                "name": "Item 17",
                "image": "Image url"
            },
            {
                "name": "Item 18",
                "image": "Image url"
            },
            {
                "name": "Item 19",
                "image": "Image url"
            },
            {
                "name": "Item 20",
                "image": "Image url"
            },
            {
                "name": "Item 10",
                "image": "Image url"
            }
        ]
    }
    """
}
