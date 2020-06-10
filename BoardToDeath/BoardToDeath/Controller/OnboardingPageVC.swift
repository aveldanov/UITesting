

import UIKit

class OnboardingPageVC: UIViewController {

    var userDefaults = UserDefaults.standard
        
    @IBAction func doneBtnWasPressed(_ sender: Any) {
//        userDefaults.onboardingCompleted = true
//        dismiss(animated: true)
      
      let alert = UIAlertController(title: "You did it", message: "Congrats! You finished onboarding", preferredStyle: .alert)
      let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      
      alert.addAction(alertAction)
      
      alert.view.accessibilityIdentifier = "Alert"
      present(alert, animated: true, completion: nil)
    }
    
}
