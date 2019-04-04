import UIKit
import SwiftyGif

class FirstScreen: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBAction func LoginButtonPressed(_ sender: Any) {
        let loginScreen = Storyboard.login.instanceOf(viewController: LoginScreen.self)!
        self.navigationController?.pushViewController(loginScreen, animated: true)

    }
    @IBAction func SignUpButtonPressed(_ sender: Any) {
        let signUpOptions = Storyboard.signup.instanceOf(viewController: SignUpOptionsViewController.self)!
        self.navigationController?.pushViewController(signUpOptions, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.myImageView.delegate = self as? SwiftyGifDelegate
        let gif = UIImage(gifName: "onBoardVideo.gif", levelOfIntegrity:0.5)
        self.myImageView.setGifImage(gif)
        guard let confettiImageView = UIImageView.fromGif(frame: myImageView.frame, resourceName: "onBoardVideo") else { return }
        myImageView.addSubview(confettiImageView)
    //    confettiImageView.startAnimating()
//
//        confettiImageView.animationDuration = 3
        confettiImageView.animationRepeatCount = 0
    }
}

extension UIImageView {
    static func fromGif(frame: CGRect, resourceName: String) -> UIImageView? {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "gif") else {
            print("Gif does not exist at that path")
            return nil
        }
        let url = URL(fileURLWithPath: path)
        guard let gifData = try? Data(contentsOf: url),
            let source =  CGImageSourceCreateWithData(gifData as CFData, nil) else { return nil }
        var images = [UIImage]()
        let imageCount = CGImageSourceGetCount(source)
        for i in 0 ..< imageCount {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        let gifImageView = UIImageView(frame: frame)
        gifImageView.animationImages = images
        return gifImageView
    }
}
