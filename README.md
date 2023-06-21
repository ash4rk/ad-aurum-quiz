# ad-aurum-quiz
<img src="icon.svg" align="left" width=128 height=128> This repository contains a quiz game developed using [Godot](https://github.com/godotengine/godot). The game features a simple quiz loop where players can answer questions and view the correct answers. 
Incorrect choices are highlighted in red. After completing all the questions, players can view basic statistics of their answers. Additionally, users have the option to set the maximum number of answers to be displayed. 

<img src="https://github.com/ash4rk/ad-aurum-quiz/assets/30512240/4083e8c8-4386-4229-b13e-3a75d127e34e" height="40"/>

## Features

* Simple quiz game loop
* Answer feedback: Correct answers highlighted, incorrect answers shown in red
* Basic statistics of answers
* Сustomizable maximum number of answers displayed
* Support for multiple correct answers with checkbox interface
* Supports English and Russian localization

## Preview

<p align="center">
<img src="docs/main-menu.png" alt="Main menu screenshot" width=250 />
<img src="docs/preview.gif" alt="GIF prevuew" width=250 />
<img src="docs/end-game.png" alt="End game screenshot" width=250 />
</p>

## How to add question

The questions are composed from 'questions.json' of the following structure:

```
[
{
  "question": "Question text goes here",
  "answers": [
    {"text": "Answer 1", "correct": true},
    {"text": "Answer 2", "correct": false},
    ...
  ],
  "background": "path/to/background/image.jpg"
},
...
]

```
## Time tracking

In total, I spent about six hours on this project. Three hours were spent on the functionality and three on the visual part.
All this time recording a screencast. Still found design flaws and minor bugs for a while.

<h1 align="center">
<img src="https://github-production-user-asset-6210df.s3.amazonaws.com/30512240/239732333-a9103be0-cbdd-4e79-9873-f303171d8045.png" height="500"/></h1>
<p align="center">

## Addons

Used the [Godot Scene Manager](https://github.com/glass-brick/Scene-Manager) addon for cool fancy transitions between game screens.

