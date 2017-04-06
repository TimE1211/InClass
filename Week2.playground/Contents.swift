//Day 7, March 21, 2017

//Day 8, March 22, 2017

import Foundation

let today = Date()                    //Date is a framework in Foundation
print (today)

let formatter = DateFormatter()
//formatter.dateStyle = .full
//formatter.timeStyle = .full

formatter.dateFormat = "MMM dd y"

print(formatter.string(from: today).uppercased())

//Day 9, March 23, 2017




var operand1 = ""
var operand2 = ""
var operationSymbol = ""

func operandTapped(numberAsString: String)
{
  if operationSymbol == ""
  {
    operand1 += numberAsString
  }
  else
  {
    operand2 += numberAsString
  }
}

operandTapped(numberAsString: "4")
operandTapped(numberAsString: "6")

operationSymbol += "+"

print(operand1 + " " + operationSymbol + " " + operand2)
//sender.title = title of sender

//@IBAction func operandTapped(sender: UIButton)
//operand1 += UIButton.title
