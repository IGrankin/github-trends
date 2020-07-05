//
//  GithubRepository.swift
//  github trends
//
//  Created by admin on 05.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class GithubRepository: RepositoryProtocol {
    
    let defaultSession = URLSession(configuration: .default)
    
    func urlBuilder(timePeriod: TimePeriod) -> URL {
        
    }
    
    func getItems(for timePeriod: TimePeriod, completion: @escaping ([RepositoryModel]) -> ()) {
        completion()
    }
    
    
}
