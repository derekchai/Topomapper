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
    
    /// Sends an HTTP GET request to a specified URL with optional headers, and 
    /// decodes the response to a specified Codable type.
    ///
    /// - Parameters:
    ///   - url: The URL to which the GET request is sent.
    ///   - headers: A dictionary of HTTP headers to include in the request. The 
    ///   default value is an empty dictionary.
    ///
    /// - Throws: An error if the request fails or if the response cannot be decoded 
    /// to the specified type.
    ///
    /// - Returns: The response decoded to the specified Codable type.
    static func httpGet<T: Codable>(
        from url: URL,
        withHeaders headers: [String: String] = [:]
    ) async throws -> T {
        var request = URLRequest(url: url)
        
        request.allHTTPHeaderFields = headers
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
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
    
    /// Sends an HTTP POST request to a specified URL with optional headers and 
    /// a request body, and decodes the response to a specified Codable type.
    ///
    /// - Parameters:
    ///   - url: The URL to which the POST request is sent.
    ///   - headers: A dictionary of HTTP headers to include in the request. 
    ///   The default value is an empty dictionary.
    ///   - body: The HTTP body data to send with the request.
    ///
    /// - Throws: An error if the request fails or if the response cannot be 
    /// decoded to the specified type.
    ///
    /// - Returns: The response decoded to the specified Codable type.
    static func httpPost<T: Codable>(
        from url: URL,
        withHeaders headers: [String: String] = [:],
        body: Data
    ) async throws -> T {
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
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

