import UIKit

class FirstScreen: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonDesign.buttonStyle(button: signUpButton)
    }
    
//   let manager = AFHTTPSessionManager(baseURL: NSURL("http://frog-api.localhost"))
//    manager.requestSerializer = AFJSONRequestSerializer()
//    manager.responseSerializer = AFJSONResponseSerializer()
//    let params = [
//        "foo": "bar"
//    ]
//
//    manager.POST("/app_dev.php/oauth/v2/token", parameters: params, success: {
//    (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
//    println("success")
//
//    }, failure: {
//    (task: NSURLSessionDataTask!, error: NSError!) in
//    println("error")
//    })


}

