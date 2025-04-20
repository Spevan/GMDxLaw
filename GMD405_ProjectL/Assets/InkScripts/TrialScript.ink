EXTERNAL ChangeName(charName)
EXTERNAL AddChar(charName, emotion)
EXTERNAL ChangeEmote(charName, emotion)
EXTERNAL RemoveChar(charName)
EXTERNAL GetName()
EXTERNAL ChangeFavorability(num)
EXTERNAL ToggleTextBox(lockTB)
EXTERNAL PlaySFX(clipName)

{AddChar("Verdict", "Neutral")}
{ChangeName("")}
(The BAILIFF enters the courtroom. Everyone goes silent and stands.)

{ChangeName("BAILIFF")}
“All rise for the honorable Judge McWheily.”

{ChangeName("")}
{PlaySFX("DoubleGavel")}
(The judge enters. Bangs the gavel. Everyone sits.)

{AddChar("Judge", "Neutral")}
{ChangeName("JUDGE")}
"Court is now in session. We are here for the case of CJ Whalen vs. On-Deck, Inc. Prosecution, are you ready?"

{ChangeName("{GetName()}")}
"Y-yes, Your Honor."

{ChangeName("Mr. Richards")}
{AddChar("Richards", "Neutral")}
(Richards leans over to whisper.) "Don’t be intimidated by the judge or Berg… We got this."
{RemoveChar("Richards")}

{ChangeName("JUDGE")}
"And is the defense ready?"

{ChangeName("Mr. Berg")}
{AddChar("Berg", "Neutral")}
"Why, of course, Your Honor. Though I must say, I question the necessity of this trial."
"My client, On-Deck, Inc., is a reputable company! The prosecution will need more than a sob story to prove liability."
{RemoveChar("Berg")}

{ChangeName("JUDGE")}
“Mr. Berg, please save your comments for the opening statement. Prosecution, you may proceed with your opening statement.”
{RemoveChar("Judge")}

{ChangeName("{GetName()}")}
"Good morning, ladies and gentlemen of the jury. My name is {GetName()} and I am from the law firm BB&H."
"Seated next to me is my counsel table with me is Richard Herrman and together we represent CJ Whalen."
"Mr. Whalen brought the suit because he was injured by a product."
"It is his position that the product was defective, and that he was injured as a direct result of that defect."

{ChangeEmote("Verdict", "Thinking")}
{ChangeName("")}
Which type of lawsuit would this case fall under?

{ToggleTextBox(false)}
+“The lawsuit which we shall be involved in today is a product liability action.”
->ProductLiability
+“The lawsuit which we shall be involved in today is a personal injury action.”
->PersonalInjury
+“The lawsuit which we shall be involved in today is a negligence action.”
->Negligence


=== PersonalInjury ===
{ChangeFavorability(2)}
{ToggleTextBox(true)}
{ChangeEmote("Verdict", "Neutral")}
{ChangeName("{GetName()}")}
“The lawsuit which we shall be involved in today is a personal injury action.”

{AddChar("Richards", "Neutral")}
{ChangeName("Mr. Richards")}
“While that is technically correct, the specific suit we are here to present is for product liability."
{RemoveChar("Richards")}
->CivilOrCriminal


=== Negligence ===
{ChangeFavorability(1)}
{ToggleTextBox(true)}
{ChangeEmote("Verdict", "Neutral")}
{ChangeName("{GetName()}")}
“The lawsuit which we shall be involved in today is a negligence action.”

{AddChar("Richards", "Neutral")}
{ChangeName("Mr. Richards")}
“While that is technically correct, the specific suit we are here to present is for product liability."
{RemoveChar("Richards")}
->CivilOrCriminal


=== ProductLiability ===
{ChangeFavorability(3)}
{ToggleTextBox(true)}
{ChangeEmote("Verdict", "Neutral")}
{ChangeName("{GetName()}")}
“The lawsuit which we shall be involved in today is a product liability action.”
->CivilOrCriminal 


