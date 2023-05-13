//
//  model.swift
//  TestUSBank
//
//  Created by priyatham reddy on 10/14/22.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let mrData: MRData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

// MARK: - MRData
struct MRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let raceTable: RaceTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case raceTable = "RaceTable"
    }
}

// MARK: - RaceTable
struct RaceTable: Codable {
    let season, round: String
    let races: [Race]

    enum CodingKeys: String, CodingKey {
        case season, round
        case races = "Races"
    }
}

// MARK: - Race
struct Race: Codable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: Circuit
    let date: String
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date
        case results = "Results"
    }
}

// MARK: - Circuit
struct Circuit: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: Location

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}

// MARK: - Location
struct Location: Codable {
    let lat, long, locality, country: String
}

// MARK: - Result
struct Result: Codable {
    let number, position, positionText, points: String
    let driver: Driver
    let constructor: Constructor
    let grid, laps, status: String
    let time: ResultTime?
    let fastestLap: FastestLap

    enum CodingKeys: String, CodingKey {
        case number, position, positionText, points
        case driver = "Driver"
        case constructor = "Constructor"
        case grid, laps, status
        case time = "Time"
        case fastestLap = "FastestLap"
    }
}

// MARK: - Constructor
struct Constructor: Codable {
    let constructorID: String
    let url: String
    let name, nationality: String

    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}

// MARK: - Driver
struct Driver: Codable {
    let driverID: String
    let code: String?
    let url: String
    let givenName, familyName, dateOfBirth, nationality: String
    let permanentNumber: String?

    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case code, url, givenName, familyName, dateOfBirth, nationality, permanentNumber
    }
}

// MARK: - FastestLap
struct FastestLap: Codable {
    let rank, lap: String
    let time: FastestLapTime
    let averageSpeed: AverageSpeed

    enum CodingKeys: String, CodingKey {
        case rank, lap
        case time = "Time"
        case averageSpeed = "AverageSpeed"
    }
}

// MARK: - AverageSpeed
struct AverageSpeed: Codable {
    let units: Units
    let speed: String
}

enum Units: String, Codable {
    case kph = "kph"
}

// MARK: - FastestLapTime
struct FastestLapTime: Codable {
    let time: String
}

// MARK: - ResultTime
struct ResultTime: Codable {
    let millis, time: String
}

//Welcome.mrData.raceTable.races[Race.constructor.nationality]
