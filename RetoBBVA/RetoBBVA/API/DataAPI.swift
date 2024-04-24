//
//  DataAPI.swift
//  RetoBBVA
//
//  Created by Alumno on 24/04/24.
//

import Foundation

struct DataAPI {
    var key: String
}

struct chatInfo {
    var username: String
    var friendname: String

}


let apiConfig = chatInfo(username: "Alberto", friendname: "BBVA")

let api: DataAPI = DataAPI(key: "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")

