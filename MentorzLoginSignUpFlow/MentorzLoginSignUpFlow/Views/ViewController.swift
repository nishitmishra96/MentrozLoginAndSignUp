import UIKit

class FirstScreen: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBAction func LoginButtonPressed(_ sender: Any) {
        let loginScreen = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
        self.navigationController?.pushViewController(loginScreen, animated: true)
   //     self.present(loginScreen, animated: true, completion: nil)

    }
    @IBAction func SignUpButtonPressed(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        ButtonDesign.buttonStyle(button: signUpButton)
    }
}

