

import Foundation

extension UserDefaults {
    var onboardingCompleted: Bool {
        get { return bool(forKey: #function) }
        set { setValue(newValue, forKey: #function) }
    }
}
