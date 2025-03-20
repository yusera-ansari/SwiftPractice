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


// test6
enum APIResponse{
    /*
     Enum with Optionals:

     Create an enum APIResponse with two cases: success(data: Data) and failure(error: String).
     Write a function that takes an APIResponse and prints a message based on whether it was a success or failure.
     */
    
    case success(data:Data), failure(error:String)
    
}
struct Data{
    var response:String = "{message:\"ok\"}"
}
func result(response:APIResponse){
    switch response{
    case .success(let data):
        print("API request success: \(data.response)")
    case .failure(let error):
        print("API request failed: \(error)");
    }
}

//Pattern Matching
//test7
enum Result{
    /* Enum and Pattern Matching:
     
     Create an enum Result with associated values success(value: String) and failure(error: String).
     Use pattern matching to handle a list of Result values and print the results of each case.*/
    
    case success(value:String), failure(error:String)
    
    static  func handleResults(results:[Result]){
        for result in results {
            switch result{
            case .failure(let error):
                print("This is an error \(error)")
            case .success(let value):
                print("This is success: \(value)")
            }
        }
        
    }
}

enum Shape{
    /*
     Enum with Multiple Cases and Associated Values:

     Define an enum Shape with cases:
     circle(radius: Double)
     rectangle(width: Double, height: Double)
     Write a function that calculates the area of a Shape using a switch statement.
     */
    
    case circle(radius:Double), rectangle(width:Double, height:Double)
    func calculateArea(){
        switch self{
        case .circle(let radius):
            print("Area of the circle is \(3.14 * (radius * radius))")
        case .rectangle(let width,let height):
            print("ARea of the rectangle is \(width * height)")
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
        tests.append(test6)
        tests.append(test7)
        tests.append(test8)
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
    static func test6(){
        result(response: APIResponse.failure(error: "{message:500}"))
        result(response: APIResponse.success(data: Data()))
    }
    static func test7(){
        Result.handleResults(results: [Result.failure(error: "302"),
                              Result.failure(error: "305"),
                              Result.success(value: "Success 202"),
                              Result.failure(error: "invalid input"),
                              Result.success(value: "success: user created"),
                              Result.failure(error: "Failure: Invalid id")])
    }
    
    static func test8(){
        Shape.circle(radius: 2).calculateArea();
        Shape.rectangle(width: 2, height: 5).calculateArea()
    }
}
