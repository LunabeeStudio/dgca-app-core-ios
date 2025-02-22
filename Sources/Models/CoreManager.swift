/*-
 * ---license-start
 * eu-digital-green-certificates / dgca-verifier-app-ios
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
//  CoreManager.swift
//  
//
//  Created by Igor Khomiak on 21.10.2021.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

public class CoreManager {
    public static var shared = CoreManager()
    
#if os(iOS)
    public static var cachedQrCodes = [String: UIImage]()
#else
    public static var cachedQrCodes = [String: NSImage]()
#endif

    public static var publicKeyEncoder: PublicKeyStorageDelegate?

    lazy public var config = HCertConfig.default
}
