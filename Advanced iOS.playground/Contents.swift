import UIKit

var url = URL(string: "https://www.google.com")!

// long way
//if let str = try? String(contentsOf: url){
//    print(str)
//}else {
//    print("default content")
//}

// Simple way

var str = (try? String(contentsOf: url)) ?? "default content!"

// Conditional try is considered as advanced in Swift
// try? returns an optional, if the try fails it returns nil.

var localUrl = URL(string: "https://www.google.com")!
var remoteUrl = URL(string: "https://twitter.com")!

func loadSavedData() -> String {
    
    if let savedContent = try? String(contentsOf: localUrl){
        return savedContent
    }
    if let savedContent = try? String(contentsOf: remoteUrl){
        return savedContent
    }
    
    return "default content!"
}
//You can name for loops and break from any loop based on the condition.
// You can name a do block and break from it when something fails like below.

struct SavedData: Codable{
    // properties
}

func reloadUI(){
    print("Reloading!")
}

// If you place anything inside the defer, it will get called no matter at what point it exits the do block, a very useful one.

LoadFromJson: do {
    
    defer {
        reloadUI()
    }
    let decoder = JSONDecoder()
    
    guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else { break LoadFromJson}
    
    guard let contents = try? Data(contentsOf: url) else { break LoadFromJson}
    
    guard let data = try? decoder.decode(SavedData.self, from: contents)else{ break LoadFromJson}
    
}


// Key value observer

let vw = UIView()

vw.observe(\.isHidden, options: .new){ view, change in
    print(change.newValue)
    
}

vw.isHidden = true
vw.isHidden = false
vw.isHidden = true

// You can access the location of the user without actually requesting the location by below
// Read Locale

extension UIDevice{
    static var countryCode: String?{
        return (Locale.current as NSLocale).object(forKey: NSLocale.Key.countryCode) as? String
    }
}

// You can verify the spellings using UITextChecker.

extension String{
    var isSpelledCorrectly: Bool{
        
        let textChecker = UITextChecker()
        let range = NSRange(location: 0, length: self.utf16.count)

        let misSpelledRange = textChecker.rangeOfMisspelledWord(in: self, range: range, startingAt: 0, wrap: false, language: Locale.preferredLanguages.first ?? "en")

        return misSpelledRange.length == 0
    }
}

"Hey, how arey you".isSpelledCorrectly

// You can know the language of the string by below

NSLinguisticTagger.dominantLanguage(for: "Hey How are you?")

// You do the wording of a number by below

let formatter = NumberFormatter()

formatter.numberStyle = .spellOut

let str1 = formatter.string(from: 100)
print(str1)


// You can create diff colors by doing below
var colors = [UIColor]()

for i in stride(from: 0, to: 0.9, by: 0.1){
    colors.append(UIColor(hue: 0, saturation: CGFloat(i), brightness: 0.8, alpha: 1))
    
}

print(colors)

// One liners you wanna know

// when there is a text field, tableView and keyboard on the app, if you wanna dismiss everything, you have a method below

var view = UIView()
view.endEditing(true) // this ends everyhting suddenly

view.endEditing(false) // this asks textfield permission to quit.

// You can ask user to review the app by doing below

import StoreKit
// kinkn

SKStoreReviewController.requestReview()
// Exp5
