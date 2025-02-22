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
//  String.swift
//
//
//  Created by Yannick Spreen on 4/21/21.
//

import Foundation

public extension String {
    subscript(num: Int) -> String {
        return String(self[index(startIndex, offsetBy: num)])
    }

    static var zeroWidthSpace: String {
        "\u{200B}"
    }

    private func generatePadString(length maxLength: Int, pad: String = " ") -> String? {
        if pad.isEmpty || count <= 0 { return nil }
        if maxLength <= utf8.count { return nil }
        
        let fillLength = maxLength - utf8.count
        
        let repeatCount = ceil(
            Double(fillLength) / Double(pad.utf8.count)
        )
        
        let repeatString = String(repeating: pad, count: Int(repeatCount))
        
        let cutIndex = repeatString.index(
            repeatString.startIndex,
            offsetBy: fillLength
        )
        
        let padString = repeatString[..<cutIndex]
        return String(padString)
    }
    
    func padEnd(length maxLength: Int, pad: String = " ") -> String {
        return generatePadString(length: maxLength, pad: pad).map { self + $0 } ?? self
    }
    
    func padStart(length maxLength: Int, pad: String = " ") -> String {
        return generatePadString(length: maxLength, pad: pad).map { $0 + self } ?? self
    }

}
