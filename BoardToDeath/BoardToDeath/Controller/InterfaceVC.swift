

import UIKit

class InterfaceVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var prettyImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var userDefaults = UserDefaults.standard
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        captionLabel.isHidden = true
      print("WHAT", userDefaults.onboardingCompleted)
        if !userDefaults.onboardingCompleted {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let onboardingVC = storyboard.instantiateViewController(withIdentifier: STORYBOARD_ID_ONBOARDING_VC) as? OnboardingVC else { return }
            present(onboardingVC, animated: true, completion: nil)
        } else {
            let alertVC = UIAlertController(title: "You did it!", message: "Yay, you made it. You are the best. Sort of.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Awesome!", style: .default, handler: nil)
            alertVC.addAction(action)
          print("BOOM")
            present(alertVC, animated: true, completion: nil)
        }
    }
    
  
  
  
    func downloadImage(fromURL urlString: String, completion: @escaping (UIImage) -> Void) {
        guard let url = URL(string: urlString) else { fatalError() }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                fatalError()
            }
            
            guard let data = data, let image = UIImage(data: data) else { fatalError() }
            completion(image)
        }.resume()
    }
    
    @IBAction func loadImageBtnWasPressed(_ sender: Any) {
        if prettyImageView.image == nil {
            downloadImage(fromURL: IMAGE_URL, completion: { (image) in
                DispatchQueue.main.async {
                    self.prettyImageView.image = image
                    self.captionLabel.isHidden = false
                }
            })
        }
    }
}



