=== CivilOrCriminal ===
{ChangeEmote("Verdict", "Thinking")}
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
{ChangeEmote("Verdict", "Neutral")}
{ChangeName("{GetName()}")}
“This is a criminal matter that should be taken seriously.”

{AddChar("Judge", "Neutral")}
{ChangeName("JUDGE")}
{PlaySFX("GavelNoReverb")}
"{GetName()}, this is not a criminal case. The government has not pressed any charges against the defense. Please, keep this in mind as you continue.”
{RemoveChar("Judge")}

{ChangeName("{GetName()}")}
“Y-yes, your honor.”
->BatWeight


=== Civil ===
{ToggleTextBox(false)}
{ChangeFavorability(3)}
{ChangeEmote("Verdict", "Neutral")}
{ChangeName("{GetName()}")}
“This is a civil case, not a criminal one. Keep that in mind as we continue.”
->BatWeight


=== BatWeight ===
{AddChar("Richards", "Neutral")}
{ChangeName("RICHARDS")}
“The product with which we are concerned today is called a bat-weight."
"The purpose is to increase the power of the batter’s swing so that the ball will go further when struck with said bat."
"The bat-weight weighs between one and two pounds and is intended to slide over the top of the bat and down the shaft in order to sit securely on top of it.”

{ChangeName("{GetName()}")}
“Supposedly, the batter can then take practice swings and thus build up the power and speed of his swing."
"This should have been the case on the afternoon of May 20, 1980. However, on that day, what took place instead would affect Mr. Whalen for the rest of his life."
"Moments before the incident, the weight was secured as it always had been.”

{ChangeEmote("Verdict", "Thinking")}
{ChangeName("")}
"What should I say next?"
{ToggleTextBox(false)}
+“Instead of sitting snug on the bat, the weight came loose and smacked Mr. Whalen in the face.”
->Smack
+“Suddenly, during practice swings, the weight flew off like a guided missile and injured Mr. Whalen severely.”
{ChangeFavorability(3)}
->Missile
+“Mr. Whalen stood at the dugout, just behind the on-deck batter who’s weight came off and hit him.”
{ChangeFavorability(-3)}
->Hit


=== Smack ===
{ToggleTextBox(false)}
{ChangeEmote("Verdict", "Neutral")}
{ChangeName("{GetName()}")}
“Instead of sitting snug on the bat, the weight came loose and smacked Mr. Whalen in the face.”
->FinalThoughts


=== Missile ===
{ToggleTextBox(false)}
{ChangeEmote("Verdict", "Shocked")}
{ChangeName("{GetName()}")}
“Suddenly, during routine on-deck practice swings, the weight flew off like a guided missile and struck Mr. Whalen, injuring him severely.”
{ChangeEmote("Verdict", "Neutral")}
->FinalThoughts


=== Hit ===
{ToggleTextBox(false)}
{ChangeEmote("Verdict", "Neutral")}
{ChangeName("{GetName()}")}
“Mr. Whalen stood at the dugout, just behind the on-deck batter who’s weight came off and hit him.”

{ChangeName("RICHARDS")}
(whispering) “Try a more passive tone of voice and more emotional language next time.”
->FinalThoughts


=== FinalThoughts ===
{ChangeName("{GetName()}")}
“You will discover that Mr. Whalen’s injuries were life-threatening and have cost him severely."
"That is what Mr. Whalen is here for: compensation for the terrible wrong that has been done to him."
"You will meet him momentarily.”

{ChangeName("RICHARDS")}
“However, now it is time for the other attorney’s to address you. All that we ask is that you listen with both your ears and your heart."
"Listen for the truth and be fair. Thank you.”

{RemoveChar("Richards")}
{RemoveChar("Verdict")}

{AddChar("Judge", "Neutral")}
{ChangeName("JUDGE")}
“Thank you prosecution, you may rest. Defense, please proceed with your opening statement.”
{RemoveChar("Judge")}

