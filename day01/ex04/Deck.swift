import Foundation

class Deck : NSObject {
    static let allSpades : [Card] = Value.allValues.map({Card(Color:Color.spades, Value:$0)})
    static let allDiamonds : [Card] = Value.allValues.map({Card(Color:Color.diamonds, Value:$0)})
    static let allHearts : [Card] = Value.allValues.map({Card(Color:Color.hearts, Value:$0)})
    static let allClubs : [Card] = Value.allValues.map({Card(Color:Color.clubs, Value:$0)})
    static let allCards : [Card] = allSpades + allDiamonds + allHearts + allClubs

    var cards : [Card] = allCards
    var disards : [Card] = []
    var outs : [Card] = []

     init(ifSorted : Bool) {
      if ifSorted {
        cards.shuffles_randomly()
        }
    }

    override var description: String {
        return cards.description
    }

    func draw () -> Card? {
         if (cards.count > 0){
            outs.append(cards[0])
             return cards.remove(at: 0)
        }
        return nil
    }

    func fold(c: Card) {
        if outs.contains(c) {
            disards.append(c)
            if let toRemoveIndex = outs.index(of: c){
                outs.remove(at: toRemoveIndex)
            }
         }
    }
}


extension Array {
    mutating func shuffles_randomly(){
        var length : Int = 0
        var arr = self
        for _ in arr {
            length += 1
        }
        var new : UInt32 = 0
        var numb = [Int](repeating : -1, count : length)
        let count = 0..<length
        func ifPresent(toCheck : UInt32) -> Bool {
            for n in numb {
                if toCheck == n {
                    return false
                }
            }
            return true
    }
    var result = false
    for i in count {
        repeat {
            new = arc4random_uniform(UInt32(length))
            if (ifPresent(toCheck: new)) {
                result = true
            }
            }
            while (!result)
            arr[Int(new)] = self[i]
            numb[i] = Int(new)
        }
        self = arr
    }
}
