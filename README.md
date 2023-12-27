# KEY WIZARD
#### Video Demo:  <https://youtu.be/fOH2INbBJ_k>
#### Description:

WHAT IS THE GAME ABOUT?

"Key Wizard" is a captivating 2D game made in Lua and Love2D. In this immersive adventure, players step into the role of a wizard on a mission to face the forces of evil threatening to take the world into chaos. The wizard follows a journey through diverse locations, each in need of liberation and peace.

To restore order and defeat the enemies, players must use the spells acquired along the way. The player’s duty is to practice all the spells that vanish the different enemies encountered, emphasizing the correct use of the keyboard to become a powerful wizard by pressing the required keys. Can you, as the Key Wizard, rise to the challenge and save the world from chaos?


HOW TO PLAY?

The journey begins at the home screen, where the player is taken into a level selection interface. Levels are organized focusing initially on middle-line keys and progressing to top and bottom rows of the keyboard. Enemies, representing specific keys, are displayed in the game map, where the player eliminates them by correctly typing the corresponding letter. The enemies that aren't vanished result in damage to the player. Accumulating three hits trigger the game over screen, where the options include restarting the level or returning to the level selection screen. Successful completion of a level displays the winning screen. Choose to advance to the next level or return to the level selection screen. The accuracy percentage showcases the player's performance, depending on the damage taken and wrong inputs of keys.

"Key Wizard" transforms typing practice into an engaging, interactive experience. Focused exercises on specific key sets allows players to refine finger movements and increase typing speed. Progressing through all levels ensures a better usage of the keyboard, contributing to better writing skills. Commit to each level, refine accuracy, and watch your typing skills flourish in this exciting journey!

THE FILES

The principal file of this project is the “main.lua” file that works as the base of all the project. The functionality of the game depends on the variables and functions declared in this file. At the top, all the variables for each level are declared using the respective files for each of them, as well as the “current_screen” variable that allows the elements appearing in the screen to change to the user inputs accordingly, and the using the functions of the file in the selected level. In the load function all the maps and levels are loaded in the program which allows the elements to be used in the game. The draw function displays the necessary elements in the screen, depending on the current screen that is being displayed. Similarly, the update function makes the changes in the elements dependending on the current screen and the conditions happening in the game, such as key pressing, clicking, music playing, and collisions, using the dt parameter which represents the changes made in each frame. Finally, the “keypressed” and “keyreleased” functions that take the key being pressed and released as a parameter for the levels functions to handle these events, when the user presses a certain key and when he stops pressing it, to ensure that each of the input need to be used once for each time the key is pressed and not allowing the user to hold it down.

For the rest of the game, the files are divided in different folders to have a better organization:

Levels.- 
> There are 18 levels in total for the game. All of them share the same variables and functions but they are declared using the number of the level to prevent errors for using functions with the same name in different levels. 
> At the top, all the variables used are declared locally, creating the enemies, the lives, the screens, the keys and other auxiliary variables that complement the level functioning. These variables are completely declared with their respective values to ensure that they are using the default value each time the level is loaded.
> The tables of objects such as key objects and enemy objects are also created in the load function, where they use the same positions and parameters of the “keys” table that contains all the keys used in the level, that way the enemy, the key object and the corresponding key are linked in the screen and also when the key is pressed.
> In the draw function for each level, a loop is used to draw all the elements in the tables and other elements such as the spell bar or auxiliary messages, as well as drawing the map in the background.
> Almost all the functionality of the level is defined in the update function, such as the auto map scrolling, sounds used for specific situations, checking for collisions and pressing the correct key vanishing the enemies, using the “keypressed” and “keyreleased” functions, and declaring the status of the game (winning or losing).
> Finally, at the bottom of each level file, all the functions are returned in order to call them in the main file.

Classes.-
> In order to make this game, using an object oriented program seemed as the best way to implement all the elements necessary, using different classes that fulfill specific functions within the code.
> Button: This class creates buttons on the screen that can be clicked by the user. The parameters used when creating these objects are the x and y coordinates, width, height, label, text and color. The draw function is only used for displaying the button on the screen. Finally, the “clicked” function is used to return a boolean value if the user presses the screen in the coordinates occupied by the button.
> Level: The level class has the same functionality as the button class, the only difference is that all the objects created from this class have the same dimensions and color being only placed in different places in the “levels” screen so the user can select a certain level.
> Player: The player class doesn’t take any parameters as all the player objects have the same attributes such as positioning, dimensions and the image used for the player object. It uses a draw function to display the character, a “checkCollision” function that evaluates if the player coordinates meet the enemy coordinates and an update function that changes the animation of the player after some frames have passed.
> Key: The key objects are created with this class for each key in the level. They have a “key” parameter that represents the key that needs to be pressed, the distance where the key appears from the player, the speed that it has for moving constantly to the left and checking if the key is “spacebar” because it is an special character that works differently as the other keys. In the draw function the image and the corresponding letter of the key are displayed in the screen while the update function changes the position of the key each frame to make it move to the left constantly, and when the key is deleted the opacity is reduced until it reaches 0 before being removed in the level.
> Enemy: There are a lot of enemy classes that represent each enemy used for a specific set of letters displayed by different creatures, but the functionality is the same regardless of the images used for their animations. The enemy object is paired with a key by using the same parameters of speed and distance so they move at the same velocity at the same position. In the draw function the enemy is drawn with their default color if the parameter of “shadow” is false. However, if the key is “space”, the enemy is classified as a shadow and is drawn with darker colors because it resembles a shadow enemy. In the update function the position of x reduces in each frame just as the animation changes, until the attribute “alive” changes to false then it disappears till it is removed.

Screens.- 
> The screens are the interfaces that display different options for the user to interact and select what they want to be displayed.
> The menu screen uses an image to display the background and creates a button object used to start the game. The button, the background and the text are conveyed on the screen with the draw function. The update function is only used if the button is clicked, the current screen changes to levels.
> The levels screen displays all the level objects with different positions and texts, and when they are clicked, the current screen changes to the level selected.
> The game over screen appears when the player loses all of his 3 lives, overlapping a box in the level containing a gameover text and two buttons created in the file. The first button restarts the current level passed as a parameter from the level file by loading it again, while the second button returns the player to the levels screen and also reloads the level to ensure that all of the variables return to the default values if they enter the level once again.
> The winning screen is also a box that appears just as the game over screen once the user finishes the level displaying two options. The first button starts the next level that is passed as a parameter from the current level file, and the second button also returns the player to the levels screen. In both cases the level is loaded again to ensure that the variables are set to default when the user gets into the level again. Additionally, the draw function takes the precision parameter from the level that displays the accuracy the user had pressing the keys in the level.

Maps, Sounds, Characters.-
> These folders contain external files that add audiovisual elements for the project design.
> The maps are Lua files exported from Tiled where the maps were created.
> The sounds are either “.wav” or “.mp3” sounds or music without copyright that are used for specific occasions such as background music, the player being hit or the enemy being eliminated.
> The characters are “.png” images with their variations that make the animations of each character in the game.

ADDITIONAL RESOURCES

Lib Folder.- 
> The lib folder is a set of files created by karai17 in Github by the name of “Simple-Tiled-Implementation”, that allows the maps exported as Lua code to be transformed into actual visual maps in the code.

Assets.- 
> The character images were made based on the pack of assets made by DeepDiveGameStudio named “Humanoid Asset Pack”, being modified to be able to accomplish certain visual characteristics in the game.

Tilesets.-
> The tilesets used for the creation of maps were part of a downloadable file name “Pixels” from PiiiXL.
