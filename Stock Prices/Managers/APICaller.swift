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
    
    private enum Endpoints: String {
        case search
    }
    
    private enum APIError: Error {
       case noDataReturned
       case invalidURL
    }
    
    private func url(for endpoint: Endpoints, queryParam: [String: String] = [:]) -> URL? {
        return nil
    }
}
