//
//  Location.swift
//  CreateAd
//
//  Created by Dimitrios Tsoumanis on 21/03/2024.
//

import Foundation

struct Location: Decodable, Equatable, Identifiable {
    let id: String
    let mainText: String
    let secondaryText: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "placeId"
        case mainText
        case secondaryText
    }
}
