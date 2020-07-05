//
//  TestRepository.swift
//  github trends
//
//  Created by admin on 05.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class TestRepository: RepositoryProtocol {
    
    func getItems(for timePeriod: TimePeriod, completion: @escaping ([RepositoryModel]) -> ()) {
        completion(testElements)
    }
    
    
    var testElements = [
        RepositoryModel(username: "test", repoName: "test Repo 1", desc: "lak;sfjaslkdjaslkdjsalkdajsdkl;asjdakls;djskld;askldaskljaskl;djas;kjaskdlajskld"),
        RepositoryModel(username: "test", repoName: "test Repo 2", desc: "lak;sfjaslkdjaslkdjsalkdajsdkl;asjdakls;djskld;askldaskljaskl;djas;kjaskdlajskld"),
        RepositoryModel(username: "test", repoName: "test Repo 3", desc: "lak;sfjaslkdjaslkdjsalkdajsdkl;asjdakls;djskld;askldaskljaskl;djas;kjaskdlajskld"),
        RepositoryModel(username: "test", repoName: "test Repo 4", desc: "lak;sfjaslkdjaslkdjsalkdajsdkl;asjdakls;djskld;askldaskljaskl;djas;kjaskdlajskld"),
        RepositoryModel(username: "test", repoName: "test Repo 5", desc: "lak;sfjaslkdjaslkdjsalkdajsdkl;asjdakls;djskld;askldaskljaskl;djas;kjaskdlajskld"),
        RepositoryModel(username: "test", repoName: "test Repo 6", desc: "lak;sfjaslkdjaslkdjsalkdajsdkl;asjdakls;djskld;askldaskljaskl;djas;kjaskdlajskld"),
        RepositoryModel(username: "test", repoName: "test Repo 7", desc: "lak;sfjaslkdjaslkdjsalkdajsdkl;asjdakls;djskld;askldaskljaskl;djas;kjaskdlajskld"),
        RepositoryModel(username: "test", repoName: "test Repo 8", desc: "lak;sfjaslkdjaslkdjsalkdajsdkl;asjdakls;djskld;askldaskljaskl;djas;kjaskdlajskld"),
        RepositoryModel(username: "test", repoName: "test Repo 9", desc: "lak;sfjaslkdjaslkdjsalkdajsdkl;asjdakls;djskld;askldaskljaskl;djas;kjaskdlajskld"),
        RepositoryModel(username: "test", repoName: "test Repo 10", desc: "lak;sfjaslkdjaslkdjsalkdajsdkl;asjdakls;djskld;askldaskljaskl;djas;kjaskdlajskld"),
        RepositoryModel(username: "test", repoName: "test Repo 11", desc: "lak;sfjaslkdjaslkdjsalkdajsdkl;asjdakls;djskld;askldaskljaskl;djas;kjaskdlajskld"),
        RepositoryModel(username: "test", repoName: "test Repo 12", desc: "lak;sfjaslkdjaslkdjsalkdajsdkl;asjdakls;djskld;askldaskljaskl;djas;kjaskdlajskld")
    ]


    
}
