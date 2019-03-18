//: Playground - noun: a place where people can play

import UIKit
/*
 VAR LET
 */

//var str1 = "Bonjour !"
//var str2 = "Hello !"
//str2 = str1
//
//let pi = 3.14
//
///*
// TUPLE
// */
//
//let tuple = (str1, pi)
//print(tuple)
//
//let anotherTuple: (String, String, Int) = ("One", "Un", 1)
//print(anotherTuple)
//print(anotherTuple.2)
//
///*
// ARRAY DICTIONNARY
// */
//
//var fruits: [String] = [String]()
//fruits.append("fraise")
//fruits.append("banane")
//fruits.append("pomme")
////var fruits = ["fraise", "banane", "pomme"]
//print(fruits.first)
//print(fruits[2])
//
//var personnes = [String : Int]()
//personnes["Toto"] = 12
//personnes["Martin"] = 64
//print(personnes["Toto"])
//print(personnes["Maxime"])
//
///*
// OPTIONNAL
// */
//
//var optInt: Int? = 3
//print(optInt)
//print(optInt!)
//
//optInt = nil
//print(optInt)
////print(optInt!)
//
//var optString: String! = "foo"
//print(optString)
//print(optString!)
//
//optString = "bar"
//print(optString)
//print(optString)
//
//optString = nil
//print(optString)
//print(optString!)

/*
 WEAk
 */

//var button: UIButton? = UIButton()
//CFGetRetainCount(button)
//
//weak var buttonRef = button // type option !
//CFGetRetainCount(button)
//
//button = nil
//CFGetRetainCount(buttonRef)
//
///*
// SWITCH
// */
//
//let gesture = UIPanGestureRecognizer()
//
//switch gesture.state {
//case.possible :
//    print("It's probably a PanGesture")
//case.began :
//    print("Began")
//case.changed :
//    print("Ended")
//case.failed, .cancelled :
//    print("Error")
//default :
//    print("An other state")
//}
//
///*
// IF LET
// */
//
//var optInt: Int? = 4
//optInt = nil
//if let number = optInt {
//    print(number)
//}

/*
 STRUCT
 */

//struct PointStruct {
//    var x: Double
//    var y: Double
//
//    mutating func makeOrigin() {
//        x = 0
//        y = 0
//    }
//}
//
///*
// Class
// */
//
//class PointClass {
//    var x: Double
//    var y: Double
//
//    init (x: Double, y: Double) {
//        self.x = x
//        self.y = y
//    }
//
//    func makeOrigin() {
//        x = 0
//        y = 0
//    }
//}
//
//import Foundation
//
//struct Student {
//    var firstName: String {
//        willSet(newFirstName) {
//            print("will set" + newFirstName + " instead of" + firstName)
//        }
//        didSet(oldFirstName) {
//            print("did set" + firstName + " instead of" + oldFirstName)
//
//            firstName = firstName.capitalized
//        }
//    }
//    var lastName: String {
//        didSet {
//            lastName = lastName.capitalized
//    }
//}

//var student = Student(firstName: "Alex")
//
//student.firstName
//
//student.firstName = "Bob"
//
//student.firstName = "SAM"
//
//student.firstName


//
//    class Circle {
//        var radius: Double
//
//        init(radius: Double) {
//            self.radius = radius
//        }
//            willSet {
//                print("About to assign the new valus \(newValue)")
//            }
//            didSet {
//                if radius < 0 {
//                    radius = oldValue
//                }
//            }
//        }
//        var area: Double {
//            get {
//                return radius * radius * Double.pi
//            }
//            set(newValue) {
//                radius = sqrt(newValue / Double.pi)
//            }
//        }
//}

//let circle = Circle(radius: 10)
//print(circle.radius)


//circle.radius = 10
//
//circle.area = 314.159265358979
//
//    print("radius: \(circle.radius)")
//print("area: \(circle.area)")



//enum Color: String {
//    case red = "hearts"
//    case black = "spades"
//    case blue = "diamonds"
//    case green = "clubs"
//}
//
//
//extension Color {
//    static let allColor: [Color] = [.red, .black, .blue, .green]
//}
//
//
////Color.allColor.forEach { print($0) }
//
//
//enum Value: Int {
//    case red, black, blue, yellow
//}
//
//extension Value {
//    static let allValues: [Value] = [.red, .black, .blue, .yellow]
//}
//
//Value.allValues.forEach { print($0) }


//print("value of color: \(allColor)")

//let allColor = Color.allCases
////Color.allCases.count
//
//let allColor = Color.black.rawValue

//
//enum Value: Int {
//    case red = 1
//    case black = 2
//    case blue = 3
//    case yellow = 4
//}
//
//let allValues = [red, black, blue, yellow]

//let minValue = UInt8.min
//let maxValue = UInt8.max
//
//let http404Error = (404, "Not Found")

//EnumeratedIterator Value {

//}


//let π = 3.14159
//let 你好 = "你好世界"
//let 🐶🐮 = "dogcow"

//
//class SurveyQuestion {
//    var text: String
//    var response: String?
//    init(text: String) {
//        self.text = text
//    }
//    func ask() {
//        print(text)
//    }
//}
//
//let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
//cheeseQuestion.ask()
//cheeseQuestion.response = "Yes, I Do like cheese."



