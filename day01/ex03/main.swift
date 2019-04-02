print("""

♤ ♥ ♧ ♦ allCards ♤ ♥ ♧ ♦

""")

for card in Deck.allCards {
	print(card)
}

print("""

♧ ♥ ♦ ♤ Shuffled allCards ♥ ♤ ♦ ♧

""")

var arrShuffled = Deck.allCards
arrShuffled.shuffles_randomly()

for card in arrShuffled {
	print(card)
}