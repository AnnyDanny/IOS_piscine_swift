import Foundation

class Card: NSObject {
    var color : Color
    var value : Value
    override var description : String
    {
        return "\(self.color), \(self.value)"
    }
    init (Color color: Color, Value value: Value) {
        self.color = color
        self.value = value
        super.init()
    }
    override func isEqual(_ object: Any?) -> Bool {
        if let otherCard = object as? Card {
            return self.color == otherCard.color && self.value == otherCard.value
        }
        return false
    }
}

func == (lsh: Card, rsh: Card) -> Bool
{
    return (lsh.color == rsh.color && lsh.value == rsh.value)
}