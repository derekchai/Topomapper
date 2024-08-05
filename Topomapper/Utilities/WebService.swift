//
//  WebService.swift
//  Topomapper
//
//  Created by Derek Chai on 06/08/2024.
//

import Foundation
import os

enum WebService {
    static private let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(
            describing: WebService.self
        )
    )
    
    /// Fetches and decodes an HTTP response from the given URL into a type which conforms to
    /// `Codable`.
    /// - Returns: The decoded response in the given type.
    static func fetchAndDecodeResponse<T: Codable>(
        from url: URL,
        httpHeaders: [String: String]?
    ) async throws -> T {
        var urlRequest = URLRequest(url: url)
        
        if let httpHeaders {
            urlRequest.allHTTPHeaderFields = httpHeaders
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse else {
            throw WebServiceError.badResponse
        }
        
        guard response.statusCode >= 200 && response.statusCode <= 299 else {
            throw WebServiceError.badStatusCode(code: response.statusCode)
        }
        
        guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
            throw WebServiceError.unableToDecodeResponse
        }
        
        logger.info("Decoded response from \(url.absoluteString) with status code \(response.statusCode).")
        
        return decodedResponse
    }
    
    enum WebServiceError: Error {
        case badURL
        case badResponse
        case badStatusCode(code: Int)
        case unableToDecodeResponse
    }
}

