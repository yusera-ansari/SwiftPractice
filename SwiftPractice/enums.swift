//
//  enums.swift
//  SwiftPractice
//
//  Created by yusera-ansari on 20/03/25.
//

//test1
enum Weekday:Int{
    /*
     Define an enum:

     Define an enum called Weekday with cases for each day of the week (e.g., monday, tuesday, etc.).
     */
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}
enum Direction:String{
    /*
     Enum with raw values:

     Create an enum Direction with raw values representing compass directions (e.g., north, south, east, west) using String as the raw type.
     Print the raw value of Direction.north.
     */
    case north = "North"
    case south = "South"
    case east = "East"
    case west = "West"
}


//test2
enum Temperature{
    /*
     Enum with Associated Values:

     Create an enum Temperature that can have two cases:
     Celsius(value: Double)
     Fahrenheit(value: Double)
     Write a function that converts a Temperature to Fahrenheit.
     */
    
    //    fahrenheit = celsius * 1.8 + 32
    
    case celsius(value : Double);
    case fahrenheit(value : Double);
    
    func convertToFahrenheit()->Double{
        switch self {
        case .celsius(let val):
            print("converting \(val)C to Fahrenheit")
            return (val * 1.8) + 32
            
        case .fahrenheit(let val):
            print("Returning as is, as it is already in Fahrenheit")
            return val
        }
    }

}

//test3
enum TrafficLight: Float{
    /*
     Enum with methods:

     Create an enum TrafficLight with three cases: red, yellow, and green.
     Add a method to the enum called timeRemaining that returns a String indicating how much time is left for each light (you can assume that each light has a fixed time left).
     */
    case red = 2.5  , yellow = 3, blue = 7
    
    func timeRemaining()->String{
        switch self{
        case .blue:
            return "Time remaining \(rawValue)"
        case .red:
            return "Time remaining \(rawValue)"

        case .yellow:
            return "Time remaining \(rawValue)"

        }
    }
    
    
}


func convertToFahrenheit(temperature : Temperature)->Double{
    switch temperature{
    case .celsius(let value):
        
        print("converting \(value)C celsius to fahrenheit")
            return (value * 1.8) + 32
        
    
    case .fahrenheit(let value):
        print("Returning as is, as it is already in Fahrenheit")
        return value
    }
}

//test4
enum CardSuit{
    /*
     Enum with computed properties:

     Create an enum CardSuit representing the four suits of a deck of cards (hearts, diamonds, clubs, spades).
     Add a computed property symbol that returns the suit's symbol (♥, ♦, ♣, ♠).
     */
    var symbol:String{
        switch self{
        case .hearts:
                    return "♥"
                case .diamonds:
                    return "♦"
                case .clubs:
                    return "♣"
                case .spades:
                    return "♠"
        }
    }
    case hearts, diamonds, clubs, spades
}

//test5

enum  Vehicle{
    /*
     Enum switch statement:

     Define an enum Vehicle with cases: car(make: String), bike(type: String), and truck(cargoCapacity: Int).
     Write a switch statement that prints different messages depending on the vehicle type.

     */
    case car(make:String)
    case bike(type: String),truck(cargoCapacity:Int)
    
    func typeOfVehicle(){
        switch self{
        case .bike(let val):
            print("This is a bike of type: \(val)")
        case .car(let val):
            print("This is a car of type: \(val)")
        case .truck(let val):
            print("This is a truck of type: \(val)")
        }
    }
}

class Enumeration:Test, Testable{
    static func appendTests() {
        tests.append(test1)
        tests.append(test2)
        tests.append(test3)
        tests.append(test4)
        tests.append(test5)
    }
    
    static func runTests() {
        super.runTests(with: Enumeration.self)
    }
    static func test1(){
        print(Weekday.friday.rawValue)
        print(Direction.north.rawValue)
    }
    static func test2(){
    let result =    convertToFahrenheit(temperature: Temperature.celsius(value: 28))
        print(result);
        
        print(convertToFahrenheit(temperature: Temperature.fahrenheit(value: 25)))
        addSpace()
        //from enum
        
        print(Temperature.celsius(value: 20).convertToFahrenheit())
        print(Temperature.fahrenheit(value: 66).convertToFahrenheit())
        
    }
    static func test3(){
       print( TrafficLight.blue.timeRemaining())
    }
    static func test4(){
        print(CardSuit.diamonds.symbol)
        print(CardSuit.clubs.symbol)
        print(CardSuit.spades.symbol)
        print(CardSuit.hearts.symbol)
    }
    static func test5(){
         Vehicle.bike(type: "Hero honda").typeOfVehicle()
    }
    
}
