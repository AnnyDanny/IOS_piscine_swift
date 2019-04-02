print("""
Card1

""")

let card1 : Card = Card(Color: Color.hearts, Value: Value.king)

print(card1)


print("""

Card2

""")

let card2 : Card = Card(Color: Color.hearts, Value: Value.queen)

print(card2)


print("""

Card3

""")

let card3 : Card = Card(Color: Color.hearts, Value: Value.king)


print(card3)


print("""

Comparison with ==

""")

if (card1.isEqual(to: card2)) {
	print("card1 and card2 is equal")
}
else {
	print("card1 and card2 is not equal")
}

if (card1.isEqual(to: card3)) {
	print("card1 and card3 is equal")
}
else {
	print("card1 and card3 is not equal")
}

if (card2.isEqual(to: card3)) {
	print("card2 and card3 is equal")
}
else {
	print("card2 and card3 is not equal")
}


print("""

Create new class

""")

let newClass = card1
print(newClass)


