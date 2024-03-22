//
//  Network.swift
//  CreateAd
//
//  Created by Dimitrios Tsoumanis on 21/03/2024.
//

import Combine
import Foundation

func getLocations(for input: String) -> some Publisher<[Location], Error> {
    var components = URLComponents(string: "https://4ulq3vb3dogn4fatjw3uq7kqby0dweob.lambda-url.eu-central-1.on.aws/")!
    components.queryItems = [URLQueryItem(name: "input", value: input)]
    return URLSession
        .shared
        .dataTaskPublisher(for: components.url!)
        .map(\.data)
        .decode(type: [Location].self, decoder: JSONDecoder())
}
