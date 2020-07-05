//
//  RepositoryViewModel.swift
//  github trends
//
//  Created by admin on 05.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class RepositoryViewModel: RepositoryViewModelProtocol {
    var newReposLoaded: Dynamic<Bool> = Dynamic(true)
    
    var ud: UserDefaults = UserDefaults.standard
    let udKey: String = "lastChosen"
    var items: [RepositoryModel]?
    var repository: RepositoryProtocol!
    var lastChosen: TimePeriod {
        willSet  {
            self.ud.set(newValue.rawValue, forKey: self.udKey)
        }
    }
    
    required init(itemsRepo: RepositoryProtocol) {
        repository = itemsRepo
        let valueFromUD = ud.integer(forKey: udKey)
        lastChosen = TimePeriod(rawValue: valueFromUD) ?? .daily
    }
    
    func getRepo(for index: Int) -> RepositoryModel? {
        return items?[index]
    }
    
    func loadRepos() {
        repository.getItems(for: lastChosen) { (newItems) in
            self.items = newItems
            self.newReposLoaded.value = true
        }
    }
    
    
    func getTimePeriods() -> [String] {
        return TimePeriod.allCases.map { $0.fromIntToString(value: $0.rawValue) }
    }
    
    func getLastChosenTimePeriod() -> Int {
        return lastChosen.rawValue
    }
    
    func getRepoCount() -> Int {
        return items?.count ?? 0
    }
    
    func timePeriodWasChanged(to value: Int) {
        lastChosen = TimePeriod(rawValue: value) ?? TimePeriod.weekly
        loadRepos()
    }
    
    
}
