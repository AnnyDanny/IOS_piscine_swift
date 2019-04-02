print("new Deck with shiffled card")

var newDeck = Deck(ifSorted : true)

print(newDeck)

if newDeck.draw() != nil {
  print("func draw called")
  for card in newDeck.outs {
      print(card)
    }
}
else {
  print("Nothing to draw")
}


print("first card was removed from cards")

for card in newDeck.cards{
	print(card)
}


print("fold func with incorrect cards:")

newDeck.fold(c : newDeck.cards[0])
for card in newDeck.disards {
	print(card)
}

print("disards empty")

print("fold func with correct cards")
print("disards contain:")

newDeck.fold(c : newDeck.outs[0])
for card in newDeck.disards {
	print(card)
}

print("outs empty")

for card in newDeck.outs {
	print(card)
}
