import Foundation
import Moya

enum LoginAndSignUpApiCollection {
    case LoginThroughPhoneNumber(dataObject: DataForJSON)
    case LoginThroughSocialAccount(dataObject: DataForJSON)
    case RegisterThroughPhoneNumber(dataObject: DataForJSON)
    case RegisterThroughSocialAccount(dataObject: DataForJSON)
}

extension LoginAndSignUpApiCollection: TargetType{
    var baseURL: URL {
        return URL(string: "http://stgapp.mentorz.com:8080")!
    }
    
    var path: String {
        switch self {
        case .LoginThroughPhoneNumber(_):
            return "/mentorz/api/v3/user/login"
        case .LoginThroughSocialAccount(_):
            return "/mentorz/api/v3/user/sociallogin"
        case .RegisterThroughPhoneNumber(_),.RegisterThroughSocialAccount(_):
            return "/mentorz/api/v3/user"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .LoginThroughPhoneNumber(_), .LoginThroughSocialAccount(_):
           return .post
        case .RegisterThroughPhoneNumber(_), .RegisterThroughSocialAccount(_):
            return .put
        }
    }
    
    var sampleData: Data {
        return Data()    }
    
    var task: Task {
        switch self {
        case .LoginThroughPhoneNumber(dataObject: let dataObject):
            return .requestParameters(parameters: dataObject.toJSON(), encoding: JSONEncoding.default)
        case .LoginThroughSocialAccount(dataObject: let dataObject):
            return .requestParameters(parameters: dataObject.toJSON(), encoding: JSONEncoding.default)
        case .RegisterThroughPhoneNumber(dataObject: let dataObject):
            return .requestParameters(parameters: dataObject.toJSON(), encoding: JSONEncoding.default)
        case .RegisterThroughSocialAccount(dataObject: let dataObject):
               return .requestParameters(parameters: dataObject.toJSON(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Accept":"application/json","Content-Type":"application/json","User-Agent":"ew"]
    }
    
    
}
