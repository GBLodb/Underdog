#modloaded cuisine
import crafttweaker.item.IItemStack as IItemStack;
import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IIngredient;

import mods.cuisine.AxeChopping;
import mods.cuisine.Mortar;
import mods.cuisine.Mill as mill;

// Harvestcraft Coconut from dynamictreesphc item
// AxeChopping.add(<dynamictreesphc:coconutseed>, <harvestcraft:coconutitem>);
// // Tropicraft's Coconut Chunk from harvestcraft's Coconut
// AxeChopping.add(<harvestcraft:coconutitem>, <tropicraft:coconut_chunk> * 2);
// // Pineapple cubes
// AxeChopping.add(<ore:cropPineapple>, <tropicraft:pineapple_cubes>);

// // Mill
// mill.add(<minecraft:dye:15>, null, <biomesoplenty:white_dye>, null);
// mill.add(<ore:gemLapis>, null, <biomesoplenty:blue_dye>, null);
// mill.add(<ore:gemLapis>, null, <biomesoplenty:blue_dye>, null);


// Crafting table
recipes.removeShaped(<cuisine:mill>);
recipes.addShaped(<cuisine:mill>, [
    [<ore:handleWood>],
    [<ore:stone>]
]);

// Fire Pit
recipes.remove(<cuisine:fire_pit>);
recipes.addShapedMirrored(<cuisine:fire_pit>, [
    [<ore:stickWood>, <ore:stickWood>],
    [<ore:rocks>, <ore:rocks>]
]);

// Wooden Handle
recipes.removeShaped(<cuisine:material:1>);
recipes.addShaped(<cuisine:material:1>, [[<ore:stickWood>, <ore:stickWood>]]);

// recipes.remove(<cuisine:jar>);
// recipes.addShaped(<cuisine:jar>, 
//    [[<ore:plateClay>, <ore:plateClay>, <ore:plateClay>],
//     [<ore:plateClay>, null, <ore:plateClay>],
//     [<ore:plateClay>, <ore:plateClay>, <ore:plateClay>]]);

// recipes.remove(<cuisine:earthen_basin>);
// recipes.addShaped(<cuisine:earthen_basin>, 
//    [[<ore:plateClay>, null, <ore:plateClay>],
//     [<minecraft:iron_bars>, <ore:plateClay>, <minecraft:iron_bars>]]);

val basins = {
    <cuisine:earthen_basin_colored> : <minecraft:dye:15>,
    <cuisine:earthen_basin_colored:1> : <minecraft:dye:14>,
    <cuisine:earthen_basin_colored:2> : <minecraft:dye:13>,
    <cuisine:earthen_basin_colored:3> : <minecraft:dye:12>,
    <cuisine:earthen_basin_colored:4> : <minecraft:dye:11>,
    <cuisine:earthen_basin_colored:5> : <minecraft:dye:10>,
    <cuisine:earthen_basin_colored:6> : <minecraft:dye:9>,
    <cuisine:earthen_basin_colored:7> : <minecraft:dye:8>,
    <cuisine:earthen_basin_colored:8> : <minecraft:dye:7>,
    <cuisine:earthen_basin_colored:9> : <minecraft:dye:6>,
    <cuisine:earthen_basin_colored:10> : <minecraft:dye:5>,
    <cuisine:earthen_basin_colored:11> : <minecraft:dye:4>,
    <cuisine:earthen_basin_colored:12> : <minecraft:dye:3>,
    <cuisine:earthen_basin_colored:13> : <minecraft:dye:2>,
    <cuisine:earthen_basin_colored:14> : <minecraft:dye:1>,
    <cuisine:earthen_basin_colored:15> : <minecraft:dye>
} as IItemStack[IItemStack];

for basin, dye in basins {
    recipes.remove(basin);
    recipes.addShapeless(basin, [<cuisine:earthen_basin>, dye]);
}