{AddChar("Berg", "Neutral")}
{ChangeName("BERG")}
"Ladies and gentlemen of the jury, I come today not to represent just On-Deck Inc. but Mr. Miranda himself, the maker of these weights."
"Mr. Miranda grew up in New York, not far from here, where he would frequent the local ball games all his life."
"He even would bring his young son there to teach him how to play."
"Needless to say, Mr. Miranda has a love for the game that put him in positions where he had the opportunity to pitch ideas that could support the major leagues."
"One day, after practicing with his son he had the bright idea to create a bat weight that went over the baseball bat."
"In the past bat, bat weights would have to be drilled into or taped onto the bat."
"He pitched his idea to the coach of the New York Yankees and that landed him in the position he is in today."
"That was fifteen years ago."
"In the first ten of those fifteen years, Mr. Miranda sold millions of bat weights without incident to various baseball teams across the country."
"Only within the past five years did softball players begin using these weights for practice, which is where issues arose."
"You see, these weights were and always have been made with the standard hardball bats in mind, not the lighter and smaller softball bats."
"Not only was Mr. Whalen’s team using the incorrect baseball bats for this weight type, they also applied said weight incorrectly."
"During application of the bat weight, the smaller of the two ends of the ring is meant to slide down onto the bat."
"However, in this case the weight was applied upside-down."
"Whether this weight was applied to the proper hardball bat or not, it would not have stayed in place due in part to the incorrect application of the weight."
"Clearly either the retailer did not warn Mr. Whalen and his team of the necessary safety precautions or Mr. Whalen and his team were completely ignorant to them."
"Either way, the idea that On-Deck Inc. or Mr. Miranda could be responsible for this one-in-a-million type of incident is ridiculous."
"I am sure that the jury today will listen to the evidence and rule in fairness, as it is your sworn duty to do so. Thank you for your time."
{RemoveChar("Berg")}

{AddChar("Judge", "Neutral")}
{ChangeName("JUDGE")}
"(Judge nods, turning to the prosecution.) Very well. Prosecution, call your first witness."
{RemoveChar("Judge")}

{AddChar("Verdict", "Neutral")}
{ChangeName("{GetName()}")}
“Prosecution calls CJ Whalen to the stand.”
{AddChar("Whalen", "Neutral")}
"State your name and occupation."

{ChangeName("WHALEN")}
"My name’s CJ Whalen. I’m a police officer. Or, well, I was before this happened, now I just answer their phone calls."

{ChangeName("{GetName()}")}
“As I understand it, you were struck in the face by a baseball bat weight on May 20th, 1980. Is that correct?”

{ChangeName("WHALEN")}
“That’s correct.”
->Choices1


=== Choices1 ===
{ChangeEmote("Verdict", "Thinking")}
{ToggleTextBox(false)}
{ChangeName("")}
+“Where on your face were you struck?”
->Struck
+"Mr. Whalen, can you describe what happened on the day of the injury?"
->Injury


=== Struck ===
{ToggleTextBox(false)}
{ChangeName("{GetName()}")}
+“Where on your face were you struck?”

{ChangeName("WHALEN")}
“As you can see from my face, it struck me hard on the left side from above the eye all the way down to my jaw.”
->Choices2


=== Choices2 ===
{ToggleTextBox(false)}
{ChangeName("")}
{ChangeEmote("Verdict", "Thinking")}
+“What problems do you have presently that relate to your injury thus far?”
->Problems
+“Are you under any restrictions presently with your doctors because of your condition?”
->Restrictions
+“You said you detect an increase in the sensation of feeling returning to your face, yes?” //Appears after the first question has been answered.
->Feeling


=== Problems ===
{ToggleTextBox(false)}
{ChangeName("{GetName()}")}
“What problems do you have presently that relate to your injury thus far?”

{ChangeName("WHALEN")}
“I’ve still got numbness in parts of my face where I can’t feel anything. I saw a neurologist last week as I’m still having severe headaches, dizziness and nausea from it."
"Sleeping is difficult, some nights I wake up screaming.”

