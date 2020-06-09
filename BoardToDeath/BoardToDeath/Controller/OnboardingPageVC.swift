

import UIKit

class OnboardingPageVC: UIViewController {

    var userDefaults = UserDefaults.standard
        
    @IBAction func doneBtnWasPressed(_ sender: Any) {
        userDefaults.onboardingCompleted = true
        dismiss(animated: true)
    }
    
}
