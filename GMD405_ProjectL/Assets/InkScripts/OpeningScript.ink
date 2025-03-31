EXTERNAL ChangeName(charName)
EXTERNAL AddChar(charName, emotion)
EXTERNAL ChangeEmote(charName, emotion)
EXTERNAL RemoveChar(charName)
EXTERNAL ChangeScene(sceneName)
EXTERNAL ToggleNameInput()
EXTERNAL GetName()

{AddChar("Verdict", "Neutral")}
{ChangeName("")}
The sound of a door opening and closing is heard in the darkness.
A man with slicked back grey hair and a bushy brown beard approaches and introduces himself.

{AddChar("Richards", "Neutral")}
{ChangeName("GRIZZLED MAN")}
“Good morning! I’m Mr Richards, the attorney from BB&H representing Mr. Whalen."

{ChangeName("Mr. Richards")}
"I am here to meet my understudy for the trial today. Might that be you?”

{ChangeEmote("Verdict", "Thinking")}
{ChangeName("Me")}
* *"Yes, that's me." -> ThatsMe
* *"Nope, not me" -> NotMe

=== ThatsMe ===
{ChangeEmote("Verdict", "Neutral")}
{ChangeName("Mr. Richards")}
{ChangeEmote("Richards", "Happy")}
"Ah then you're exactly who I'm looking for!"
-> Name

=== NotMe ===
{ChangeName("Mr. Richards")}
{ChangeEmote("Richards", "Embarrassed")}
"Oh! My apologies, you seemed so professional I- wait a minute..."
"Ah! It is you! I would know that BB&H name tag anywhere. Although, I can barely read it."
-> Name

=== Name ===
{ToggleNameInput()}
"What's your name?"
{ChangeName("Mr. Richards")}
{ChangeEmote("Richards", "Happy")}
"Nice to meet you {GetName()}. Today we’re going to start you off with a simple jury selection process." 
"We have questioned a pool of 30 jurors in order to see who matches the best qualifications for an ideal jury pool."
"I need you to limit that group of 30 people down to just 12. It’s a simple process. Here, I will walk you through it.”
{ChangeScene("sce_jurorSelect")}
-> END