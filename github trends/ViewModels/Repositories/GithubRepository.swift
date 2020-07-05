//
//  GithubRepository.swift
//  github trends
//
//  Created by admin on 05.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

enum URLType: String {
    case repositories = "repositories"
}

class GithubRepository: RepositoryProtocol {
    
    let defaultSession = URLSession(configuration: .default)
    let baseURL = "https://ghapi.huchen.dev/"
    let currentLanguage = "kotlin"
    
    
    
    func urlBuilder(timePeriod: TimePeriod) -> URL? {
        let timeString = timePeriod.fromIntToString(value: timePeriod.rawValue)
        let urlString = baseURL + URLType.repositories.rawValue + "?language=" + currentLanguage + "&since=" + timeString
        let url = URL(string: urlString)
        return url
    }
    
    func getItems(for timePeriod: TimePeriod, completion: @escaping ([RepositoryModel]) -> ()) {
        guard let url = urlBuilder(timePeriod: timePeriod) else {
            return
        }
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            if error == nil {
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    return
                }
                guard let data = data else {
                    return
                }
                if let items = try? JSONDecoder().decode([RepositoryModel].self, from: data) {
//                    print(items)
                    DispatchQueue.main.async {
                        completion(items)
                    }
                }
            }
        }
        task.resume()
    }
    
    
}
