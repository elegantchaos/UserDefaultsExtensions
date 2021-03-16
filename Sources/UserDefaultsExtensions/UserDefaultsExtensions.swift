// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 16/03/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation


extension UserDefaults {
    func write(_ value: String, forKey key: String) {
        if string(forKey: key) != value {
            set(value, forKey: key)
        }
    }
    
    func write(_ value: Int, forKey key: String) {
        if integer(forKey: key) != value {
            set(value, forKey: key)
        }
    }
    
    func read<T,V>(key: String, into path: ReferenceWritableKeyPath<T,V>, of: inout T) where V: RawRepresentable, V.RawValue: Equatable {
        if let raw = value(forKey: key) as? V.RawValue, let value = V(rawValue: raw) {
            if value != of[keyPath: path] {
                of[keyPath: path] = value
            }
        }
    }

    func update<V>(_ value: inout V, fromKey key: String, default defaultValue: V? = nil) where V: UserDefaultsRepresentable, V: Equatable {
        if let updated = (self.value(forKey: key) as? V) ?? defaultValue {
            if value != updated {
                value = updated
            }
        }
    }

    func update<V>(_ value: inout V, fromKey key: String, default: V? = nil) where V: RawRepresentable, V.RawValue: Equatable {
        if let raw = self.value(forKey: key) as? V.RawValue, let updated = V(rawValue: raw) {
            if value != updated {
                value = updated
            }
        }
    }


}
