//
//  Address.swift
//  SideBarApp
//
//  Created by Antoine Omnès on 30/08/2023.
//

import CoreLocation

class Address: Codable {
    var street: String
    var suite: String
    var city: String
    var zipCode: String
    var coordinate: CLLocationCoordinate2D

    init(street: String, suite: String, city: String, zipCode: String, coordinate: CLLocationCoordinate2D) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipCode = zipCode
        self.coordinate = coordinate
    }

    // MARK: - Codable Methods

    enum CodingKeys: String, CodingKey {
        case street, suite, city, zipCode, coordinate
        case latitude, longitude // Added latitude and longitude keys
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.street = try container.decode(String.self, forKey: .street)
        self.suite = try container.decode(String.self, forKey: .suite)
        self.city = try container.decode(String.self, forKey: .city)
        self.zipCode = try container.decode(String.self, forKey: .zipCode)

        let coordinateContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .coordinate)
        let latitude = try coordinateContainer.decode(Double.self, forKey: .latitude)
        let longitude = try coordinateContainer.decode(Double.self, forKey: .longitude)
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(street, forKey: .street)
        try container.encode(suite, forKey: .suite)
        try container.encode(city, forKey: .city)
        try container.encode(zipCode, forKey: .zipCode)

        var coordinateContainer = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .coordinate)
        try coordinateContainer.encode(coordinate.latitude, forKey: .latitude)
        try coordinateContainer.encode(coordinate.longitude, forKey: .longitude)
    }
}
