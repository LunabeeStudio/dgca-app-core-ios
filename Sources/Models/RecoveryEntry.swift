//
/*-
 * ---license-start
 * eu-digital-green-certificates / dgca-app-core-ios
 * ---
 * Copyright (C) 2021 T-Systems International GmbH and all other contributors
 * ---
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ---license-end
 */
//  
//  RecoveryEntry.swift
//
//  
//  Created by Yannick Spreen on 4/28/21.
//  

import Foundation
import SwiftyJSON

public struct RecoveryEntry: HCertEntry {
    public var typeAddon: String { "" }
    public let uvci: String
    
    let diseaseTargeted: String
    let firstPositiveDate: String
    let countryCode: String
    let issuer: String
    let validFrom: Date
    let validUntil: Date

    public var validityFailures: [String] {
      var fail = [String]()
      if validFrom > HCert.clock {
          fail.append("Recovery statement is not valid yet.".localized)
      }
      if validUntil < HCert.clock {
          fail.append("Recovery statement is not valid anymore.".localized)
      }
      return fail
    }

    enum Fields: String {
      case diseaseTargeted = "tg"
      case firstPositiveDate = "fr"
      case countryCode = "co"
      case issuer = "is"
      case validFrom = "df"
      case validUntil = "du"
      case uvci = "ci"
    }

    init?(body: SwiftyJSON.JSON) {
    guard
      let diseaseTargeted = body[Fields.diseaseTargeted.rawValue].string,
      let firstPositiveDate = body[Fields.firstPositiveDate.rawValue].string,
      let countryCode = body[Fields.countryCode.rawValue].string,
      let issuer = body[Fields.issuer.rawValue].string,
      let validFromStr = body[Fields.validFrom.rawValue].string,
      let validUntilStr = body[Fields.validUntil.rawValue].string,
      let validFrom = Date(dateString: validFromStr),
      let validUntil = Date(dateString: validUntilStr),
      let uvci = body[Fields.uvci.rawValue].string
    else {
      return nil
    }
    self.diseaseTargeted = diseaseTargeted
    self.firstPositiveDate = firstPositiveDate
    self.countryCode = countryCode
    self.issuer = issuer
    self.validFrom = validFrom
    self.validUntil = validUntil
    self.uvci = uvci
  }

}
