//
//  NetworkError.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 11/11/20.
//

import Foundation

enum NetworkError: String, Error {
    
    case invalidURL = "Please enter a valid city name."
    case unableToCompleteNetworkRequest = "Unable to complete Network Request. Please try again later."
    case invalidResponseCode
    case corruptedData
}
