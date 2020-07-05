//
//  RepositoryModel.swift
//  github trends
//
//  Created by admin on 05.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

public struct RepositoryModel: Decodable {
    var username: String?
    var avatar: URL?
    var repoName: String?
    var repoDesc: String?
    var url: URL?
    
    enum CodingKeys: String, CodingKey {
        case username
        case avatar
        case repoName = "repo.name"
        case repoDesc = "repo.description"
        case url = "repo.url"
        
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

         self.username = try? container.decode(String.self, forKey: .username)
         self.avatar = try? container.decode(URL.self, forKey: .avatar)
         self.repoName = try? container.decode(String.self, forKey: .repoName)
         self.repoDesc = try? container.decode(String.self, forKey: .repoDesc)
         self.url = try? container.decode(URL.self, forKey: .url)

    }
    
    init(username: String, repoName: String, desc: String) {
        self.username = username
        self.repoName = repoName
        self.repoDesc = desc
    }
}


