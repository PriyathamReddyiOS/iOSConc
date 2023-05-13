import UIKit

let heading = "This is a heading"

let underline = String(repeating: "=", count: heading.count)

let equalsArray = [String](repeating: "=", count: heading.count)

// Int to string & string to Int

let someInteger = 101

// Wrong way of doing
let str1 = "\(101)"
 
// right way of doing
let str2 = String(someInteger)

let num = "elephant"

// if it doesn't have a valid num, then it returns nil

let convert = Int(num)

let num1 = "28"

let con = Int(num1)

// Effective way to filter out duplicates from an Array

let scores = [5, 6, 1, 3, 5, 3, 9]

let scoreSet = Set(scores)

// Order is not guaranteed in sets

let uniqueScores = Array(scoreSet)

// Dictionary capacities, if you want to create a dictionary and add things later on, and know the exact num of items in dictionaries, it's better to intialize it like below, it makes performance btter

let dict = Dictionary<String, String>(minimumCapacity: 100)

// In arrays you have it a bit diff, you need to call a method

var arr = [String]()
arr.reserveCapacity(100)

// enum operations

// You can give raw value to the enum, so you can access it's raw value, it can be either Int or String


enum Color: Int{
    case unknown, blue, green, pink, purple, red
}

struct Toy{
    let name: String
    let color: Color
}

let barbie = Toy(name: "Barbie", color: .pink)
let raceCar = Toy(name: "Lightnign McQueen", color: .red)

let color1 = Color.blue.rawValue

// When you assign Int to the enum, by default it starts with 0, but you change it by assigning the num you want to start it from

enum Planet: Int {
    case mars = 1
    case venus
    case Neptune
    case earth
}

var planet = Planet.venus.rawValue

// You can also initialize it using raw value like below

var planet1 = Planet(rawValue: 4)

// When you assign string to enum, you can access raw value in a similar manner

enum Car: String{
    case Honda, Kia, Opelastra, Skoda
}

var car = Car.Kia.rawValue

// enums computed properties, enums can also have functions in it

enum Vehicle{
    case honda,toyota, Benz, Skoda, audi
    
    var description: String{
        switch self{
        case .honda:
            return "Affordable and reliable"
        case .toyota:
            return "Cheap and reliable"
        case .Benz:
            return "Stylish and classy"
        case .Skoda:
            return "Good vehicle in India, but not sold in USA"
        case .audi:
            return "Its a sports vehicle"
        }
        
    
    }
}

// Array sorting

var names = ["Taylor", "Timothy", "Tyler", "Thomas", "Tobias", "Tabitha"]

let numbers = [2,9,8,6,0,5]

//.sorted() leaves the initial array same, and gives out a new sorted array, where as sort() woul modify the initial array by doing sorting

let sortedArray = names.sorted()
// When you want to do manual sorting like to put a specific element in the first place.
names.sort{
    if ($0 == "Taylor"){
        return true
    } else if ($1 == "Taylor"){
        
        return false
    }
        
        else {
     return $0 < $1
    }
    
}
print(names)

// .min(), .max() returns the first and last elements after sorting out the array, min & max are most effective when compared to sorting

let minimum = numbers.min()
let maximum = numbers.max()

// Array comparable, little complex when you have the array of type Struct/ Class, to implement it, you should always confirm struct/class to comparable prortocol.

struct Dog: Comparable{
 
    
    var breed: String
    var age: Int
    
    static func < (lhs: Dog, rhs: Dog) -> Bool {
        return lhs.breed < rhs.breed
    }
    
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return lhs.age == rhs.age
        
    }
    
}

let poppy = Dog(breed: "poodle", age: 5)
let rusty = Dog(breed: "Labrador", age: 2)
let rover = Dog(breed: "Corgi", age: 11)

var dogs = [poppy, rusty,rover]

dogs.sort()

// Adding arrays

let beethoven = Dog(breed: "St Bernard", age: 8)

