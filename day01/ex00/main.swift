import Foundation

var arrValue : [Value] = Value.allValues
var arrColor : [Color] = Color.allColors

for elem in arrValue {
	print("\(elem) = \(elem.rawValue)")
}

for elem in arrColor {
	print(elem)
}
