// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 16/03/21.
//  All code (c) 2021 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Combine
import Foundation

public extension UserDefaults {
    /// Perform an action if the defaults have been changed.
    ///
    /// We pause for a little while first (1 second by default), to avoid
    /// firing the action multiple times after a quick sequence of changes.

    func onChanged(delay: TimeInterval = 1.0, _ action: @escaping () -> ()) -> AnyCancellable {
        return NotificationCenter.default
            .publisher(for: UserDefaults.didChangeNotification, object: self)
            .debounce(for: .seconds(delay), scheduler: RunLoop.main)
            .sink { _ in
                action()
            }
    }
}
