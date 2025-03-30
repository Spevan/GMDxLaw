EXTERNAL ChangeName(charName)
EXTERNAL AddChar(charName)
EXTERNAL ChangeEmote(charName, emotion)
EXTERNAL RemoveChar(charName)
EXTERNAL GetName()
EXTERNAL ChangeFavorability(num)
EXTERNAL ToggleTextBox(lockTB)

{ChangeName("")}
(The BAILIFF enters the courtroom. Everyone goes silent and stands.)

{ChangeName("BAILIFF")}
“All rise for the honorable Judge McWheily.”

{ChangeName("")}
(The judge enters. Bangs the gavel. Everyone sits.)

{ChangeName("JUDGE")}
"Court is now in session. We are here for the case of CJ Whalen vs. On-Deck, Inc. Prosecution, are you ready?"

{ChangeName("{GetName()}")}
"Y-yes, Your Honor."

{ChangeName("Mr. Richards")}
{AddChar("RICHARDS")}
(Richards leans over to whisper.) "Don’t be intimidated by the judge or Berg… We got this."

{ChangeName("JUDGE")}
"And is the defense ready?"

{ChangeName("Mr. Berg")}
{ChangeEmote("BERG", "neutral")}
"Why, of course, Your Honor. Though I must say, I question the necessity of this trial."
"My client, On-Deck, Inc., is a reputable company! The prosecution will need more than a sob story to prove liability."

{ChangeName("JUDGE")}
“Mr. Berg, please save your comments for the opening statement. Prosecution, you may proceed with your opening statement.”

{ChangeName("{GetName()}")}
"Good morning, ladies and gentlemen of the jury. My name is {GetName()} and I am from the law firm BB&H."
"Seated next to me is my counsel table with me is Richard Herrman and together we represent CJ Whalen."
"Mr. Whalen brought the suit because he was injured by a product."
"It is his position that the product was defective, and that he was injured as a direct result of that defect."

{ChangeName("")}
Which type of lawsuit would this case fall under?

{ToggleTextBox(false)}
+“The lawsuit which we shall be involved in today is a product liability action.”
{ChangeName("{GetName()}")}
->ProductLiability
+“The lawsuit which we shall be involved in today is a personal injury action.”
+“The lawsuit which we shall be involved in today is a negligence action.”
{ChangeName("{GetName()}")}
->PersonalInjuryOrNegligence

=== PersonalInjuryOrNegligence ===
{ToggleTextBox(true)}
{ChangeFavorability(1)}
{ChangeName("Mr. Richards")}
“While that is technically correct, the specific suit we are here to present is for product liability."
->CivilOrCriminal

=== ProductLiability ===
{ChangeFavorability(3)}
->CivilOrCriminal 

=== CivilOrCriminal ===
{ChangeName("")}
Is this a civil or criminal case?
{ToggleTextBox(false)}
+“This is a criminal matter that should be taken seriously.”
{ChangeName("{GetName()}")}
->Criminal
+“This is a civil case, not a criminal one. Keep that in mind as we continue.”
{ChangeName("{GetName()}")}
->Civil

=== Criminal ===
{ToggleTextBox(false)}
{ChangeFavorability(-3)}
{ChangeName("JUDGE")}
"___, this is not a criminal case. The government has not pressed any charges against the defense. Please, keep this in mind as you continue.”

{ChangeName("{GetName()}")}
“Y-yes, your honor.”
->END

=== Civil ===
{ToggleTextBox(false)}
{ChangeFavorability(3)}
{ChangeName("{GetName()}")}
“This is a civil case, not a criminal one. Keep that in mind as we continue.”
->END