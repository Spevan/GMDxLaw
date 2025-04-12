EXTERNAL ChangeName(charName)
EXTERNAL AddChar(charName, emotion)
EXTERNAL ChangeEmote(charName, emotion)
EXTERNAL RemoveChar(charName)
EXTERNAL GetName()
EXTERNAL ChangeFavorability(num)
EXTERNAL ToggleTextBox(lockTB)

{AddChar("Verdict", "Neutral")}
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
{AddChar("Richards", "Neutral")}
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
->ProductLiability
+“The lawsuit which we shall be involved in today is a personal injury action.”
+“The lawsuit which we shall be involved in today is a negligence action.”
->PersonalInjuryOrNegligence

=== PersonalInjuryOrNegligence ===
{ChangeFavorability(1)}
{ToggleTextBox(true)}
{ChangeName("Mr. Richards")}
“While that is technically correct, the specific suit we are here to present is for product liability."
->CivilOrCriminal

=== ProductLiability ===
{ChangeFavorability(3)}
{ToggleTextBox(true)}
->CivilOrCriminal 

=== CivilOrCriminal ===
{ChangeName("")}
Is this a civil or criminal case?
{ToggleTextBox(false)}
+“This is a criminal matter that should be taken seriously.”
->Criminal
+“This is a civil case, not a criminal one. Keep that in mind as we continue.”
->Civil

=== Criminal ===
{ToggleTextBox(false)}
{ChangeFavorability(-3)}
{ChangeName("JUDGE")}
"___, this is not a criminal case. The government has not pressed any charges against the defense. Please, keep this in mind as you continue.”

{ChangeName("{GetName()}")}
“Y-yes, your honor.”
->BatWeight

=== Civil ===
{ToggleTextBox(false)}
{ChangeFavorability(3)}
{ChangeName("{GetName()}")}
“This is a civil case, not a criminal one. Keep that in mind as we continue.”
->BatWeight

=== BatWeight ===
{ChangeName("RICHARDS")}
“The product with which we are concerned today is called a bat-weight."
"The purpose is to increase the power of the batter’s swing so that the ball will go further when struck with said bat."
"The bat-weight weighs between one and two pounds and is intended to slide over the top of the bat and down the shaft in order to sit securely on top of it.”

{ChangeName("{GetName()}")}
“Supposedly, the batter can then take practice swings and thus build up the power and speed of his swing."
"This should have been the case on the afternoon of May 20, 1980. However, on that day, what took place instead would affect Mr. Whalen for the rest of his life."
"Moments before the incident, the weight was secured as it always had been.”

{ChangeName("")}
"What should I say next?"
{ToggleTextBox(false)}
+“Instead of sitting snug on the bat, the weight came loose and smacked Mr. Whalen in the face.”
->Closing
+“Suddenly, during routine on-deck practice swings, the weight flew off like a guided missile and struck Mr. Whalen, injuring him severely.”
{ChangeFavorability(3)}
->Closing
+“Mr. Whalen stood at the dugout, just behind the on-deck batter who’s weight came off and hit him.”
{ChangeFavorability(-3)}
->Hit

=== Hit ===
{ChangeName("RICHARDS")}
(whispering) “Try a more passive tone of voice and more emotional language next time.”
->Closing

=== Closing ===
{ChangeName("{GetName()}")}
“You will discover that Mr. Whalen’s injuries were life-threatening and have cost him severely."
"That is what Mr. Whalen is here for: compensation for the terrible wrong that has been done to him."
"You will meet him momentarily.”

{ChangeName("RICHARDS")}
“However, now it is time for the other attorney’s to address you. All that we ask is that you listen with both your ears and your heart."
"Listen for the truth and be fair. Thank you.”

{RemoveChar("Richards")}
{RemoveChar("Verdict")}

{ChangeName("JUDGE")}
“Thank you prosecution, you may rest. Defense, please proceed with your opening statement.”

{ChangeName("BERG")}
"Ladies and gentlemen of the jury, I come today not to represent just On-Deck Inc. but Mr. Miranda himself, the maker of these weights."
"Mr. Miranda grew up in New York, not far from here, where he would frequent the local ball games all his life."
"He even would bring his young son there to teach him how to play."
"Needless to say, Mr. Miranda has a love for the game that put him in positions where he had the opportunity to pitch ideas that could support the major leagues."
"One day, after practicing with his son he had the bright idea to create a bat weight that went over the baseball bat, rather than the bat weights of old which would have to be drilled into or taped onto the bat."
"He pitched his idea to the coach of the New York Yankees and that landed him in the position he is in today."
"That was fifteen years ago. In the first ten of those fifteen years, Mr. Miranda sold millions of bat weights without incident to various baseball teams across the country."
"Only within the past five years did softball players begin using these weights for practice, which is where issues arose."
"You see, these weights were and always have been made with the standard hardball bats in mind, not the lighter and smaller softball bats."
"Not only was Mr. Whalen’s team using the incorrect baseball bats for this weight type, they also applied said weight incorrectly."
"During application of the bat weight, the smaller of the two ends of the ring is meant to slide down onto the bat."
"However, in this case the weight was applied upside-down. Whether this weight was applied to the proper hardball bat or not, it would not have stayed in place due in part to the incorrect application of the weight."
"Clearly either the retailer did not warn Mr. Whalen and his team of the necessary safety precautions or Mr. Whalen and his team were completely ignorant to them."
"Either way, the idea that On-Deck Inc. or Mr. Miranda could be responsible for this one-in-a-million type of incident is ridiculous."
"I am sure that the jury today will listen to the evidence and rule in fairness, as it is your sworn duty to do so. Thank you for your time."

{ChangeName("JUDGE")}
"(Judge nods, turning to the prosecution.) Very well. Prosecution, call your first witness."

{ChangeName("{GetName()}")}
“Prosecution calls CJ Whalen to the stand.”
(CJ enters, his face still swollen from the injury.)
"State your name and occupation."

{ChangeName("WHALEN")}
"My name’s CJ Whalen. I’m a police officer. Or, well, I was before this happened, now I just answer their phone calls."

{ChangeName("{GetName()}")}
“As I understand it, you were struck in the face by a baseball bat weight on May 20th, 1980. Is that correct?”

{ChangeName("WHALEN")}
“That’s correct.”

{ToggleTextBox(false)}
+“Where on your face were you struck?”
->Struck
+"Mr. Whalen, can you describe what happened on the day of the injury?"
->Injury

=== Struck ===
{ToggleTextBox(false)}
{ChangeName("WHALEN")}
“As you can see from my face, it struck me hard on the left side from above the eye all the way down to my jaw.”

{ToggleTextBox(false)}
+“What problems do you have presently that relate to your injury thus far?”
->Problems
+“Are you under any restrictions presently with your doctors because of your condition?”
->Restrictions
+“You said you detect an increase in the sensation of feeling returning to your face, yes?” //Appears after the first question has been answered.
->Feeling

=== Injury ===
->END