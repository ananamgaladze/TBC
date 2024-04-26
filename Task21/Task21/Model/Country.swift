//
//  Country.swift
//  Task21
//
//  Created by ana namgaladze on 25.04.24.
//

import UIKit

struct Country: Codable {
    let name: Name?
    let flags: Flags?
    let tld: [String]?
    let cca2: String?
    let ccn3: String?
    let cca3: String?
    let cioc: String?
    let independent: Bool?
    let status: String?
    let unMember: Bool?
    let currencies:[String: Currency]?
    let idd: Idd?
    let capital: [String]?
    let altSpellings: [String]?
    let region: String?
    let subregion: String?
    let languages: [String: String]?
    let translations: Translations?
    let latlng: [Double]?
    let landlocked: Bool?
    let borders: [String]?
    let area: Double?
    let demonyms: Demonyms?
    let flag: String?
    let maps: Maps?
    let population: Int?
    let gini: [String: Double]?
    let fifa: String?
    let car: Car?
    let timezones: [String]?
    let continents: [String]?
    let coatOfArms: CoatOfArms?
    let startOfWeek: String?
    let capitalInfo: CapitalInfo?
    let postalCode: PostalCode?
}

struct Name: Codable {
    let common: String?
    let official: String?
//    let nativeName: [String: String]?
}

struct Flags: Codable {
    let png: String?
    let svg: String?
    let alt: String?
}

struct Currency: Codable {
    let name: String?
    let symbol: String?
}

struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

struct CapitalInfo: Codable {
    let latlng: [Double]?
}

struct PostalCode: Codable {
    let format: String?
    let regex: String?
}

struct Demonym: Codable {
    let f: String?
    let m: String?
}

struct Maps: Codable {
    let googleMaps: String?
    let openStreetMaps: String?
}

struct Translation: Codable {
    let official: String?
    let common: String?
}

struct Demonyms: Codable {
    let eng: Demonym?
    let fra: Demonym?
}

struct Translations: Codable {
    let ara: Translation?
    let bre: Translation?
    let ces: Translation?
    let cym: Translation?
    let deu: Translation?
    let est: Translation?
    let fin: Translation?
    let fra: Translation?
    let hrv: Translation?
    let hun: Translation?
    let ita: Translation?
    let jpn: Translation?
    let kor: Translation?
    let nld: Translation?
    let per: Translation?
    let pol: Translation?
    let por: Translation?
    let rus: Translation?
    let slk: Translation?
    let spa: Translation?
    let srp: Translation?
    let swe: Translation?
    let tur: Translation?
    let urd: Translation?
    let zho: Translation?
}

struct Car: Codable {
    let signs: [String]?
    let side: String?
}




