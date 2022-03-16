//
//  NetworkService.swift
//  HomeWorkTask7
//
//  Created by Oleg Stepanov on 14.03.2022.
//

import Foundation

protocol Networking {
    func getRequest(api: APIMusicScheme, parameters: [String : String]?, completion: @escaping (Data?, Error?) -> ())
    func getImageData(url: String, completion: @escaping(Data?, Error?) -> ())
}

final class NetworkService: Networking {
    func getRequest(api: APIMusicScheme, parameters: [String : String]?, completion: @escaping (Data?, Error?) -> ()) {
        let url = url(from: api, parameters: parameters)
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping(Data?, Error?) -> ()) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
    
    func getImageData(url: String, completion: @escaping(Data?, Error?) -> ()) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func url(from apiScheme: APIMusicScheme, parameters: [String: String]?) -> URL {
        var components = URLComponents()
        components.scheme = apiScheme.scheme
        components.host = apiScheme.host
        components.path = apiScheme.path
        guard let parameters = parameters else { return components.url! }
        components.queryItems = parameters.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
}