{ToggleTextBox(false)}
{ChangeName("")}
{ChangeEmote("Verdict", "Thinking")}
+“You wake up screaming? What from?”
->Screaming
+“Where are you numb?”
->Numb


=== Screaming ===
{ToggleTextBox(false)}
{ChangeName("{GetName()}")}
“You wake up screaming? What from?”

{ChangeFavorability(-3)}
{ChangeName("WHALEN")}
“I don’t know. The pain, maybe.”
->Choices2


=== Numb ===
{ToggleTextBox(false)}
{ChangeName("{GetName()}")}
“Where are you numb?”

{ChangeName("WHALEN")}
“I have some feeling back in my temples and cheekbones. The numbness is mostly in my upper lip and over my cheek down to my jaw."

{ChangeName("{GetName()}")}
“Have the doctors indicated whether that is a condition that will improve?”

{ChangeFavorability(-3)}
{ChangeName("WHALEN")}
“Doctor Goodwill told me he wouldn’t know more about the state of it until six months to a year if I was going to get any feeling back."
"It’s a healing process and once it’s all over I may get some feeling back. I may not get any back at all.”
->Choices2


=== Restrictions ===
{ChangeFavorability(1)}
{ChangeName("{GetName()}")}
“Are you under any restrictions presently with your doctors because of your condition?”

{ToggleTextBox(false)}
{ChangeName("WHALEN")}
“Yes, I am.”

{ChangeName("{GetName()}")}
“What are they?”

{ChangeName("WHALEN")}
“I cannot perform my duties as a police officer as far as getting involved in any confrontations with anybody."
"Right now I am assigned to telecommunications, stuck answering phones all day.”
->Choices3


=== Choices3 ===
{ToggleTextBox(false)}
{ChangeName("")}
{ChangeEmote("Verdict", "Thinking")}
+“Are you getting paid the same as you would?”
->Paid
+“Any other type of work you can do at the troop other than phone work?”
->Phone
+“How much time did you miss from work following the accident?”
->Accident

=== Paid ===
{ToggleTextBox(false)}
{ChangeFavorability(1)}
{ChangeName("{GetName()}")}
“Are you getting paid the same as you would?”

{ChangeName("WHALEN")}
“I’m still getting paid but definitely not as much as before.”
->Choices3


=== Phone ===
{ToggleTextBox(false)}
{ChangeName("{GetName()}")}
“Any other type of work you can do at the troop other than phone work?”

{ChangeName("WHALEN")}
“No, sir. They won’t let me leave the building in uniform.”

{ChangeName("{GetName()}")}
“Why is that?”

{ChangeFavorability(3)}
{ChangeName("WHALEN")}
“They won’t let me take any kind of position where I have to take physical action or anything. It’s a restriction that has left me doing work that I dislike very much.”
->Choices3


=== Accident ===
{ToggleTextBox(false)}
{ChangeName("{GetName()}")}
“How much time did you miss from work following the accident?”

{ChangeName("WHALEN")}
“I believe I took about – somewhere in the neighborhood of fifty sick days.”

{ChangeName("{GetName()}")}
“Have you returned to work full-time since that time?”

{ChangeName("WHALEN")}
“Yes, but only with light capacity. I am not permitted to wear a uniform outside of the building. It makes it so I am unable to perform extra duty work.”

{ChangeName("{GetName()}")}
“How much do you think you were making yearly in the way of extra duty work?”

{ChangeFavorability(5)}
{ChangeName("WHALEN")}
“I would say somewhere between three and four thousand.”
->Choices2


=== Feeling ===
{ChangeName("{GetName()}")}
“You said you detect an increase in the sensation of feeling returning to your face, yes?”

{ToggleTextBox(false)}
{ChangeName("WHALEN")}
“I have more pain there now than I have had since the operation. I assume that’s because feeling is returning in that particular area."
"My whole face was numb at one point, but I’m getting some feeling back.”

{ChangeName("{GetName()}")}
“What was the operation? What did you have done?”

