## The Test of Patience Challenge

Create: Above and Beyond Modpack has a barrel that can be purchased in the market section of the questbook that implies there is some reward if the buyer gets to the bottom of it. "Test of Patience" is an accurate name for it because after opening about 50 barrels manually I decieded it would be better to automate the process of opening the puzzle barrel, extracting the contents, and then placing the new barrel. Luckily the modpack includes ComputerCraft which allowed me to place a *Mining Turtle* to handle this burden for me, and good thing because the turtle has processed over 18,000 and counting with much greater efficiency than myself.

## Using this Script

1. Craft and place a Mining Turtle.
2. Place the "Test of Patience" barrel in front of the turtle.
3. Attach external storage. Place chests, barrels, storage drawers or some other storage directly on the other sides of the turtle: left, right, bottom, and top.
4. Get the program. 
    1. Copy and paste the code from the `patience_tested` to pastebin.com and create a new paste.
    2. You should be rerouted to a URL like htt<span>ps://</span>pastebin.com/**s9tFtH6L**. Make note of the random string after the last `/`.
    3. Right click on your turtle and execute the following `patebin get *yourUniqueString* patience_tested`
5. Label your turtle. Execute the following `label set *turtleName*`
5. Run the program. On the turtle execute the following `patience_tested`

## Autorunning
Assuming you don't leave this running on the server/client until it finishes. You may want the turtle to automatically restart processing upun rejoining the world. Follow the steps below to set that up.
1. Get the startup script.
    1. Copy and paste the code from the `startup` to pastebin.com and create a new paste.
    2. You should be rerouted to a URL like htt<span>ps://</span>pastebin.com/**s9tFtH6L**. Make note of the random string after the last `/`.
    3. Right click on your turtle and execute the following `patebin get *yourUniqueString* startup`
2. 

## Notes
- In the C:AAB modpack, crafting a turtle requires some Invar which doesn't seem to be an early game resource. Using a profession to aquire a stack of silver coins and then exchanging those for invar ingots was a relatively quick solution to getting the needed resource early.
- Based on runtime it seems there are 27 unique notes found in these barrels, I reccomend using large chests or really any other storage type with the exception of storage drawers to stash these
- I reccomend using a storage drawer with a void upgrade and pottentially storage upgrades for the barrels and food items you'll be getting. I used a 1x1 drawer with a void upgrade and significant storage upgrade for barrels and a 2x2 with the same upgrades for motivational apples, cookies and pufferfish. If you choose to use the same setup, you may need to lock the 2x2 until you aqcuire each of the foods in your other chests so that you don't get paper deposited in it.
- Currently, the notes found in barrels are kept in attached storage. If you don't want to keep these notes a filtered funnel or similar could be used to extract only paper which could then be sent somewhere to be destroyed.