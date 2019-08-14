# Coloured Chat
Allows players to colour their chat messages.
(See the example below.)

## Installation
- Unzip the archive, rename the folder to chat_c and
place it in ..minetest/mods/

- GNU/Linux: If you use a system-wide installation place
    it in ~/.minetest/mods/.

- If you only want this to be used in a single world, place
    the folder in ..worldmods/ in your world directory.

For further information or help, see:
https://wiki.minetest.net/Installing_Mods

## Dependencies
- default (included in minetest_game)
#### Optional dependencies
- [intllib](https://github.com/minetest-mods/intllib)

## How to use
Players can prefix their messages with a letter (or series of letters) and it will colour their message. 
* b (blue)
* lb (lightblue)
* g (green)
* lg (lightgreen)
* r (red)
* p (pink)

If you type on chat:
```
g Thanks wilkgr
```
then other players will see:
```diff
+ <you> Thanks wilkgr
```
(except for the '+'. That's to make Github highlight it green.)
