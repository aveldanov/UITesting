//
//  UserDefaults+Onboarding.swift
//  BoardToDeath
//
//  Created by Caleb Stultz on 1/15/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import Foundation

extension UserDefaults {
    var onboardingCompleted: Bool {
        get { return bool(forKey: #function) }
        set { setValue(newValue, forKey: #function) }
    }
}
