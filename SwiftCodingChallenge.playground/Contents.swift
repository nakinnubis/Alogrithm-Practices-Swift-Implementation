import UIKit

var str = "Hello, playground"
var a1 = ["arp", "live", "strong"]
var a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
func CheckIsSubstr(a1: [String], a2: [String]) -> [String]{
    var result: [String] = []
    for a in a1 {
        for s in a2 {
            let g = isContained(primary: a,secondary: s);
            print(g)
        }
        
        //        for aa in a {
        //            let b = a2.contains(where: {$0.contains(aa)})
        //            print(b)
        //        }
        
    }
    return a1;
}
func isContained(primary: String, secondary: String) -> String{
    let yes =  secondary.contains(primary)
    if yes {
        return primary;
    }
    else{
        return "";
    }
}
CheckIsSubstr(a1: a1, a2: a2)


extension String {
    //
    // Paramter  inputString: This is the string you want to manipulate
    // Paramter- startStringOfUnwanted: This is the string you want to start the removal or replacement from
    //return : The expected output you want but can be emptystring if unable to
    
    static func trimUnWantedEndingString(inputString: String,startStringOfUnwanted: String) -> String{
        //Output string
        var outputString: String?
        //Getting the range based on the string content
        if let range = myString.range(of: startStringOfUnwanted) {
            //Get the lowerbound of the range
            let lower = range.lowerBound
            //Get the upperbound of the range
            let upper = range.upperBound
            //Get the integer position of the start index of the unwanted string i added plus one to ensure it starts from the right position
            let startPos = Int(myString.distance(from: myString.startIndex, to: lower))+1
            //Get the integer position of the end index of the unwanted string i added plus one to ensure it starts from the right position
            let endPos =  Int(myString.distance(from: myString.startIndex, to: upper))+1
            //Substract the start int from the end int to get the integer value that will be used to get the last string i want to stop trimming at
            let endOffsetBy = endPos-startPos
            //get thes string char ranges of values
            let result = myString.index(myString.startIndex, offsetBy: 0)..<myString.index(myString.endIndex, offsetBy: -endOffsetBy)
            //converts the results to string or get the string representation of the result and then assign it to the OutputString
            outputString = String(myString[result]);
        }
        return outputString ?? "";
    }
}
let myString = "9AMnep8MAziUCK7VwKF51mXZ2listing28"
String.trimUnWantedEndingString(inputString: myString, startStringOfUnwanted:"listing")

//Write a method that will determine the first non-repeating character in a string.

//func ConvertStringToArray(_ string: String){
//    if !string.isEmpty {
//        //edge cases
//        // if it is seperated by comma
//        let array = string.components(separatedBy: ", ")
//        // if not seperated by comma
//        let characters = Array(string)
//        //let unique = Array(Set(array))
//    }
//}

extension Array where Element : Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            if !uniqueValues.contains(item) {
                uniqueValues += [item]
            }
        }
        return uniqueValues
    }
}

func firstNonRepeatingLetter(_ str: String) -> String {
    //Edge case one Emtpy String
    if !str.isEmpty{
        let characters = Array(str)
        var charString :[Character] = []
        for (index, value) in characters.enumerated() {
            let counts = str.lowercased().filter { $0 == Character(String(value).lowercased()) }
            if counts.count < 2 {
                charString.append(value)
            }
        }
        if charString.count > 0 {
            if let result = charString.first{
                return String(result)
            }
        }
        
        return ""
    }
    return ""
}



