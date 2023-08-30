//
//  StorageController.swift
//  SideBarApp
//
//  Created by Antoine Omnès on 30/08/2023.
//

import Foundation
import CoreLocation
import SwiftUI

class StorageController {
    func fetchUser() async -> [User] {
        guard let downloadedUsers: [User] = await WebService().downloadData(fromURL: "https://jsonplaceholder.typicode.com/users") else {return []}
        return downloadedUsers
    }
}

class WebService: Codable {
    func downloadData<T: Codable>(fromURL: String) async -> T? {
        do {
            guard let url = URL(string: fromURL) else { throw NetworkError.badUrl }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            print(response)
            print(String(bytes: data, encoding: String.Encoding.utf8)!)
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            
            
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            
            return decodedResponse
        } catch NetworkError.badUrl {
            print("There was an error creating the URL")
        } catch NetworkError.badResponse {
            print("Did not get a valid response")
        } catch NetworkError.badStatus {
            print("Did not get a 2xx status code from the response")
        } catch NetworkError.failedToDecodeResponse {
            print("Failed to decode response into the given type")
        } catch {
            print("An error occured downloading the data: \(error)")
        }
        
        return nil
    }
}

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}