{ChangeFavorability(3)}
{ChangeName("WHALEN")}
“Multiple facial fractures, jaw, cheekbone, eyebone, total concussion.”
->Choices1


=== Injury ===
{ToggleTextBox(false)}
{ChangeName("{GetName()}")}
"Mr. Whalen, can you describe what happened on the day of the injury?"

{ChangeName("WHALEN")}
“Okay, the team I was playing for was up to bat and I was in what is considered the dugout area. I was coming out of there, getting my own bat."
"There was a man in the on-deck circle who would bat next. I was prepared to take his place next."
"As I was picking up my bat, out of nowhere I was hit with this weight and went down hard.”

{ChangeName("")}
{ToggleTextBox(false)}
{ChangeEmote("Verdict", "Thinking")}
+“Have you had the occasion to talk to the guy who was swinging the bat since this happened?”
->Guy
+“How far from the end of the bat would it go until it reached a point where it could no longer move?”
->Weight
+“What kind of bat was he using? Was it a commonly-used softball bat?”
->SoftballBat


=== Guy ===
{ToggleTextBox(false)}
{ChangeName("{GetName()}")}
“Have you had the occasion to talk to the guy who was swinging the bat since this happened?”

{ChangeName("WHALEN")}
“Yes, I have. He told me that when he swung it, he could see it fly off as if he was shooting a rifle. He saw it strike me in the face.”

{ChangeName("{GetName()}")}
“We actually have the weight itself here if the jury would like to see it.”

{ChangeName("WHALEN")}
“The weight is a piece of lead with a plastic coating surrounding it."
{ChangeFavorability(5)}
"It appears that the inner circumference of that plastic ripped on the inside from the force of the man swinging, causing it to peel off.”
“In my opinion, one swing had enough force behind it to cause that thing to tear off the bat.”
->Closing

=== Weight ===
{ToggleTextBox(false)}
{ChangeName("{GetName()}")}
“How far from the end of the bat would the weight go until it reached a point where it could no longer move?”

{ChangeName("WHALEN")}
“It slides down the short end of the bat and goes about halfway down.”

{ChangeName("{GetName()}")}
“And as I understand it, when its casing has been removed, the inner core will slide completely over the bat; is that right?”

{ChangeName("WHALEN")}
“I would assume so.”

{ChangeName("{GetName()}")}
“Have you ever tried that?” Will it slide completely over the bat?”

{ChangeFavorability(-3)}
{ChangeName("WHALEN")}
“I have had no occasion since this accident to try it but I assume that is the case, yes.”
->Closing


=== SoftballBat ===
{ToggleTextBox(false)}
{ChangeName("{GetName()}")}
“What kind of bat was he using? Was it a commonly-used softball bat?”

{ChangeName("WHALEN")}
“He uses the same bat I use. It’s a very popular model.”

{ChangeName("{GetName()}")}
“Is it metal?”

{ChangeFavorability(-5)}
{ChangeName("WHALEN")}
“It’s an aluminum bat.”
->CrossExam


=== CrossExam ===
{ChangeName("{GetName()}")}
“Thank you for your time and cooperation, Mr. Whalen. Prosecution rests.”
{RemoveChar("Verdict")}

{AddChar("Berg", "Neutral")}
{ChangeName("BERG")}
“Mr. Whalen, you talked about not being able to wear the uniform outside of the RECOM building.”

{ChangeName("WHALEN")}
“That’s correct, sir.”

{ChangeName("BERG")}
“Can you explain the significance of not being able to wear a uniform?”

{ChangeName("WHALEN")}
“I’m a policeman. As part of wearing that uniform, it’s my job to preserve the law and any of its forms."
"For example, if I was in uniform and somebody got in a fight right now, I am bound to take some kind of action, whatever necessary."
{ChangeFavorability(3)}
"They will not allow me to be put into a position where I could further injure my face.”

{ChangeName("BERG")}
“I see. Speaking of equipment, do you know about when the weight was purchased?”

{ChangeName("WHALEN")}
“I would assume it was purchased two or three weeks before the accident.”