//class Vehicle {
//    var currentSpeed = 0.0
//    var descript: Double {
//        return (currentSpeed)
//    }
//    func makeNoise() {
//
//    }
//}
//
//let someVehicle = Vehicle()
//
//print("cars: \(someVehicle.descript)")







//class Card: NSObject {
//    var Color : Int
//    var Value : Int
//    override var description : String
//    {
//        return "describe cards \(Color), \(Value) what"
//    }
//    init (Color : Int, Value : Int) {
//        self.Color = Color
//        self.Value = Value
//    }
//    override func isEqual(_ object: Any?) -> Bool {
//        if let otherCard = object as? Card {
//            return self.Color == otherCard.Color
//        }
//        return false
//    }
//    func getCharacteristics() {
//        print("Color  \(Color), Value \(Value), description \(description)")
//    }
//    func upValue() {
//        self.Value += 1
//    }
//    override func isEqual(object: Any?) -> Bool {
//        return true
//    }
//}

//var test = Card(Color : 10, Value : 15)
//print(test.description)
//
//
//
//class Deck : NSObject {
//    let allSpades : Card
//    let allDiamonds : Card
//    let allHearts : Card
//    let allClubs : Card
//
//    init (allSpades : Card, allDiamonds : Card, allHearts : Card, allClubs : Card) {
//        self.allSpades = allSpades
//        self.allDiamonds = allDiamonds
//        self.allHearts = allHearts
//        self.allClubs = allClubs
//    }
//}

//extension Array {
//    var items = self
//    var shuffled = [Element]();
//
//    for i in 0..<items.count
//    {
//        let rand = Int(arc4random_uniform(UInt32(items.count)))
//        shuffled.append(items[rand])
//        items.remove(at: rand)
//    }
//}
//
//print(shuffled)


//init(cards : Card, discards : Card, outs : Card) {
//    self.cards = cards
//    self.discards = discards
//    self.outs = outs
//}

//let lengthInMeters: Set = [2, 4, 6, 8]
//let lengthInFeet = lengthInMeters.map {meters in meters * 2}
//
//print(lengthInFeet)

//class Test : Vehicle {
//    var car = 0
//    var desc: String {
//        return "some \(car)"
//    }
//}



//
//var test2 = test
//
//print(test.getCharacteristics())
//
//test2.upValue()
//
//print(test.getCharacteristics())

//class Human {
//    var name : String {
//        get {
//            return "5"
//        }
//    }
//}
//
//var human = Human()
//print(human.name)

//class Shape {
//    var color : String
//    init(color: String) {
//        self.color = color
//    }
//}
//
//class Ugolnic : Shape {
//    var linesCount : Int
//    init(linesCount : Int, color: String) {
//        self.linesCount = linesCount
//        super.init(color: color)
//    }
//}
//
//var ugol = Ugolnic(linesCount: 8, color: "Black")
//ugol.color = ""




//class Shape {
//    var backgroundColor : String
//
//    init(color: String) {
//        self.backgroundColor = color
//    }
//    func draw() {
//        print("drawing \(backgroundColor) shape")
//    }
//}
//
//class Rectangle : Shape {
//    override func draw() {
//        print("drawing \(backgroundColor) rectangle")
//    }
//}
//
//class Ring : Shape {
//    override func draw() {
//        print("drawing \(backgroundColor) ring")
//    }
//}
//
//var items = [Shape]()
//
//var rect = Rectangle(color: "White")
//var ring = Ring(color: "Black")
//items.append(rect)
//items.append(ring)
//
//for element in items{
//    element.draw()
//}
//
//rect.draw()
//ring.draw()







//class Shop {
//    var name : String
//    var money : Int
//    var items = [Item]()
//
//    init(name : String, money : Int) {
//        self.name = name
//        self.money = money
//    }
//
//    func selfItem(id: Int) -> Bool {
//        if let existItem = items.first(where: { $0.id == id }){
//            money += existItem.price
//            items.removeAll(where: { $0.id == id })
//            return true
//        }
//        return false
//    }
//}
//
//class Item {
//    var id : Int
//    var price : Int
//    var name : String
//
//    init(id : Int, price : Int, name : String) {
//        self.price = price
//        self.name = name
//        self.id = id
//    }
//}
//
//class Jewelery : Item {
//    var type : String
//
//    init(id: Int, price: Int, name: String, type: String){
//        self.type = type
//        super.init(id: id, price: price, name: name)
//    }
//}
//
//class Food : Item {
//    var duration : Int
//
//    init(id: Int, price: Int, name: String, duration: Int) {
//        self.duration = duration
//        super.init(id: id, price: price, name: name)
//    }
//}
//
//func initItems() -> [Item] {
//    let grusha = Food(id: 0, price: 100, name: "Grusha", duration: 7)
//    let obrRing = Jewelery(id: 1, price: 150, name: "Ring", type: "Obr")
//    let apple = Food(id: 2, price: 100, name: "Apple", duration: 7)
//    let pomRing = Jewelery(id: 3, price: 105, name: "Ringaaa", type: "Obraaa")
//
//    return [grusha, obrRing, apple, pomRing]
//}
//
//var shop = Shop(name: "OurShop", money: 500)
//shop.items = initItems()
//
//if(shop.selfItem(id: 0)) {
//    shop.items.forEach { (item) in
//            print(item.name)
//    }
//}
//else{
//    print("no")
//}
//








