import UIKit




class Animal {
    var brain: Bool
    var legs: Int

    init(brain: Bool = true, legs: Int = 0) {
        self.brain = brain
        self.legs = legs
    }
}
//var animal = Animal(brain: false, legs: 6)
var animal = Animal()
animal.brain
animal.brain = true
animal.brain
animal.legs

class Human: Animal {
    var lang : String

    
//    override var legs: Int {
//        get {
//            return super.legs
//        }
//        set {
//            super.legs = newValue + 2 //다리 두개 늘리고 싶을때, 연산하고 싶을때 get,set 씀.
//        }
//    }

    init(brain: Bool = true, legs: Int = 2, lang: String = "korean") {
        self.lang = lang
        super.init(brain: brain, legs: legs)
    }
}
var human = Human()
human.legs
human.legs = 4
human.legs


class Pet: Animal{
   var fleas: Int

    init(legs: Int = 4, fleas:Int = 0) {
        self.fleas = fleas
       super.init(legs: legs)
    }
}
var myPet = Pet()
myPet.fleas
myPet.legs

class Dog : Pet {

      init(fleas: Int = 8) {
          super.init(fleas: fleas)
      }
  }

  class Cat: Pet {
      init(fleas: Int = 4) {
          super.init(fleas: fleas)
      }
  }


  //var animal = Animal(brain: false, legs: 6)
//  var animal = Animal()
//  animal.brain
//  animal.brain = true
//  animal.brain
//  animal.legs
//
//
//  var human = Human()
//  human.legs
//  human.legs = 4
//  human.legs


  var pet = Pet()
  pet.brain
  pet.fleas
  pet.legs


  var dog = Dog()
  dog.brain
  dog.fleas
  dog.legs


  var cat = Cat()
  cat.brain
  cat.fleas
  cat.legs