{ChangeName("BERG")}
“Do you know the individual who selected the equipment?”

{ChangeName("WHALEN")}
“The owner of the team has an account with On-Deck. He would have been the one to purchase it.”

{ChangeName("BERG")}
“And how about the bats? Who purchases them?”

{ChangeName("WHALEN")}
“For the bats, the owner instructed each team member to pick out the bat that suited them, and simply add it to his account.”

{ChangeName("BERG")}
“May we present that bat so that members of the jury can observe it?”

{ChangeName("")}
"The bat is presented to the court"

{ChangeName("BERG")}
“How many people on the team use a bat like this one?”

{ChangeFavorability(-3)}
{ChangeName("WHALEN")}
“I’d say everyone on the team. I believe we all use aluminum bats. This particular bat is probably one of the most popular models.”

{AddChar("Verdict", "Shocked")}
{ChangeName("{GetName()}")}
“Objection! All softball teams use aluminum bats, this case is not significant in that regard.” //Timed event
{RemoveChar("Verdict")}

{AddChar("Judge", "Neutral")}
{ChangeName("JUDGE")}
{PlaySFX("NoBuildupGavel")}
“Sustained.”
{RemoveChar("Judge")}

{ChangeName("BERG")}
“Mr. Whalen, everyone on the team was using the same weight, correct?”

{ChangeName("WHALEN")}
“That’s right.”

//if the weight was shown previously
{ChangeName("BERG")}
“May we view that weight again to inspect it?”

{ChangeName("")}
(The weight is presented to the court.)

{ChangeName("BERG")}
“Now as far as you’re concerned, is there a right side or a particular way these things go on the bats?”

{ChangeFavorability(-3)}
{ChangeName("WHALEN")}
“I assume it will go either way. Doesn’t make any difference.”

{ChangeName("BERG")}
“Do you know whether these cracks around it existed prior to the accident?”

{ChangeFavorability(-1)}
{ChangeName("WHALEN")}
“I don’t know.”

{ChangeName("BERG")}
“That’s all I have. Defense rests.”
{RemoveChar("Berg")}
{RemoveChar("Whalen")}
->Closing

=== Closing ===
{AddChar("Judge", "Neutral")}
{ChangeName("JUDGE")}
“Before the jury goes off to deliberate, I must read the instructions on what they are to do."
"In the case heard today, On-Deck Inc. contends that CJ Whalen may not recover because he knew the danger surrounding the use of the bat weight."
"On-Deck Inc. also contends that CJ Whalen exposed himself to that risk willingly in spite of knowing the danger it posed."
"On-Deck Inc. has the burden of proof by a “preponderance of the evidence” as previously defined."
"In order to establish this defense, On-Deck Inc. must prove that CJ Whalen knew of the danger surrounding the bat weight."
"Additionally, On-Deck Inc. must prove that he voluntarily exposed himself to that known danger.”
“Defendant On-Deck Inc. contends that the person swinging the bat at the time of the injury was misusing the bat weight."
"This alleged misuse was an independent, intervening cause of plaintiff’s injuries so that On-Deck Inc. would not be liable."
"If you find that the bat weight was being used in a foreseeable or a normal incident of the risk created, then you must find for the plaintiffs.”
“The jury will now go off and deliberate. We will meet again once a verdict has been reached.”
{PlaySFX("DoubleGavel")}
{RemoveChar("Judge")}

{AddChar("Berg", "Neutral")}
{ChangeName("BERG")}
"Well newbie, how do you think you did?"
"You presented some pretty solid evidence but I have a feeling my cross-examination built too strong of a doubt in the jury’s mind.”

{AddChar("Richards", "Neutral")}
{ChangeName("RICHARDS")}
“Mr. Berg, is it not rather unprofessional to discuss an active case outside of court?”

{ChangeName("BERG")}
"Mmmm I’ll show you unprofessional, old man.”
{RemoveChar("Berg")}
{RemoveChar("Richards")}

->END