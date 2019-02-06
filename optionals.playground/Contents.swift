//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//struct color {
//
//    var red:String
//    var blue:String?
//    var howMnay:Int
//
//
//    func heavy() ->String {
//        if blue == nil {
//            return " username is \(red) and is \(howMnay)"
//
//        }else{
//
//             return "i am a nice \(blue!)"
//        }
//
//
//    }
//}
//
//var reggie = color(red: "color", blue: nil, howMnay: 5)
//reggie.heavy()
//
//struct see {
//
//    var ok:String
//    var allook:String?
//
//    func red() -> String {
//        if allook == nil {
//
//            return " i am a noob at this \(ok)"
//        }else{
//            return " i am a nic \(allook!)"}
//    }
//
//}
//
//var seep = see(ok: "got it", allook: nil)
//seep.allook
//seep.red()



//var forCast: [String : String] = ["rain":"Drousy" ]
//
//var reggie = forCast["rain"]
//print(reggie)
//
//if let reggie = forCast["rain"] {
//
//   print(reggie.lowercased())
//
//}else {
//
//   print("reggie")
//
//}



//var states:[String:String] = ["ny":"new york","nj":"new jersey","md":"maryland"]
//
//let myState = "new york"
//myState
//
//
//if let myState = states[""]{
//
//    print(myState)
//
//}else{
//
//   print("new york")
//
//}



//struct reggie {
//    var ok:String?
//    var notOk:String
//
//    func doIt() -> String{
//        if notOk == nil{
//        return "i am"
//
//        }else{
//return " i am not \(ok)"
//    }
//    }
//}
//var oldCode = reggie(ok: nil, notOk: "ko")
//print(oldCode)
//oldCode.doIt()




//
//var need:[String:[String:Int]] = ["rain":["rainDrop":90]]
//
//struct weather {
//
//    var humidity:String
//    var rainDrop:Int?
//
//}
//typealias Drop = [String:[String:Int]]
//func weatherForcast(snow name:String, from drop:Drop) -> weather? {
//    if let weatherForcast = drop[name]{
//        if let humidity = weatherForcast["humidity"]{
//            if let rainDrop = weatherForcast["rainDrop"]{
//
//            }
//
//        }
//
//    }
//return weather(humidity: humidity, rainDrop: rainDrop)
//}
//






var weather:[String:[String:Int]] = ["today":[
    "temperature":92,
    "humidity":98

    ],"tomorow":[
        "temperature":72,
        "rain":99
    ]]


struct CurrentWeather

{
    var temperature:Int
    var humidity:Int?
    var rain:Int?

}
//type allias
typealias WeatherDictionary = [String:[String:Int]]
func processWeather(for date:String , from weatherDictionary:WeatherDictionary)-> CurrentWeather?{

    //downside of iflet syntax
    if let dateWeather = weatherDictionary [date]{
        if let temp = dateWeather["temperature"]{
            if let humidity = dateWeather["humidity"]{
                if let rain = dateWeather["rain"]{
                    
                    
                    return CurrentWeather(temperature: temp, humidity: humidity, rain: rain)
                }
                
                
            }
            
        }


    }
return nil
}



func processWeather2(for date:String , from weatherDictionary:WeatherDictionary)-> CurrentWeather?{
    
    //downside of iflet syntax
    if let dateWeather = weatherDictionary [date] {
        if let temp = dateWeather["temperature"],
            let humidity = dateWeather["humidity"],
            let rain = dateWeather["rain"] {
            
            return CurrentWeather(temperature: temp, humidity: humidity, rain: rain)
            
        }
        
    }
    return nil
}



//introducing new langauge guard let

func processWeatherOfficial(for date:String , from weatherDictionary:WeatherDictionary)-> CurrentWeather?{
    
    //downside of iflet syntax
    
    guard let weather = weatherDictionary[date],let temperature = weather["temperature"] else {
        
        
        return nil
    }
    //can use weather and temperature outside scope of guardlet
    return CurrentWeather(temperature: temperature, humidity: weather["humidity"], rain: weather["rain"])
}

//var reggie:[String:[String:Int]] = ["roger":[
//
//    "num2":9,"num3":0
//    ]]
//struct food {
//    var num:Int
//    var num2:Int
//
//
//
//}
//typealias Num5 = [String:[String:Int]]
//func practice(for num4:String, from num5:Num5) -> food {
//
//    if let jirble = num5[num4] {}
//
//
//}





//
//var printer:[String:[String:Int]] = ["1st copy":["Minesota Viking":14,"New Orleans":00,], "2nd copy":["jacksonville" : 99]]
//
//struct superBowlCopies
//{
//    var firstTeam:Int
//    var secoundTeam:Int?
//    var thirdTeam:Int?
//
//
//}
//typealias Copy = [String:[String:Int]]
//func watchGame(for showing:String,from copy:Copy)-> superBowlCopies? {
//
//    if let viewing = copy[showing],let firstTeam = viewing["Minesota Viking"],let secoundTeam = viewing["New Orleans"],let thirdTeam = viewing["jacksonville"] {
//        return superBowlCopies(firstTeam: 14, secoundTeam: 00, thirdTeam: 99)
//    }
//
//
//
//    return nil
//}
//
//struct printer {
//
//    var fax:NSData?
//    var student:String
//
//}
//
//struct faxMachine {
//
//    var phoneNumber:printer?
//    var collegeId: String
//
//}
//
//struct dialup {
//
//    var dialNumber:faxMachine?
//    var custom:String
//
//
//    func theRightWay()->NSData? {
//
//        if let faxMachine = dialNumber, let printer = faxMachine.phoneNumber  {
//
//            return printer.fax
//        }
//
//        else{
//
//    return nil
       
//        return self.dialNumber!.phoneNumber!.fax
//    }
//}


class Red
{
   
    
    
    func not(){
        
        
        
    }
    class func not(){
        
        
    }
    
    
    
    
}
let oops = Red()
oops.not()

Red.not()
