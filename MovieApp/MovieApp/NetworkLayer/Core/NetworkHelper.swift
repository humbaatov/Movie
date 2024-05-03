//
//  NetworkHelper.swift
//  URLSessionProject
//
//  Created by Fagan Aslanli on 30.01.24.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum ErrorTypes: String, Error {
    case authError = "Auth Error"
    case generalError = "General"
    case unknownError = "Unknown Error"
    case invalidData = "Invalid Data"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private let baseURL = "https://api.themoviedb.org/3/"
    
    let header = ["accept": "application/json",
                  "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMWFlMGE4NjZlZWMxOTY3YWQ3ZDYyOWM1NmY5ZmMxZCIsInN1YiI6IjY1ZGM4NWM5MWNjNGZmMDE4NmZkMWJiMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.yr6XF963on1Jz1jdzxDl0VBfmoYXUxUELJ5p7PDbE6s"]
    
    func requestURL(url: String) -> String {
        baseURL + url
    }
}