dogs += [beethoven]

// for removing items from array and return the value, two ways removeLast returns a value, popLast returns an optional, so if you've chance that array is empty its good to use poplast.

if let dog = dogs.popLast(){
    //do stuff with dog
    print(dog)
}

// Dictionaries

let cities: [String: Int] = ["Shanghai": 24_256_800, "Karachi": 23_500_00,"Beijing": 21_516_000,"Soul": 9_995_000]
// modifying values of the dictionary

let roundedCities = cities.mapValues { "\($0/1_000_000) million people"
}

print(roundedCities)

// Grouping function on dictionaries

let groupedCities = Dictionary(grouping: cities.keys) { $0.first! }
print(groupedCities)

let newGroupedCities = Dictionary(grouping: cities.keys) { $0.count }
print(newGroupedCities)

// Use of default keyword in dictionaries

var favoriteTvShows = ["Red Dwarf", "Blackadder", "Fawlty Towers", "Red Dwarf"]

var favoriteCount = [String: Int]()

for show in favoriteTvShows{
    favoriteCount[show, default: 0] += 1
}
print(favoriteCount)

// Sets can be thought of like unordered arrays without duplicate elements, becoz of these sets are much faster than arrays

var set1 = Set<Int>([1,2,3,4,5])
var set2 = Set(1...100)

set1.insert(6)
set1.insert(7)
print(set1)
print(set2)

set1.remove(6)
set1.remove(7)

print(set1)

// Methods you can use om sets

let spaceShips1 = Set(["Pritam", "Michael", "Jcole"])
let spaceShips2 = Set(["Drake", "Pritam", "Snoopy"])
let spaceShips3 = Set(["Ram", "Raj","Rahim"])

let union = spaceShips1.union(spaceShips2) // combines two sets & sets don't contain duplicates

let intersection = spaceShips1.intersection(spaceShips2) // common of two
let difference = spaceShips1.symmetricDifference(spaceShips2) //difference of two

spaceShips1.isSubset(of: union)  // true, return bool
spaceShips1.isSubset(of: spaceShips1) // true
spaceShips1.isSubset(of: spaceShips2) // false, coz it doesn't have any common

spaceShips1.isStrictSubset(of: union) // true
spaceShips1.isStrictSubset(of: spaceShips1) // false

union.isSuperset(of: spaceShips1) // true
union.isSuperset(of: spaceShips3) // false
union.isStrictSuperset(of: spaceShips1) // true

spaceShips1.isDisjoint(with: spaceShips2) //false

// NScounted sets, used to count the elements.

var names1 = ["Pritam","Raju","Ramesh"]
names1 += ["Pritam","Drake","Olivia"]

var countedSets = NSCountedSet(array: names1)

print(countedSets.count(for: "Pritam")) // 2, even though it doesn't have duplicate, it keeps a track

print(countedSets.count(for: "Olivia")) //1

// Tuples

var singer = (first: "Taylor", last: "Swift")

// you can acccess the tuples values by couple of ways

print(singer.1)

print(singer.last) // How ever this is the recommended way to do!

//singer(first: "", fish: "bjh") // You can't change the elements

singer = (first: "Pritam", last: "Reddy") // you can only change the values

// Closures & tuples
// You cannot add methods to tuples but you can add closures to tuples

var hero = (first: "John", last: "Adams", sing: {
    (lyrics: String) in
    
    print("La la la \(lyrics)")
})

hero.sing("lovers gonna love!") // it looks like a method but not, its a closure

// Tuple returns

func fetchWeather() -> (type: String, cloudCover: Int, high: Int, low: Int){
    return ("Sunny",2,50,20)
}

let weather = fetchWeather()

print(weather.type)

//Optional tuples

let optionalElements: (String?, String?) = ("Taylor", nil)
let optionalTuple: (String, String)? = ("Taylor", "Swift")
let optionalBoth: (String?,String?)? = (nil,"Swift")

