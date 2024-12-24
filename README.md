# Numbers Eveil

Numbers Evil is a [Yu-Gi-Oh! Trading Card Game](https://www.yugioh-card.com/en/) spell card with an interesting mathematical formula behind it. I don't see a whole lot of coverage about Numbers Eveil and what it does, so this repo is dedicated to "solving" Numbers Eveil.

Numbers Eveil's description reads as the following:

```
If your opponent controls a monster(s) Special Summoned from the Extra Deck and you do not: Choose 4 "Number" Xyz Monsters from your Extra Deck with different Ranks, plus a 5th "Number" Xyz Monster whose "Number" value in its name equals the combined "Number" values of the 4 other monsters, Special Summon that 5th "Number" monster (this is treated as an Xyz Summon), and attach the 4 chosen monsters to it as material, but you cannot Special Summon monsters, except "Number" Xyz Monsters, while you control that face-up monster.
```

The interesting thing to note is the selection process for the monsters here. We must pick four "Number" monsters, who all have a numerical value associated with them, and then a fifth "Number" monster, who is the sum of all four ones selected. The formula is essentially:

```
E = A + B + C + D
```

Where A through D represent our four monsters picked, and E represents the fith and final one whose value is the sum of all four. The distinction is that they all have to be unique with no shared "rank" (the level of the card in Yu-Gi-Oh! terms). The processing here is difficult to fathom, because there are *a lot* of permutations of "Number" monsters.

For Yu-Gi-Oh! players, we only care about strong cards, and therefore, each "Number" monster has a relative power level to how strong it is in the metagame, and the metagame shifts around quite a bit. For Xyz monsters specifically, they all have various effects with different meanings for how they are best utilized. Therefore, this project aims to look for the "best" monster to summon from Numbers Eveil.

On a rating of 1 to 10 for how powerful a card is, 10 being extremely powerful, and 1 being not-so-powerful, I want to create a list of combinations for Numbers Eveil with ratings for each result possible.

For this, we will iterate over all known "Number" monsters, and look for each and every possible solution to that formula. This is an intense computation of [discrete combination](https://en.wikipedia.org/wiki/Combination) and as such requires a bit of engineering in order to not overwhelm a computer's memory bank.

## Other Restrictions

Yu-Gi-Oh! official paper play follows two banlists, depending on where you live. This program will contain two ban lists updated (in)frequently to support both lists. Ban lists are used by default when running this program, and defaults to TCG banlist. To follow the OCG banlist, use `--ocg`. To have *no* banlists, use the `--no-banlist` flag instead. (Note: they differ *very* little)
