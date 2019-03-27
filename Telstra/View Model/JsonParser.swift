
import UIKit

class JsonParser: NSObject {
    
    //Parser Method Call
    func parseObj(dict:Dictionary<AnyHashable, Any>) -> Array<Any> {
        var anarray :Array<Any> = []
        let rowarray = dict["rows"] as! Array<Any>
        for check in 1..<rowarray.count{
            let obj = Objects()
            let dict1 = rowarray[check] as! Dictionary<AnyHashable,Any>
            if let name = dict1["title"] as? String {
                obj.name = name
            }else{
                obj.name = ""
            }
            if let descrip = dict1["description"] as? String {
                obj.descrip = descrip
            }else{
                obj.descrip = ""
            }
            if let image = dict1["imageHref"] as? String {
                obj.image = image
            }else{
                obj.image = ""
            }
            if (obj.name == "" && obj.descrip == "" && obj.image == "")
            {
                
            }else{
                anarray.append(obj)
            }
        }
        return anarray
    }

}
