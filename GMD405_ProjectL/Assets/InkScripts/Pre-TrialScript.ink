EXTERNAL ChangeName(charName)
EXTERNAL AddChar(charName)
EXTERNAL ChangeEmote(charName, emotion)
EXTERNAL RemoveChar(charName)

{ChangeName("")}
(The day of the trial...)
(The door swings open and in front of you is the courtroom where justice will be decided upon today. A man from the defense side stands and turns towards you.)

{ChangeName("Bespectacled Man")}
{AddChar("BERG")}
{ChangeEmote("BERG", "pout")}
"Hmph! I see the prosecution has finally decided to grace us with their presence."

{ChangeName("___")}
“Good morning. Who are you?”

{ChangeName("Bespectacled Man")}
{ChangeEmote("BERG", "angry")}
“Who am I? Who are you that you think you can just show up suddenly and take over this case that I have been working diligently on for months!”

{ChangeName("Mr. Richards")}
{AddChar("RICHARDS")}
{ChangeEmote("RICHARDS", "neutral")}
“Mr. Berg, please treat this courtroom and my assistant with the decorum they both deserve and stop shouting.”

{ChangeName("Mr. Berg")}
{ChangeEmote("BERG", "neutral")}
“Assistant, huh? I see. Getting too old to keep up, Herrmann?”

{ChangeName("")}
(Berg cracks a cheeky smile and turns back towards his desk to sit.)

{ChangeName("Mr. Richards")}
{ChangeEmote("RICHARDS", "neutral")}
“Ignore him, ___. He will do his best to get under your skin but he’s just jealous that you ended up with this case because we fired him.”

{ChangeName("Mr. Berg")}
“Unjustly fired, I might add!”

{ChangeName("Mr. Richards")}
(Mr. Richards puts his head in his palm and sighs.)
“At any rate, we should take our seats. The judge should be here soon.”

-> END