//Tuple comparison, it compares values, not the element labels


let singer1 = (first: "Taylor", last: "Swift")
let alien = (first: "Drake", last: "Johnson")

let bird = (breed: "Taylor", name: "Swift")

if singer1 == alien{
    print("match")
}else {
    print("no match")
}

if singer1 == bird{
    print("match")
} else{
    print("no match")
}

// typealias

let father = (first: "Narotham", last: "Akkati")
let mother = (first: "Pavani", last: "Padi")

// Without type alias, here is the method

//func afterMarriage(man: (first: String, last: String), woman: (first: String, last: String)) -> (man: (first: String, last: String), woman: (first: String, last: String)){
//    return (man, (woman.first, man.last))
//}

// With type alias

typealias Name = (first: String, last: String)

func afterMarriage(man: Name, woman: Name) -> (husband: Name, wife: Name) {
    return (man,(woman.first,man.last))}

print(afterMarriage(man: father, woman: mother))

// Generics

func inspectString(_ value: String){
    print("Received String is \(value)")
}

func inspectInt(_ value: Int){
    print("Received Int is \(value)")
}

// Similar types of methods have to be written for float, double etc, which is a waste of time, instead we can write the method using generics

func inspect<T>(_ value: T){
    print("Received \(type(of: value)) is \(value) ")
}

inspect(2)
inspect("Pritam")
inspect(["Pritam", "Drake"])

// Limiting Generics

func square<T: Numeric>(_ value: T) -> T{
    return value * value
}

square(2)
square(0.2)
square(2.890808)

// Generic types

struct Deque<T>{
    var array = [T]()
    
    mutating func pushBack(_ obj: T){
        array.append(obj)
    }
    
    mutating func pushFront(_ obj: T){
        array.insert(obj, at: 0)
    }
    
    mutating func popBack() -> T?{
        array.popLast()
    }
    
    mutating func popFront() -> T?{
        if array.isEmpty{
            return nil
        }else {
            return array.removeFirst()
    }
}
}
var testDeque = Deque<Int>()

testDeque.pushFront(2)
testDeque.pushBack(5)
testDeque.popBack()
testDeque.popFront()

// Generic NScounted sets

struct CustomCountedSet<T: Any>{
   let internalSet = NSCountedSet()
    
    mutating func add(_ obj: T){
        internalSet.add(obj)
    }
    
    mutating func remove(_ obj: T){
        internalSet.remove(obj)
    }
    
    func count(for obj: T) -> Int{
        return internalSet.count(for: obj)
    }
}

var countedSet = CustomCountedSet<String>()
countedSet.add("Hello")
countedSet.add("Hello")
countedSet.count(for: "Hello")

var numCountedSet = CustomCountedSet<Int>()
numCountedSet.add(1)
numCountedSet.add(2)

// Immutability

struct PersonStruct{
    var name: String
    var age: Int
    
}

