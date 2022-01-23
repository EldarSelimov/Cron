//
//  PersonModel.swift
//  CronTask
//
//  Created by Eldar on 23.01.2022.
//

import Foundation

struct PersonModel: Decodable {
    let error: Int
    let data: [infoModel]
}

// MARK: - infoModel
struct infoModel: Decodable {
    let id: Int
    let fio, sex, post, company: String
    let actualCompany: Int
    let activity: String
    let photo: String
    
        enum CodingKeys: String, CodingKey {
            case id, fio, sex, post, company
            case actualCompany = "actual_company"
            case activity, photo
        }
}
