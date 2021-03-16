// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 16/03/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation


public extension UserDefaults {
    
    /// Write a value to the defaults if it has changed.
    /// We perform a comparison first to avoid triggering unnecessary
    /// notifications if the value is unchanged.
    func write(_ value: String, forKey key: String) {
        if string(forKey: key) != value {
            set(value, forKey: key)
        }
    }
    
    /// Write a value to the defaults if it has changed.
    /// We perform a comparison first to avoid triggering unnecessary
    /// notifications if the value is unchanged.
    func write(_ value: Int, forKey key: String) {
        if integer(forKey: key) != value {
            set(value, forKey: key)
        }
    }
    
    /// Read a value into a variable if it has changed.
    /// We perform a comparison first to avoid triggering unnecessary
    /// notifications (eg for ObservedObject properties) if the value is unchanged.
    func read<V>(_ value: inout V, fromKey key: String, default defaultValue: V? = nil) where V: UserDefaultsRepresentable, V: Equatable {
        if let updated = (self.value(forKey: key) as? V) ?? defaultValue {
            if value != updated {
                value = updated
            }
        }
    }

    /// Read a RawRepresentable value into a variable if it has changed.
    /// We perform a comparison first to avoid triggering unnecessary
    /// notifications (eg for ObservedObject properties) if the value is unchanged.
    func read<V>(_ value: inout V, fromKey key: String, default: V? = nil) where V: RawRepresentable, V.RawValue: Equatable, V.RawValue: UserDefaultsRepresentable {
        if let raw = self.value(forKey: key) as? V.RawValue, let updated = V(rawValue: raw) {
            if value != updated {
                value = updated
            }
        }
    }


}
