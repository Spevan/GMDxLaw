EXTERNAL ChangeName(charName)
EXTERNAL AddChar(charName, emotion)
EXTERNAL ChangeEmote(charName, emotion)
EXTERNAL RemoveChar(charName)
EXTERNAL GetName()
EXTERNAL ChangeFavorability(num)
EXTERNAL ToggleTextBox(lockTB)
EXTERNAL PlaySFX(clipName)
EXTERNAL ChangeScene(sceneName)

{AddChar("Judge", "Neutral")}
{ChangeName("Judge")}
“Order! The jury have completed their deliberation and reached a verdict. In the case of CJ WHALEN v. On-Deck Inc. the jury find the defendant..."

"Guilty!"

"The jury finds that On-Deck Inc. owes Mr. Whalen a collective fund of $150,000."
"You have 90 days to arrange payment to Mr. Whalen with the courts. Court dismissed."
{ChangeScene("sce_credits")}

->END