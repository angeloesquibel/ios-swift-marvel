//
//  MarvelModel.swift
//  Marvel
//
//  Created by Angelo Esquibel on 4/16/21.
//

import Foundation

// MARK: - MarvelInfo
struct MarvelInfo: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: MarvelData
}

// MARK: - MarvelData
struct MarvelData: Codable {
    let offset, limit, total, count: Int
    let results: [Hero]
}

// MARK: - Hero
struct Hero: Codable {
    let id: Int
    let name, description: String
    let thumbnail: Thumbnail
    let resourceURI: String
//    let comics, series: Comics
//    let stories: Stories
//    let events: Comics
    let urls: [URLElement]
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Stories
struct Stories: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: ItemType
}

enum ItemType: String, Codable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let ext: String
    
    var url: String {
        return path + "." + ext
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}

// MARK: - URLElement
struct URLElement: Codable {
    let type: String
    let url: String
}
