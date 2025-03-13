**Open this document in a markdown previewer and reveal its true form!**

# Accessibility Workshop


> *Greetings, explorer! 
You've entered an app where semantics and accessibility were overlooked. 
Your task is to navigate through this digital landscape and concure critical issues. 
> You won't be alone on this quest, you have been teamed up with a fellow developer to tackle the challenges together!
> *
> Don’t worry, the instruction below will guide you through every phase of the journey.
Good luck, and remember, every improvement you make brings the app closer to victory!*




## Inventory
In your inventory you find to screen readers
VoiceOver and TalkBack. Choose the one that fits your device. 
It will assist you throughtout the quests


# Chapter 1

## The Accessibility Audit 🚀

> *Grab your gear and launch the Accessibility Inspector in Xcode. Let’s uncover any hidden obstacles and level up our app’s accessibility! 🔍
> This powerful tool will scan our app and reveal hidden obstacles, giving us hints on what can be improved.
> Fix all the issues, clear the path, and when you're done head over to the next tool!*

A the rare kind not bound to a Mac you are free to bypass this trial! While others must forge ahead, you may step aside, your path unburdened by this task.



1. The app has been fortified with a powerful Accessibility Scanner, a tool designed to unveil hidden flaws lurking in the shadows. Activate it in the main! No detail is too small—inspect every corner, every button. But beware… the BottomSheets may hold secrets that others overlook.



## 1.The urge to merge

> *When merging semantics, don’t panic! Stay cool, stay chill no need for dramatics.
> We have detected areas where widget should be merged into a single semantic node 
> You've been provided images to make the task at hand easier for you*

With the screen reader navigate through the home page, and you'll see that the texts shown in the pictures can be merge for a better experience



![image info](./lib/assets/markdown/header_text.png)
![image info](./lib/assets/markdown/merge_balance_text_spent.png)
![image info](./lib/assets/markdown/merge_balance_text.png)


# 2.Picture This... Or Maybe Not!
> *Not all elements are mission-critical. Some objects in this world bring no value to the mighty screen reader. They are but decorative relics, mere distractions in the grand quest for accessibility!*

Go ahead and remove the images detected by screen readers from semantics

# 3. Semantics properties

 1. See all, but see all what? What action is this widget? Let's give our users a hint

![image info](./lib/assets/markdown/balance_card.png)

2. The button should be 48 x 48 

3. We would like that the balance card has the explicit label 'Balance card' but that the children within are still detected by the screen readers 

$~$

# Block semantics

On the balance card elements that are not yet shown are detected by the screen reader
Figure out how you can block the semantics whilst the list is not displayed 

![image info](./lib/assets/markdown/balance_card.png)

$~$

# Sort away

When arriving on the home page we want to read the title before arriving on the search bar. we want the page make sense 


___
$~$

# Chapter 2

> *You have come a long way in your semantics journey and I salut you. 
However much semantics counts. We also have to take into consideration other factors such as color contracts, text scalors etc. 
The app has been fortified with a powerful Accessibility tool, a tool designed to unveil hidden flaws lurking in the shadows. Activate it in the main! No detail is too small. 
> Inspect every corner, every button. But beware… the BottomSheets may hold secrets that others overlook.*

$~$

# Text scaling

Text scaling is set in the settings of the phone. So it's important that the app can adapt to these settings to accompondate our dear users 

You can set minimum and maximum scale factors for your MaterialApp, which will ensure that all the text scales within the specified limits. Tighter boundaries require less effort to maintain readability and aesthetics.

1. Use the Accessibility tool and increase the text scale factor to 2
If you find any overflow errors you should correct them

$~$

2. Let's limit the text scale factor in the app 
We want to limit the text scale range from 0.8 to 1.9

You find a flutter news paper on the floor which contains an intersting article that might help you in this endevor
https://medium.com/@pomis172/properly-handling-text-scaling-in-flutter-313fe717816c


# Contrast
We have covered a lot already but lastly let's make sure that our app is clearly readable

There are few tools that can check the conrast properly. There is the Accessibility scanner for Android. So if you are in posession of one 







    

