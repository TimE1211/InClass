//Day 2 March 14, 2017

//Palindrome = written same forwards and back


//let subtotal = 25.76
//let tipPercentage = 0.2
//let tipAmount = subtotal * tipPercentage
//let total = subtotal + tipAmount
//print(total)


//----------------------------------------------------------------------------------------------------------------------------------


import Foundation

func calculateTip(subtotal: Double, tipPercentage: Double) -> String
{
  let tipAmount = subtotal * tipPercentage
  return String(format: "%d%% of $%0.2f is $%0.2f", Int(tipPercentage * 100), subtotal, tipAmount)
}
// %% = %     %d = Integer      %f = floating point number = Double      0.2 = give me two decimal places       % = the escape charactor

var tipMessage = calculateTip(subtotal: 25.95, tipPercentage: 0.2)
print(tipMessage)
tipMessage = calculateTip(subtotal: 99.99, tipPercentage: 0.5)
print(tipMessage)
// "\(container)" = turn container into string -> used to print out data types as a string = string interpolation


//----------------------------------------------------------------------------------------------------------------------------------


class Car                               //class is basically a blueprint for building objects -> used for organizing data -> objects data type = class
{
  var make: String                      //variables part of the class are called properties
  var model: String
  var color: String                     //classes have attributes and methods(functions inside classes)
  
  var fuelLevel = 100.0
  var odometer = 0.0
  
  init(make: String, model: String, color: String)              //initialize is a special kind of function -> only used when making an object
  {                                     //variables: make, model, and color are different containers,then in the initialize function (which are local variables)
    self.make = make                    //these containers only exist for a short amt of time (ttl)
    self.model = model                  //to differentiate between the two containers self.container = container
    self.color = color                  //self.make = var make   make = initialize make                   self = self reference
  }
  func description() -> String
  {
    let carDescription = "\(color) \(make) \(model)"
    return carDescription
  }
  func drive()
  {
    fuelLevel -= 20.0
    odometer += 5.0
  }
}

let ponycar = Car(make: "Ford", model: "Mustang", color: "Red")       //this is the object created by the class (all the data types are objects: Int, Double,...)
//initialize is just moving the data we recieve to the variable spot/ properties or setting data to a value
//the data type of ponycar is Car                   Car object is being stored in the constant ponycar
print(ponycar.description())                        //can print out the variables or method of ponycar

let familycar = Car(make: "Honda", model: "Accord", color: "White")
print(familycar.description())

ponycar.drive()
print(String(ponycar.fuelLevel) + "% fuel level")
print(String(ponycar.odometer) + " miles")

ponycar.drive()
print(String(ponycar.fuelLevel) + "% fuel level")
print(String(ponycar.odometer) + " miles")

//terminal commands: cd(change directory), ls(list), pwd(show directory)
//rm - rf file name(delete file), hub(git hub), git clone URL(pull)