final class PersonClass{
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

// Compare constant object of struct & class i.e taylor2 and taylor 4

var taylor1 = PersonStruct(name: "Taylor swift", age: 26)
taylor1.name = "Michael Jackson"
taylor1 = PersonStruct(name: "Pritam", age: 30)

let taylor2 = PersonStruct(name: "Taylor swift", age: 26)

// these two lines will throw error as they are immutable created from struct
//taylor2.name = "Pritam"
//taylor2 = PersonStruct(name: "Michael", age: 27)

var taylor3 = PersonClass(name: "Taylor swift", age: 26)
taylor3.name = "Ramu"
taylor3 = PersonClass(name: "Juff", age: 56)

let taylor4 = PersonClass(name: "Taylor swift", age: 26)
taylor4.name = "Michael"
// this line wont execute as it's constant, it's properties can be changed but not thw entire object


//taylor4 = PersonClass(name: "Pritam", age: 30)

// Variadic functions

func addNumbers(numbers: Int...) -> Int{
    var total = 0
    
    for number in numbers{
        total += number
    }
    return total
}

addNumbers(numbers: 1,2,3,4,5)

// Adding a new operator
precedencegroup ExponentiationPresedence{
    higherThan: MultiplicationPrecedence
    associativity: right
}

infix operator **: ExponentiationPresedence

func **(lhs: Double, rhs: Double) -> Double{
    return pow(lhs, rhs)
}

let result = 2 ** 4 // This works even if you don't assign the Exponentiatn presedence
let result1 = 2 ** 3 ** 2 // But for this, you have to assign expoenentiain pres.
let result2 = 2 ** 3 + 2

// Modifying an existing operator

func ...(lhs: CountableClosedRange<Int>, rhs: Int) -> [Int] {
    let downwards = (rhs..<lhs.upperBound).reversed()
    return Array(lhs) + downwards
}

precedencegroup RangeFormationPrecedence{
    higherThan: CastingPrecedence
    associativity: left
    
}

infix operator ...: RangeFormationPrecedence

let range = 1...10...1

// Closures
// closure is a block of code that could be passed around and storeed like a variable, which also has the ability to capture any variable that uses. Closures are reference types

let simpClos = {     // simple closure
    print("Hey!!")
}

simpClos()

let const = simpClos
const()

func runSomeClosure(_ closure: () -> Void){
    closure()
}

runSomeClosure(simpClos)

let greetPerson = { (name: String) in // Closure with parameter name of type string
    print("Hey \(name)")
    
}

greetPerson("Totty")

func runParamClosure(_ closure: (String) -> Void){
    closure("Pritam")
}

runParamClosure(greetPerson)

// Closure capturing

func testCapture() -> () -> Void{
    var counter = 0
    
    return {
        counter += 1
        print("Counter is now \(counter)")
    }
}
// You will see counter value increments, by this you can say closures are reference types

let greet = testCapture()
greet()
greet()
greet()


let greetCopy = greet
greetCopy()
greet()
greetCopy()

// Closures short hand syntax

let res = names.filter{ $0.hasPrefix("Michael")}
print(res)

// To add elements in an Array

let numArr = [3,8,6,0,2]
numArr.reduce(0, +)

// Escaping closures


var queuedClosures = [() -> Void]()


// If the closures are used later, swift wants them to mark as escaping, in the below case it's used when executeQueuedClosures() is called

func queueClosure(_ closure: @escaping () -> Void){
    queuedClosures.append(closure)
}

queueClosure({print("Running closure 1")})
queueClosure({print("Running closure 2")})
queueClosure({print("Running closure 3")})
//queueClosure(print("Running closure 4"))

func executeQueuedClosures(){
    for closure in queuedClosures{
        closure()
    }
}

executeQueuedClosures()

// Auto closure

// if you place @autoclosure before the params like below, then you dont need extra flower brackets, when you call the function.

func queueClosure1(_ closure:@autoclosure @escaping () -> Void){
queuedClosures.append(closure)
}

queueClosure1(print("hello there"))

// Error Fundementals

enum PasswordError: Error{
    case empty
    case short(minChars: Int)
    case obvious(message: String)
}

func encrypt(_ Str: String,with password: String) throws -> String{
    
    if password == "12345"{
        throw PasswordError.obvious(message: "I have the same number on my luggage")
    }
    
    let encrypted = password + Str + password
    
    return String(encrypted.reversed())
}

func testCatch() {
    do{
    let res = try encrypt("Secret!", with: "Ba1tshop")
    print(res)
    }catch PasswordError.empty {
print("You must enter a password")
   }
    catch PasswordError.short(let minChars) where minChars < 5 {
        print("We have a lax security policy, passwords must be atleast \(minChars)")
    }
    catch PasswordError.short(let minChars) where minChars < 8 {
        print("We have a moderate security policy, passwords must be atleast \(minChars)")
    }
    catch PasswordError.obvious(let message){
        print("Your entered password is obvious, \(message)")
    }
    catch {
        print("Encryption failed!")
    }
}

testCatch()

// throwing parameters

enum Failure: Error{
    case badNetwork(message: String)
    case broken
}

func fetchremote() throws -> String{
    
    throw Failure.badNetwork(message: "Firewall blocked port!")
}

func fetchLocal() -> String{
    return "taylor"
}
// when you use rethrows in a function, you don't need to write do, catch for every scenario, Swift is smart enough to know, you can use do catch only when its necessary

func fetchUserData(using closure: () throws -> String) rethrows {
    
        let userData = try closure()
        print("User data received, \(userData)")
  
}

fetchUserData(using: fetchLocal)

do {
    try fetchUserData(using: fetchremote)
}catch {
    print("error")
}

// compactMap

let albums: [String?] = ["scarface", nil, "Romeo", nil, "Rocky"]

let newAlbums = albums.compactMap { $0 }
print(newAlbums)

let scoresArr = ["100", "95", "Fish", "123"]

let numArr1 = scoresArr.compactMap { Int($0)}
print(numArr1)

let fibnum = [1,1,2,3,5,8,13,21,34,55]

let evenFib = fibnum.filter{ $0 % 2 == 0}
print(evenFib)

let nums = [1,2,3,4,5]

let mapped = nums.map{ $0 * 2}
print(mapped)

// In fact, s.flatMap(transform) is equivalent to Array(s.map(transform).joined())

// Reverse sorting

var animals = ["Dog", "Cat", "Elephant", "Tiger"]

print(animals)

let sortArr = animals.sorted()

// While using reversed you need to convert it to Array coz the output will be in the type reversed Collection

let RevSortArr = Array(animals.sorted().reversed())

// Functional chaining

let london = (name: "London", continent: "Europe", population: 8_539_000)
let paris = (name: "Paris", continent: "Europe", population: 2_244_000)
let lisbon = (name: "Lisbon", continent: "Europe", population: 530_000)
let rome = (name: "Rome",continent: "Europe", population: 2_627_000)
let tokyo = (name: "Tokyo", continent: "Asia", population: 13_350_000)

let cities1 = [london,paris,lisbon,rome,tokyo]

let totalPopulation = cities1.reduce(0){ $0 + $1.population}
print(totalPopulation)
let EurPop = cities1.filter{$0.continent == "Europe"}.reduce(0){ $0 + $1.population}
print(EurPop)

// extensions
extension Int{
    
