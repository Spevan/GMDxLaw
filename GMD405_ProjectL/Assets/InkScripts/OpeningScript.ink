EXTERNAL ChangeName(charName)
EXTERNAL AddChar(charName)
EXTERNAL ChangeEmote(charName, emotion)
EXTERNAL RemoveChar(charName)


{ChangeName("")}
The sound of a door opening and closing is heard in the darkness.
Footsteps approach the player as the room lightens up and the background is now the lobby of a courthouse.
A man with slicked back grey hair and a bushy brown beard approaches and introduces himself.

{AddChar("Whalen")}
{ChangeEmote("Richards", "Neutral")}
{ChangeName("GRIZZLED MAN")}
“Good morning! I’m Mr Richards, the attorney from BB&H representing Mr. Whalen."

{ChangeName("Mr. Richards")}
"I am here to meet my understudy for the trial today. Might that be you?”

{ChangeName("Me")}
+"Yes, that's me."
-> ThatsMe
+"Nope, not me"
-> NotMe

=== ThatsMe ===
{ChangeName("Mr. Richards")}
{ChangeEmote("Richards", "Happy")}
"Ah then you're exactly who I'm looking for! What's your name?"
-> Name

=== NotMe ===
{ChangeName("Mr. Richards")}
{ChangeEmote("Richards", "Embarrassed")}
"Oh! My apologies, you seemed so professional I- wait a minute..."
"Ah! It is you! I would know that BB&H name tag anywhere. Although, I can barely read it. What's your name?"
-> Name

=== Name ===
//Player selects a name
{ChangeName("Mr. Richards")}
{ChangeEmote("Richards", "Happy")}
"Nice to meet you ___. Today we’re going to start you off with a simple jury selection process." 
"We have questioned a pool of 30 jurors in order to see who matches the best qualifications for an ideal jury pool."
"I need you to limit that group of 30 people down to just 12. It’s a simple process. Here, I will walk you through it.”
-> END