//
//Overview
//
//Resistors are electrical components marked with colorful stripes/bands to indicate both their resistance value in ohms and how tight a tolerance that value has. Remembering these bands is tricky, so let's write a function that will take a string identifying the resistor's ohms and return a string containing a resistor's band colors.
//The resistor color codes
//
//You can see this Wikipedia page for a colorful chart, but the basic resistor color codes are:
//color:     black     brown     red     orange     yellow     green     blue     violet     gray     white
//value:     0     1     2     3     4     5     6     7     8     9
//
//All resistors have at least three bands, with the first and second bands indicating the first two digits of the ohms value, and the third indicating the power of ten to multiply them by, for example a resistor with a value of 47 ohms, which equals 47 * 10^0 ohms, would have the three bands "yellow violet black".
//
//Most resistors also have a fourth band indicating tolerance -- in an electronics kit like yours, the tolerance will always be 5%, which is indicated by a gold band. So in your kit, the 47-ohm resistor in the above paragraph would have the four bands "yellow violet black gold".
//Your mission
//
//Your function will receive a string containing the ohms value you need, followed by a space and the word ohms. The way an ohms value is formatted depends on the magnitude of the value:
//
//    For resistors less than 1,000 ohms, the ohms value is just formatted as the plain number. For example, with the 47-ohm resistor above, your function would receive the string "47 ohms", and return the string "yellow violet black gold".
//
//    For resistors greater than or equal to 1000 ohms, but less than 1,000,000 ohms, the ohms value is divided by 1,000, and has a lower-case "k" after it. For example, if your function received the string "4.7k ohms", it would need to return the string "yellow violet red gold".
//
//    For resistors of 1,000,000 ohms or greater, the ohms value is divided by 1,000,000, and has an upper-case "M" after it. For example, if your function received the string "1M ohms", it would need to return the string "brown black green gold".
//
//Test case resistor values will all be between 10 ohms and 990M ohms.
//More examples, featuring some common resistor values from your kit
//
//"10 ohms"        "brown black black gold"
//"100 ohms"       "brown black brown gold"
//"220 ohms"       "red red brown gold"
//"330 ohms"       "orange orange brown gold"
//"470 ohms"       "yellow violet brown gold"
//"680 ohms"       "blue gray brown gold"
//"1k ohms"        "brown black red gold"
//"10k ohms"       "brown black orange gold"
//"22k ohms"       "red red orange gold"
//"47k ohms"       "yellow violet orange gold"
//"100k ohms"      "brown black yellow gold"
//"330k ohms"      "orange orange yellow gold"
//"2M ohms"        "red black green gold"
//
//Specification
//encodeResistorColors(ohmsString)
//
//Converts ohms to a color band
//
//Parameters
//
//    ohmsString: String - Ohm properties to be parsed and encoded into color bands
//Return Value
//
//    String - Sequence of color bands representing ohm properties
//Constraints
//
//    10 ohms ≤ Ω ≤ 990M ohms
//






//firstNonRepeatingLetter("stress")

//Convert a human-readable resistor value into the correct color-bands.

//black     brown     red     orange     yellow     green     blue     violet     gray

func encodeResistorColors(_ ohmsString: String) -> String {
    // Do something
    var result = ""
    // colorCodes
    let colorCodes:[Character:String] = ["0":"black", "1": "brown","2": "red","3": "orange","4":"yellow","5": "green","6": "blue","7":"violet","8" :"gray"]
    //CheckIfohnmsString is greater than or equal to 1000
    //
    if !ohmsString.isEmpty {
        let numberRetrivedFromStr = ohmsString.components(separatedBy: " ").first
        if let numstring = numberRetrivedFromStr{
            if numstring.last?.lowercased() == "k"{
                let stringWithoutK = numstring.lowercased().components(separatedBy: "k").first
                if let strWitK = stringWithoutK{
                    if strWitK.contains("."){
                        return result
                    }
                }
                return result
            }
            if numstring.last?.lowercased() == "m"{
                let stringWithoutM = numstring.lowercased().components(separatedBy: "m").first
                if let strWitM = stringWithoutM{
                    if strWitM.contains("."){
                        let mArray = strWitM.split(separator: ".")
                        print(mArray)
                        return result
                    }
                }
                
                return result
            }
            if var num = Int(numstring) {
                if num < 100 {
                    let numchar = Array(String(num))
                    for nu in numchar {
                        //result.append()
                        if let _color = colorCodes[nu]{
                            let _c = _color + " "
                            result.append(_c)
                        }
                    }
                    result.append("black gold")
                    return result
                }
                
            }
        }
    }
    return ""
}
//print(encodeResistorColors("10.50M ohms"))


//Problem 1 Daily Code Interview Problem

//Given a list of numbers and a number k, return whether any two numbers from the list add up to k.

//For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.

//Bonus: Can you do this in one pass?

func TwoNumberWhichAddUp(numbers: [Int], number: Int) -> Bool{
    let result = false;
    for num in numbers {
        if let firstSumNum = numbers.first(where: { $0+num == number }) {
            print("The number which add up are  \(firstSumNum). with \(num)")
            return true;
        }
    }
    return result;
}
var numbers = [10, 15, 3, 7];
var k =  17;
TwoNumberWhichAddUp(numbers: numbers, number: k)
