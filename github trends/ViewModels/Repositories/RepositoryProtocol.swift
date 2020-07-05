//
//  RepositoryProtocol.swift
//  github trends
//
//  Created by admin on 05.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

public protocol RepositoryProtocol {
    func getItems(for timePeriod:TimePeriod, completion: @escaping ([RepositoryModel]) -> ())
}
