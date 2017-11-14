/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2017C
 Assignment: 1
 Author: Tran Le Nha Tran
 ID: s3533562
 Created date: 08/11/2017
 Acknowledgement:
 - Stackoverflow: https://stackoverflow.com/questions/27624331/unique-values-of-array-in-swift (Set() function)
 https://stackoverflow.com/questions/24102024/how-to-check-if-an-element-is-in-an-array (contains() function)
 https://stackoverflow.com/questions/24004776/input-from-the-keyboard-in-command-line-application (user input from Command Line)
 - TutorialPoin: https://www.tutorialspoint.com/swift/swift_closures.htm (closures)
 
 */
import Foundation

//"!" is used to force unwrapping/wrapping optionals
//unwrapping means "no intialization" -> ex: user input

func Pangram_check(str: String) -> Bool {
    //closure let(char, alp) -> capture values
    //Set() function -> lets you store unique values (each char) and remove if char repeated
    let (char, alp) = (Set(str.characters), "abcdefghijklmnopqrstuvwxyz".characters)
    
    //contains(condition, value) true ? false
    let status = !alp.contains {!char.contains($0)}
    
    return status
}

while(true) {
    print("Enter a string: ", terminator: " ")

    //parse user input to input_str
    let input_str = readLine()

    //check if user input "-1"
    if(input_str != "-1") {
        var status = Pangram_check(input_str!)          //bool
        
        if(status == true){
            print("Yes, that string is a pangram.")
        } else {
            print("No, that string is not a pangram.")
        }
    } else {
        exit(0)                 //exit code when type "-1"
    }
}
