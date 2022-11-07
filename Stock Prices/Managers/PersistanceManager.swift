//
//  PersistanceManager.swift
//  Stock Prices
//
//  Created by TheGIZzz on 1/11/2565 BE.
//

import Foundation

class PersistanceManager {
    static let shared = "PersistanceManager"
    
    private init() {}
    
    // MARK: - Private
    
    private var hasOnboarded: Bool {
        return false
    }
    
    // MARK: - Public
    
    public var watchList: [String] {
        return []
    }
    
    public func addToWatchList() {
        
    }
    
    public func removeFromWatchList() {
        
    }
}
