// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 16/03/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation


/// Types conforming to this protocol can be stored directly into UserDefaults
public protocol UserDefaultsRepresentable {
}

extension String: UserDefaultsRepresentable {
}

extension Int: UserDefaultsRepresentable {
}

extension UInt: UserDefaultsRepresentable {
}

extension Bool: UserDefaultsRepresentable {
}

