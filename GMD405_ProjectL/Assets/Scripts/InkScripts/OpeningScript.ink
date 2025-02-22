EXTERNAL Name(charName)


{Name("Wright")}
The sound of a door opening and closing is heard in the darkness.
Footsteps approach the player as the room lightens up and the background is now the lobby of a courthouse.

A man with slicked back grey hair and a bushy brown beard approaches and introduces himself.

{Name("GRIZZLED MAN")}
“Good morning! I’m Mr Richards, the attorney from BB&H representing Mr. Whalen."
"I am here to meet my understudy for the trial today. Might that be you?”
+"Yes, that's me."
{Name("Me")}
-> ThatsMe
+"Nope, not me"
{Name("Me")}
-> NotMe

=== ThatsMe ===
{Name("Mr. Richards")}
"Ah then you're exactly who I'm looking for! What's your name?"
-> Name

=== NotMe ===
{Name("Mr. Richards")}
"Oh! My apologies, you seemed so professional I- wait a minute..."
"Ah! It is you! I would know that BB&H name tag anywhere. Although, I can barely read it. What's your name?"
-> Name

=== Name ===
//Player selects a name
{Name("Mr. Richards")}
"Nice to meet you ___. Today we’re going to start you off with a simple jury selection process." 
"We have questioned a pool of 30 jurors in order to see who matches the best qualifications for an ideal jury pool."
"I need you to limit that group of 30 people down to just 12. It’s a simple process. Here, I will walk you through it.”
-> END