    func clamp(low: Self, high: Self) -> Self{
         
        if low < self && self < high{
            return self
        } else if self < low{
            return low
        }else {
            return high
        }
    }
    
}

8.clamp(low: 5, high: 10)

3.clamp(low: 5, high: 10)

800.clamp(low: 5, high: 100)

extension Comparable {
    
    func lessThan(array: [Self]) -> Bool{
        
        for element in array{
            if self < element{
                return true
            }else {
                return false
            }
        }
        return false
    }
}

90.lessThan(array: [20,27,308])

"znt".lessThan(array: ["cat","dog"])

//Eaxample

extension Array where ArrayLiteralElement: Comparable{
    
    func fuzzyMatches(_ array: Self) -> Bool{
        guard self.sorted() == array.sorted() else{ return false}
        
       return true
    }
}

[1,2,3].fuzzyMatches([3,2,1])

extension Collection where Iterator.Element == Int{
    func numOf5s() -> Int{
        var count = 0
        var str1 = self.map{ "\($0)"}
        for item in str1{
            for char in item{
                if char == "5"{
                    count += 1
                }
            }
        }
        return count
    }
}

[5, 3, 1, 6, 5].numOf5s()

[15, 55, 26, 555].numOf5s()

extension Array where Element: Comparable{
    
    func isSorted() -> Bool{
        let resu = self == self.sorted() ? true : false
        
        return resu
    }
}

[1,6,5].isSorted()
