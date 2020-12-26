## log de versões Naski: The Legend Of South

### Updates Notes()

- [log de versões Naski: The Legend Of South](#log-de-versões-naski-the-legend-of-south)
	- [Updates Notes()](#updates-notes)
- [1. New Features](#1-new-features)
- [2. Player](#2-player)
	- [2.1 Script](#21-script)
	- [2.2 Scene](#22-scene)
- [3. Enemies(IA)](#3-enemiesia)
	- [3.1 Script](#31-script)
	- [3.2 Scene](#32-scene)
- [4. Level Design](#4-level-design)
- [5. Art(Pixel Art) and Music](#5-artpixel-art-and-music)
- [6. HUD and GUI](#6-hud-and-gui)
	- [6.1 Scripts](#61-scripts)
	- [6.2 Scene](#62-scene)
- [7. Bugs: Related and Solved](#7-bugs-related-and-solved)
	- [7.1 Related](#71-related)
	- [7.2 Solved](#72-solved)
- [8. Deleted Items](#8-deleted-items)
	- [8.1 Script](#81-script)
	- [8.2 Scene](#82-scene)
- [9. Others (Assets,Fonts,etc...)](#9-others-assetsfontsetc)
- [10. Support and Feedback of the player](#10-support-and-feedback-of-the-player)

## 1. New Features
 	- Welcome to first build playable of the Naski the Legend of South
	let's go start this new adventure !
	- This is a Pixel art game multiplatform 2D 
	- You can explore and know the south Brazil culture
	- Jump, run and play...

## 2. Player

### 2.1 Script
	- change_state() function added(State machine method) new states -> [IDLE,RUN,JUMP]
	- get_input() function added: movement of the player 
	- export vars -> run_speed, jump_speed and gravity added
	- input verifications added to get_input()
	- comments added
	- _physhics_process(delta) function added
	- start(pos) function added
	- ready() function added

### 2.2 Scene
	- KinematicBody2D added
	- Sprite added: new animations->[idle,run,jump_up,KnifeAttack]
	- CollisionShape2D added
	- Camera2D added
	- script added
	- Area2D(AttackArea) added 
	
## 3. Enemies(IA)

### 3.1 Script
	- none

### 3.2 Scene
	- none
	
## 4. Level Design
	- Base level make
	- First level structure added
	- Second level structure added
	- added level transition (switching) object

## 5. Art(Pixel Art) and Music
	- player sprite frames added

## 6. HUD and GUI
	- HUD added (not functional)
	- GUI added (20 % functional)

### 6.1 Scripts
	- HUD buttons signals path added
	- GUI buttons signals path added

### 6.2 Scene
	- HUD buttons added -> [start,credits,exit,settings]
	- HUD buttons signals connected
	- GUI buttons added -> [start,credits,exit,config]
	- GUI buttons signals connected
	- GUI panel added 
	- GUI labels added

## 7. Bugs: Related and Solved

### 7.1 Related
	- HUD have same buttons of GUI(need change this)
	- player sprite movement is a bit slow
	- the first and second levels need a visual upgrades
	- GUI needs visual upgrade
	- need a backButton in game
	- need a pause button in game
	
### 7.2 Solved
	- none
	
## 8. Deleted Items

### 8.1 Script
	- none

### 8.2 Scene
	- none

## 9. Others (Assets,Fonts,etc...)
	- pre game scene added to project
	- functionality tests realized
	- credits scene added to project
	- settings scene added to project
	- link added to github logo in credits scene
	- back button and others things(sprites,buttons,paths,labels,etc..) added to credits scene
	- back button and others things(sprites,buttons,paths,labels,etc..) added to settings scene
	- next level(level transition) added
	- Miscellaneous assets added to project
	- inventory scene added to project (not functional)
	- LogVersoes folder added to project
	- wall(map limitation) added
	- testes folder added

## 10. Support and Feedback of the player
	- Link of the feedback form added to settings scene
	


