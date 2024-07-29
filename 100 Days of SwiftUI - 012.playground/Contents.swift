import Cocoa

// Day 12, Checkpoint 7 – classes
// Make a class hierarchy for animals, starting with Animal with 'legs' property.
// Add subclass Dog, giving it a speak() method that prints a dog barking string.
// Make Corgi and Poodle subclasses of Dog
// Make Cat an Animal subclass. Add a speak() method and an isTame Bool, set with an init.
// Make Persian and Lion as subclasses of Cat.

// First way I tackled this was with "iSay" in Dog and Cat, passed up from each subclass

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    var iSay: String
    func speak() {
        print("I say \(iSay)")
    }
    init(iSay: String) {
        self.iSay = iSay
        super.init(legs: 4)
    }
}

class Cat: Animal {
    var iSay: String
    var isTame: Bool
    func speak() {
        var tameness: String
        if isTame {
            tameness = "I'm tame"
        } else {
            tameness = "I'm not tame"
        }
        print("I say \(iSay) because \(tameness).")
    }
    init(iSay: String, isTame: Bool) {
        self.iSay = iSay
        self.isTame = isTame
        super.init(legs: 4)
    }
}

class Corgi: Dog {
    var bark = "BarkBarkBark!"
    init() {
        super.init(iSay: bark)
    }
}

class Poodle: Dog {
    var bark = "Poooooooo!"
    init() {
        super.init(iSay: bark)
    }
}

class Persian: Cat {
    var vocalisation = "Meow!"
    init() {
        super.init(iSay: vocalisation, isTame: true)
    }
}
class Lion: Cat {
    var vocalisation = "ROWR!"
    init() {
        super.init(iSay: vocalisation, isTame: false)
    }
}

let myCorgi = Corgi()
myCorgi.speak()
let myPoodle = Poodle()
myPoodle.speak()
let myPersian = Persian()
myPersian.speak()
let myLion = Lion()
myLion.speak()

// Second way (and Paul's preferred way?) is to use 'override' so subclasses simply override the speak() method of their parent class.
print()
print("And now, using 'override'...")
print()

class BetterDog: Animal {
    func speak() {
        print("I say GenericWoof!")
    }
    init() {
        super.init(legs: 4)
    }
}

class BetterCorgi: BetterDog {
    override func speak() {
        print("I say CorgiWoof!")
    }
    override init() { // Don't understand why I need "override" in front of init() here
        super.init()
    }
}
let myBetterCorgi = BetterCorgi()
myBetterCorgi.speak()

class BetterCat: Animal {
    var isTame: Bool
    func speak() {
        var tameness: String
        if isTame {
            tameness = "I'm tame"
        } else {
            tameness = "I'm not tame"
        }
        print("I say GenericMeow because \(tameness).")
    }
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}
class BetterPersian: BetterCat {
    init() {
        super.init(isTame: true) // This isTame is being passed up to the parent class...
    }
    override func speak() {
        var tameness: String
        if isTame {  // ...and it's still readable here because it exists in the parent?
            tameness = "I'm so very tame"
        } else {
            tameness = "I'm so very not tame"
        }
        print("I say PersianMeow because \(tameness).")
    }
}
let myBetterPersian = BetterPersian()
myBetterPersian.speak()
