var captain = "Katheryn Janeway"
captain = "James T. Kirk"
captain = "true"
print(captain)

let students = 3
let staff = 6
var totalPeople = students + staff
print (totalPeople)
totalPeople = 302
print (totalPeople)
let poop = 3.023
print (poop)

let iPhonePrice = 649.95
let iPhonesSold = 10
let totalValue = iPhonePrice * Double(iPhonesSold)
print(totalValue)

let statement = "The Spring iOS class has " + String(students) + " students"
print(statement)

let betterStatement = "The Spring iOS class has \(students) students."
print(betterStatement)

var shipCaptains = ["Malcom Reynolds", "Jean-Luc Picard", "James T. Kirk", "Han Solo"]
print(shipCaptains)
print(shipCaptains[3])
shipCaptains.append("Kateryn Janeway")
print(shipCaptains)

for tundra in shipCaptains
{
  print(tundra)
}

let apples = 5
let oranges = 8

if apples > oranges
{
  print("we have more apples")
}
else
{
  print("We have more oranges")
}
then