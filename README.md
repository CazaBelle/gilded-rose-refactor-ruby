# Gilded rose tech test

# Quickstart
* `git clone https://github.com/CazaBelle/gilded-rose-refactor-ruby.git`
* `cd giled-rose-refactor-ruby`

# Approach
* Started by writing a thorough tests using the prescribed features to ensure that my functionality stayed the same as I refactored
* Combed over the if/else statements to tease out what each block was doing 
* Created constants for the magic items and replaced strings for constants 
* Created method for increasing_quality and decreasing_quality 
* Combined those into 1 method that accomodated for both increasing and decreasing 
* Refactored the update_quality method to include the helper method
* Slowly extracted out the duplications into an ItemUpdater method 
* Finally created a BackStagePassUpdater that inherited from ItemUpdater 

# Original Specifications

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

```
Once the sell by date has passed, Quality degrades twice as fast
The Quality of an item is never negative
“Aged Brie” actually increases in Quality the older it gets
The Quality of an item is never more than 50
“Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
“Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
We have recently signed a supplier of conjured items. This requires an update to our system:

“Conjured” items degrade in Quality twice as fast as normal items
Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."*

Choose legacy code (translated by Emily Bache) in the language of your choice. The aim is to practice good design in the language of your choice. Refactor the code in such a way that adding the new "conjured" functionality is easy.
```
