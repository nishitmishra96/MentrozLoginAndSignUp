import Foundation
import Moya

enum LoginAndSignUpApiCollection {
    case PhoneNumberLogin(dataObject: UserCredentials)
    case SocialLogin(dataObject: UserCredentials)
    case RegisterThroughPhoneNumber(dataObject: UserCredentials)
    case RegisterThroughSocialAccount(dataObject: UserCredentials)
}
extension LoginAndSignUpApiCollection: TargetType{
    var baseURL: URL {
        return URL(string: "http://stgapp.mentorz.com:8080")!
    }
    
    var path: String {
        switch self {
        case .PhoneNumberLogin(_):
            return "/mentorz/api/v3/user/login"
        case .SocialLogin(_):
            return "/mentorz/api/v3/user/sociallogin"
        case .RegisterThroughPhoneNumber(_):
            return "/mentorz/api/v3/user"
        case .RegisterThroughSocialAccount(_):
            return "/mentorz/api/v3/user/social"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .PhoneNumberLogin(_), .SocialLogin(_):
           return .post
        case .RegisterThroughPhoneNumber(_), .RegisterThroughSocialAccount(_):
            return .put
        }
    }
    
    var sampleData: Data {
        return Data()    }
    
    var task: Task {
        switch self {
        case .PhoneNumberLogin(dataObject: let dataObject):
            return .requestParameters(parameters: dataObject.toJSON(), encoding: JSONEncoding.default)
        case .SocialLogin(dataObject: let dataObject):
            return .requestParameters(parameters: dataObject.toJSON(), encoding: JSONEncoding.default)
        case .RegisterThroughPhoneNumber(dataObject: let dataObject):
            return .requestParameters(parameters: dataObject.toJSON(), encoding: JSONEncoding.default)
        case .RegisterThroughSocialAccount(dataObject: let dataObject):
               return .requestParameters(parameters: dataObject.toJSON(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self{
    case .PhoneNumberLogin(_),.SocialLogin(_),.RegisterThroughPhoneNumber(_),.RegisterThroughSocialAccount(_):
        return ["Accept":"application/json","Content-Type":"application/json","User-Agent":"hhhh"]
        }
    }
    
    
}
