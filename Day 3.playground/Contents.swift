//Day 3 Wed, March 15, 2017


//Dictionaries = Hashes, etc. = key value storage pair -> dont have to be the same data type, but must have the same pattern

var occupations = ["Jean-Luc Picard": "captain", "Geordi LaForge": "cheif engineer"] //data stored is actually the values(Ex. captain, cheif engineer,etc...)
print(occupations["Jean-Luc Picard"]!)          //key = (Ex. Jean-Luc Picard, Geordi LaForge, etc...)


//Enums = Enumeration

enum CompassPoint: String
{
  case north
  case south
  case east
  case west
}

var directionToHead = CompassPoint.north      //data tupe of direction to head is the name of the enum ->CompassPoint is the data type
print(directionToHead)
directionToHead = .east       //data type is CompassPoint so you don't need to declare it anymore when changing the variable since data types can't be changed
print(directionToHead)

switch directionToHead        //switches must be exhausted
{
case .north:
  print("Lots of planets have a north")
case .south:
  print("Watch out for penguins")
case .east:
  print("Where the sun rises")
case .west:
  print("Where the skies are blue")
}

enum Planet: Int        //Enums names are capitalcase but cases have Camelcase
{                   //data type of an Enum is a raw value
  case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
var somePlanet = Planet.earth
somePlanet = .mercury
print(somePlanet)
switch somePlanet
{
case .earth:
  print("mostly harmless")
case .mercury:
  print("rip")
default:
  print("pretty harmful for humans")
}

let earthsOrder = Planet.earth.rawValue       //raw values can be any number, string, or charactor
let sunsetDirection = CompassPoint.west.rawValue

let possiblePlanet = Planet(rawValue:7)
print(possiblePlanet!)
let positionToFind = 9
if let aPlanet = Planet(rawValue: positionToFind)         //instance is object of a class -> if the optional comes out to false the line is skipped
{
  print(aPlanet)
}

//Example
    enum PaperSize: String {
      case A4, A5, Letter, Legal
    }

    print(PaperSize(rawValue: "Legal") as Any)      //as Any silences the warning
    // Prints "Optional("PaperSize.Legal")"

    print(PaperSize(rawValue: "Tabloid") as Any)
    // Prints "nil"
















