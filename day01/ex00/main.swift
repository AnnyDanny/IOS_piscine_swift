print("""
All colors in array

""")

var arrColor : [Color] = Color.allColors

for elem in arrColor {
	print(elem)
}



print("""

All values in array

""")

var arrValue : [Value] = Value.allValues

for elem in arrValue {
	print("\(elem) = \(elem.rawValue)")
}




print("""

Color and value values in enum

""")

let enumValue = Value.queen

print(enumValue)

let enumColor = Color.hearts

print(enumColor)