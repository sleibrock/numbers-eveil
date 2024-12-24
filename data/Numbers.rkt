#lang racket/base

(provide Numbers-list
         TCG-banned-cards
         OCG-banned-cards
         (struct-out NumberCard)
         )

(struct NumberCard (name rank number element type power-rating)
  #:transparent)


; Cards banned in TCG regulated formats
(define TCG-banned-cards
  (list
   "Number 16: Shock Master"                   ; Unlock the shock you cowards!!
   "Number 42: Galaxy Tomahawk"                ; links don't exist right?
   "Number 86: Heroic Champion - Rhongomyniad" ; nobody can summon 5 monsters right?
   "Number 89: Diablosis the Mind Hacker"      ; honorary Kashtira
   "Number 95: Galaxy-Eyes Dark Matter Dragon"
   "Number S0: Utopic Zexal"                   ; who came up with this card?
   ))


; Cards banned in OCG regulated formats
(define OCG-banned-cards
  (list
   "Number 16: Shock Master"
   "Number 86: Heroic Champion - Rhongomyniad"
   "Number 95: Galaxy-Eyes Dark Matter Dragon"
   "Number S0: Utopic Zexal"
   ))


; Literally every Number card in the game!
(define Numbers-list 
  (sort
   (map
    (λ (number-data)
      (begin
        (printf "Rendering ~a ...\n" (car number-data))
        (apply NumberCard number-data)))
    `(; Numeron Gate / Don Thousand monsters
      ("Number 1: Numeron Gate Ekram"                        1   1 light machine 3)
      ("Number 2: Numeron Gate Dve"                          1   2 light machine 3)
      ("Number 3: Numeron Gate Trini"                        1   3 light machine 3)
      ("Number 4: Numeron Gate Catvari"                      1   4 light machine 3)
      ; Fake Numbers created by Don Thousand                 
      ("Number 1: Infection Buzz King"                       8   1 dark fiend 3)
      ("Number 2: Ninja Shadow Mosquito"                     2   2 wind insect 5)
      ("Number 3: Cicada King"                               3   3 wind insect 4)
      ("Number 4: Stealth Kragen"                            4   4 water aqua 5)
      ; Regular Numbers
      ("Number 5: Doom Chimera Dragon"                       5   5 dark dragon 3)
      ("Number 6: Chronomaly Atlandis"                       6   6 light machine 3)
      ("Number 7: Lucky Straight"                            7   7 light fairy 3)
      ("Number 8: Heraldic King Genom-Heritage"              8   4 light psychic 2)
      ("Number 9: Dyson Sphere"                              9   9 light machine 3)
      ("Number 10: Illumiknight"                             4  10 light warrior 2)
      ;("Number 10: Dark Illumiknight"                        4  10 dark warrior 3) ; not released
      ("Number 11: Big Eye"                                  7  11 dark spellcaster 7)
      ("Number 12: Crimson Shadow Armor Ninja"               5  12 earth warrior 1)
      ("Number 13: Embodiment of Crime"                      1  13  dark fiend 2)
      ("Number 14: Greedy Sarameya"                          5  14 dark beast 2)
      ("Number 15: Gimmick Puppet Giant Grinder"             8  15 dark machine 7)
      ("Number 16: Shock Master"                             4  16 light fairy 10)
      ("Number 17: Leviathan Dragon"                         4  17 water dragon 1)
      ("Number 18: Heraldry Patriach"                        4  18 light psychic 2)
      ("Number 19: Freezadon"                                5  19 water dinosaur 1)
      ("Number 20: Giga-Brilliant"                           3  20 light insect 1)
      ("Number 21: Frozen Lady Justice"                      6  21 water aqua 5)
      ("Number 22: Zombiestein"                              8  22 dark zombie 6)
      ("Number 23: Lancelot, Dark Knight of the Underworld"  8  23 dark zombie 7)
      ("Number 24: Dragulas the Vampiric Dragon"             6  24 dark wyrm 6)
      ("Number 25: Force Focus"                              6  25 light machine 4)
      ("Number 26: Spaceway Octobypass"                      3  26 light psychic 3)
      ("Number 27: Dreadnaught Dreadnoid"                    4  27 water machine 6)
      ("Number 28: Titanic Moth"                             7  28 fire insect 3)
      ("Number 29: Mannequin Cat"                            2  29 light beast 5)
      ("Number 30: Acid Golem of Destruction"                3  30 water rock 3)
      ("Number 31: Embodiment of Punishment"                 1  31 dark fiend 2)
      ("Number 32: Shark Drake"                              4  32 water sea-serpent 4)
      ("Number 33: Chronomaly Machu Mech"                    5  33 light machine 5)
      ("Number 34: Terror-Byte"                              3  34 dark machine 2)
      ("Number 35: Ravenous Tarantula"                      10  35 dark insect 8)
      ("Number 36: Chronomaly Chateau Huyuk"                 4  36 light machine 5)
      ("Number 37: Hope Woven Dragon Spider Shark"           4  37 water sea-serpent 6)
      ("Number S37: Spider Shark"                            5  37 water sea-serpent 3)
      ("Number 38: Hope Harbinger Dragon Titanic Galaxy"     8  38 light dragon 10)
      ("Number S38: Titanic Galaxy"                          9  38 light dragon 10)
      ("Number 39: Utopia"                                   4  39 light warrior 7)
      ("Number 39: Utopia Roots"                             1  39 light warrior 2)
      ("Number 39: Utopia Double"                            4  39 light warrior 3)
      ("Number 39: Utopia Rising"                            4  39 light warrior 2)
      ("Number 40: Gimmick Puppet of Strings"                8  40 dark machine 8)
      ("Number 41: Bagooska the Terribly Tired Tapir"        4  41 earth fiend 9)
      ("Number 42: Galaxy Tomahawk"                          7  42 wind machine 10)
      ("Number 43: Manipulator of Souls"                     2  43 dark fiend 4)
      ("Number 44: Sky Pegasus"                              4  44 light beast 2)
      ("Number 45: Crumble Logos the Prophet of Demolition"  2  45 earth zombie 5)
      ("Number 46: Dragluon"                                 8  46  light dragon 3)
      ("Number 47: Nightmare Shark"                          3  47 water sea-serpent 2)
      ("Number 48: Shadow Lich"                              3  48 dark zombie 3)
      ("Number 49: Fortune Tune"                             3  49 light winged-beast 4)
      ("Number 50: Blackship of Corn"                        4  50 dark plant 3)
      ("Number 51: Finisher the Strong Arm"                  3  51 earth rock 1)
      ("Number 52: Diamond Crab King"                        4  52 earth rock 1)
      ("Number 53: Heart-eartH"                              5  53 dark fiend 2)
      ("Number 54: Lion Heart"                               1  54 earth warrior 6)
      ("Number 55: Gogogo Goliath"                           4  55 earth rock 1)
      ("Number 56: Gold Rat"                                 1  56 light beast 2)
      ("Number 57: Tri-Head Dust Dragon"                     4  57 fire dragon 2)
      ("Number 58: Burner Visor"                             4  58 fire pyro 2)
      ("Number 59: Crooked Cook"                             4  59 fire warrior 2)
      ("Number 60: Dugares the Timeless"                     4  60 fire fiend 6)
      ("Number 61: Volcasaurus"                              5  61 fire dinosaur 5)
      ("Number 62: Galaxy-Eyes Prime Photon Dragon"          8  62 light dragon 7)
      ("Number 63: Shamoji Soldier"                          1  63 light fairy 1)
      ("Number 64: Ronin Raccoon Sandayu"                    2  64 earth beast 5)
      ("Number 65: Djinn Buster"                             2  65 dark fiend 5)
      ("Number 66: Master Key Beetle"                        4  66 dark insect 1)
      ("Number 67: Pair-a-Dice Smasher"                      5  67 light fairy 5)
      ("Number 68: Sanaphond the Sky Prison"                 8  68 dark rock 6)
      ("Number 69: Heraldry Crest"                           4  69 light psychic 2)
      ("Number 69: Heraldry Crest - Shatter Stream(?)"       4  69 light psychic 5)
      ("Number 69: Heraldry Crest - Dark Matter Demo(?)"     4  69 light psychic 7)
      ("Number 70: Malevolent Sin"                           4  70 dark insect 5)
      ("Number 71: Rebarian Shark"                           3  71 water dragon 5)
      ("Number 72: Shogi Rook"                               6  72 earth beast-warrior 6)
      ("Number 73: Abyss Splash"                             5  73 water warrior 5)
      ("Number 74: Master of Blades"                         7  74 earth psychic 7)
      ("Number 75: Bamboozling Gossip Shadow"                3  75 wind spellcaster 7)
      ("Number 76: Harmonizer Gradielle"                     7  76 light fairy 7)
      ("Number 77: The Seven Sins"                          12  77 dark fiend 10)
      ("Number 78: Number Archive"                           1  78 light spellcaster 6)
      ("Number 79: Battlin' Boxer Nova Kaiser"               4  79 fire warrior 5)
      ("Number 80: Rhapsody in Berserk"                      4  80 dark fiend 4)
      ("Number 81: Superdreadnought Rail Cannon Super Dora" 10  81 earth machine 6)
      ("Number 82: Heartlandraco"                            4  82 earth dragon 2)
      ("Number 83: Galaxy Queen"                             1  83 dark spellcaster 2)
      ("Number 84: Pain Gainer"                             11  84 dark insect 8)
      ("Number 85: Crazy Box"                                4  85 dark fiend 2)
      ("Number 86: Heroic Champion - Rhongomyniad"           4  86 dark warrior 10)
      ("Number 87: Queen of the Night"                       8  87 water plant 3)
      ("Number 88: Gimmick Puppet of Leo"                    8  88 dark machine 4)
      ("Number 89: Diablosis the Mind Hacker"                7  89 dark psychic 10)
      ("Number 90: Galaxy-Eyes Photon Lord"                  8  90 light warrior 5)
      ("Number 91: Thunder Spark Dragon"                     4  91 light dragon 7)
      ("Number 92: Heart-eartH Dragon"                       9  92 dark dragon 8)
      ("Number 93: Utopia Kaiser"                           12  93 light warrior 8)
      ("Number 94: Crystalzero"                              5  94 water warrior 2)
      ;("Number 95: Galaxy-Eyes Dark Matter Dragon"           9  95 dark dragon 10)
      ("Number 96: Dark Mist"                                2  96 dark fiend 4)
      ("Number 97: Draglubion"                               8  97 dark dragon 8)
      ("Number 98: Antitopian"                               4  98 dark warrior 2)
      ("Number 99: Utopic Dragon"                           10  99 light dragon 8)
      ("Number 99: Utopia Dragonar"                         12  99 light warrior 8)
      ("Number 100: Numeron Dragon"                          1 100 light dragon 8)
      ; Number 10X Barian monsters
      ("Number 101: Silent Honor ARK"                        4 101 water aqua 4)
      ("Number 102: Star Seraph Sentry"                      4 102 light fairy 5)
      ("Number 103: Ragnazero"                               4 103 water fairy 4)
      ("Number 104: Masquerade"                              4 104 light spellcaster 3)
      ("Number 105: Battlin' Boxer Star Cestus"              4 105 fire warrior 3)
      ("Number 106: Giant Hand"                              4 106 earth rock 6)
      ("Number 107: Galaxy-Eyes Tachyon Dragon"              8 107 light dragon 6)
      ; Chaos Numbers
      ("Number C1: Numeron Chaos Gate Sunya"                 2   1 dark machine 5)
      ("Number C5: Chaos Chimera Dragon"                     6   5 dark dragon 3)
      ("Number C6: Chronomaly Chaos Atlandis"                7   6 light machine 3)
      ("Number C9: Chaos Dyson Sphere"                      10   9 light machine 2)
      ("Number C15: Gimmick Puppet Giant Hunter"             9  15 dark machine 6)
      ("Number C32: Shark Drake Veiss"                       4  32 water sea-serpent 2)
      ("Number C39: Utopia Ray"                              4  39 light warrior 1)
      ("Number C39: Utopia Ray V"                            5  39 light warrior 3)
      ("Number C39: Utopia Ray Victory"                      5  39 light warrior 3)
      ("Number C40: Gimmick Puppet of Dark Strings"          9  40 dark machine 5)
      ("Number C43: High Manipulator of Chaos"               3  43 dark fiend 1)
      ("Number C62: Neo Galaxy-Eyes Prime Photon Dragon"     8  62 light dragon 6)
      ("Number C65: King Overfiend"                          3  65 dark fiend 2)
      ("Number C69: Heraldry Crest of Horror"                5  69 light psychic 3)
      ("Number C73: Abyss Supra Splash"                      6  73 water warrior 2)
      ("Number C79: Battlin' Boxer General Kaiser"           5  79 fire warrior 4)
      ("Number C80: Requiem in Berserk"                      5  80 dark fiend 3)
      ("Number C88: Gimmick Puppet Disaster Leo"             9  88 dark machine 6)
      ("Number C92: Heart-eartH Chaos Dragon"               10  92 dark dragon 3)
      ("Number C96: Dark Storm"                              3  96 dark fiend 3)
      ("Number C101: Silent Honor DARK"                      5 101 water aqua 5)
      ("Number C102: Archfiend Seraph"                       5 102 light fairy 3)
      ("Number C103: Ragnafinity"                            5 103 water fairy 4)
      ("Number C104: Umbral Horror Masquerade"               5 104 dark spellcaster 3)
      ("Number C105: Battlin' Boxer Comet Cestus"            5 105 fire warrior 3)
      ("Number C106: Giant Red Hand"                         5 106 earth rock 7)
      ("Number C107: Neo Galaxy-Eyes Tachyon Dragon"         9 107 light dragon 5)
      ;("Number C1000: Numeronious"                         12 1000 light fiend 5)
      ;("Number iC1000: Numerounius Numerounia"             13 1000 light fiend 5)
      ; Shining Numbers
      ("Number S0: Utopic Zexal"                             1   0 light warrior 10)
      ("Number S39: Utopia Prime"                            4  39 light warrior 5)
      ("Number S39: Utopia the Lightning"                    5  39 light warrior 7)
      ; Future Numbers
      ("Number F0: Utopic Future"                            1   0 light warrior 5)
      ("Number F0: Utopic Draco Future"                      1   0 light warrior 8)
      ("Number F0: Utopic Future Slash"                      1   0 light warrior 3)
      ; Other stuff
      ;("Number XX: Utopic Dark Infinity" 12 0 dark warrior 3) ; no actual number
      ))
   >
   #:key NumberCard-number
   ))
  

(module+ test
  (require rackunit)
  (test-case "Check if we have a valid length of Number cards"
    (printf "Done\n")))

; end Numbers.rkt
