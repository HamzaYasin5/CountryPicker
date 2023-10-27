//
//  Country.swift
//  CountryPicker
//
//  Created by Samet Macit on 31.12.2020.
//  Copyright © 2021 Mobven. All rights reserved.

import Foundation

public struct Country: Codable {
    public var phoneCode: String
    public let isoCode: String

    public init(phoneCode: String, isoCode: String) {
        self.phoneCode = phoneCode
        self.isoCode = isoCode
    }

    public init(isoCode: String) {
        self.isoCode = isoCode
        phoneCode = ""
        if let country = CountryManager.shared.getCountries().first(where: { $0.isoCode == isoCode }) {
            phoneCode = country.phoneCode
        }
    }
}

public extension Country {
    /// Returns localized country name for localeIdentifier
    var localizedName: String {
        let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: isoCode])
        let name = NSLocale(localeIdentifier: CountryManager.shared.localeIdentifier)
            .displayName(forKey: NSLocale.Key.identifier, value: id) ?? isoCode
        if name == "türkiye" {
            return "turkey"
        }else if name == "Curaçao" {
            return "curacao"
        }else if name == "Côte d'Ivoire" {
            return "Cote d'Ivoire"
        }else if name == "Réunion" {
            return "Reunion"
        }else if name == "São Tomé and Príncipe" {
            return "Aao Tome And Principe"
        }
        return name
    }
}
