import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;

import crafttweaker.events.IEventManager;


<minecraft:lever>.displayName = "Breaker Switch";
<minecraft:lever>.addTooltip("§aActs as Lever");

recipes.removeShaped(<minecraft:lever>);
recipes.addShapedMirrored(<minecraft:lever>,
    [[<ore:ingotTin>, <minecraft:stick>],
     [<minecraft:stick>, <ore:plateIron>]]
);