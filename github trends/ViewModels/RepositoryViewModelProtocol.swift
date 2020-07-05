//
//  RepositoryViewModelProtocol.swift
//  github trends
//
//  Created by admin on 05.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

public enum TimePeriod: Int, CaseIterable {
    case daily
    case weekly
    case monthly
    
    func fromStringToIntValue(value: String) -> Int {
        switch value {
        case "daily":
            return TimePeriod.daily.rawValue
        case "weekly":
            return TimePeriod.weekly.rawValue
        case "monthly":
            return TimePeriod.monthly.rawValue
        default:
            return TimePeriod.daily.rawValue
        }
    }
    
    func fromIntToString(value: Int) -> String {
        switch value {
        case TimePeriod.daily.rawValue:
            return "daily"
        case TimePeriod.weekly.rawValue:
            return "weekly"
        case TimePeriod.monthly.rawValue:
            return "monthly"
        default:
            return "daily"
        }
    }
}

public protocol RepositoryViewModelProtocol {
    var newReposLoaded: Dynamic<Bool> { get }
    func getTimePeriods() -> [String]
    func getLastChosenTimePeriod() -> Int
    func getRepoCount() -> Int
    func getRepo(for index: Int) -> RepositoryModel?
    func loadRepos()
    func timePeriodWasChanged(to value: Int)
}
