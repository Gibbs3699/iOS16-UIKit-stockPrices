//
//  APICaller.swift
//  Stock Prices
//
//  Created by TheGIZzz on 1/11/2565 BE.
//

import Foundation

class APICaller {
    static let shared = "APICaller"
    
    private init() {}
    
    private struct Constants {
        static let apiKey = "cbbsfe2ad3ibhoa2ac2g"
        static let sandboxApikey = ""
        static let baseUrl = "https://finhub.io/api/v1/"
    }
    
    private enum Endpoints: String {
        case search
    }
    
    private enum APIError: Error {
       case noDataReturned
       case invalidURL
    }
    
    private func url(for endpoint: Endpoints, queryParams: [String: String] = [:]) -> URL? {
        var urlString = Constants.baseUrl + endpoint.rawValue
        
        var queryItems = [URLQueryItem]()
        
        for (name, value) in queryParams {
            queryItems.append(.init(name: name, value: value))
        }
        
        queryItems.append(.init(name: "token", value: Constants.apiKey))
        
        urlString += "?" + queryItems.map{ "\($0.name)=\($0.value ?? "")"}.joined(separator: "&")
        
        return URL(string: urlString)
    }
    
    private func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T,Error>) -> Void) {
        guard let url = url else {
            return completion(.failure(APIError.invalidURL))
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.noDataReturned))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
