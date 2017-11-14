/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2017C
 Assignment: 1
 Author: Tran Le Nha Tran
 ID: s3533562
 Created date: 08/11/2017
 Acknowledgement: 
 - Youtube: (user input) https://www.youtube.com/watch?v=_DxkuV9mJ0A
 
 */


import Foundation

print("Enter a string: ")

func input() -> String {
    let keyboard = FileHandle.NSfileHandleWithStandardInput()
    let inputData = keyboard.availableData
    return (NSString(data: inputData, encoding: NSUTF8StringEncoding) as! String)
}

var str = input()
var str2 = "the quick brown fox jumps over the lazy dog"


func Pangram_check(str: String) -> Bool {
    
    let (char, alph) = (Set(str.characters), "abcdefghijklmnopqrstuvwxyz".characters)
    return !alph.contains {!char.contains($0)}
}


//func Pangram_check(str: String) -> Bool {
//    //convert all to uppercase
//    let strConvertToUp = response?.uppercased()
//    
//    for char in "ABCDEFGHIJKLMNOPQRSTYVXYZ" {
//        if (find(strConvertToUp, char) == nil) {
//            return false
//        }
//    }
//    return true
//}

var status = Pangram_check(str: str)        //true
status = Pangram_check(str: "test string")   //false


if(status == true){
    print("Pangram")
} else {
    print("Not pangram")
}
