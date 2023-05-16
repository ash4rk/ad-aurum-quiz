# ad-aurum-quiz
<img src="icon.svg" align="left" width=128 height=128> This repository contains a quiz game developed using [Godot](https://github.com/godotengine/godot). The game features a simple quiz loop where players can answer questions and view the correct answers. 
Incorrect choices are highlighted in red. After completing all the questions, players can view basic statistics of their answers. Additionally, users have the option to set the maximum number of answers to be displayed. 

![godot_button_icon_151956 (copy)](https://github.com/ash4rk/ad-aurum-quiz/assets/30512240/cc35c4e9-d603-431f-99f8-d8398736689c)

## Features

* Simple quiz game loop
* Answer feedback: Correct answers highlighted, incorrect answers shown in red
* Basic statistics of answers
* Сustomizable maximum number of answers displayed
* Support for multiple correct answers with checkbox interface

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
<img src="https://github.com/ash4rk/ad-aurum-quiz/assets/30512240/5fc1a526-7f97-48a6-adb6-1690ab2544f9" height="500"/></h1>
<p align="center">
