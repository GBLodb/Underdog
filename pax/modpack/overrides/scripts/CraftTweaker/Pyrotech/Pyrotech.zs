
#modloaded pyrotech
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.jei.JEI.removeAndHide as rh;
import mods.jei.JEI.hideCategory as hc;
import mods.jei.JEI.hide as h;
import mods.dropt.Dropt;

import mods.pyrotech.BrickCrucible;
import mods.pyrotech.IroncladAnvil;
import mods.pyrotech.GraniteAnvil;
import mods.pyrotech.PitKiln;

// Worktable removal
rh(<pyrotech:worktable_stone>);
rh(<pyrotech:worktable>);
hc("pyrotech.worktable");

val itemsToRemove as IItemStack[] = [
    <pyrotech:fossil_ore>,
    <pyrotech:dense_coal_ore>,
    <pyrotech:dense_nether_coal_ore>,
    <pyrotech:rock_netherrack>,
    <pyrotech:living_tar>,
    <pyrotech:material:32>,
    <pyrotech:rock>,
    <pyrotech:rock:1>,
    <pyrotech:rock:2>,
    <pyrotech:rock:3>,
    <pyrotech:rock:6>,
    <pyrotech:rock:8>,
    <pyrotech:rock:10>,
    <pyrotech:limestone>,
    <pyrotech:material:28>,
    // Cobblestones
    <pyrotech:cobblestone>,
    <pyrotech:cobblestone:1>,
    <pyrotech:cobblestone:2>,
    <pyrotech:cobblestone:3>,
];

for i in itemsToRemove { furnace.remove(i); rh(i); }
rh(<pyrotech:crude_hammer>);

// Stone Rod removal
h(<pyrotech:material:27>);
<ore:stickStone>.remove(<pyrotech:material:27>);

recipes.remove(<pyrotech:sawmill_blade_stone>);
recipes.addShaped(<pyrotech:sawmill_blade_stone>,
   [[<ore:rocks>, <ore:rocks> , <ore:rocks>],
    [<ore:rocks>, <ore:stones>, <ore:rocks>],
    [<ore:rocks>, <ore:rocks> , <ore:rocks>]]);

recipes.remove(<pyrotech:flint_and_tinder>);
recipes.addShapeless(<pyrotech:flint_and_tinder>, [<pyrotech:material:10>, <pyrotech:material:13>, <divergentunderground:rock_stone>]);

furnace.remove(<pyrotech:material:22>);

furnace.remove(<minecraft:stone:5>, <pyrotech:cobblestone>);
furnace.remove(<minecraft:stone:3>, <pyrotech:cobblestone:1>);
furnace.remove(<minecraft:stone:1>, <pyrotech:cobblestone:2>);

val clayLump = <pyrotech:material:17>;

// Torch
val coal = <minecraft:coal> | <minecraft:coal:1> | <geolosys:coal:1> | <geolosys:coal:2> | <geolosys:coal:3> | <pyrotech:material:21>;

rh(<pyrotech:torch_stone>);
recipes.remove(<pyrotech:torch_fiber>);
recipes.addShaped(<pyrotech:torch_fiber>, [[coal], [<ore:stickWood>]]);
<ore:torch>.add(<pyrotech:torch_fiber>);

Dropt.list("torch")
  .add(Dropt.rule()
      .matchBlocks(["pyrotech:torch_fiber:*"])
      .addDrop(Dropt.drop()
        .force()
        .items([<minecraft:stick>]) // 100% Sticks
      )
      .addDrop(Dropt.drop()
        .selector(Dropt.weight(50))
        .items([<pyrotech:material:21>]) // 50% drop coal pieces
      )
      .addDrop(Dropt.drop()
        .selector(Dropt.weight(50)) // drop nothing else 50% of time
      )
  );

// Milk compat
<ore:listAllmilk>.add(<pyrotech:bucket_clay:1>);
<ore:listAllmilk>.add(<pyrotech:bucket_wood:1>);
<ore:listAllmilk>.add(<pyrotech:bucket_stone:1>);

// Wood Pile
recipes.remove(<pyrotech:log_pile>);
recipes.addShaped(<pyrotech:log_pile>,
   [[<ore:firewood>, <ore:firewood>, <ore:firewood> ],
    [<ore:firewood>, <ore:firewood>, <ore:firewood> ],
    [<ore:firewood>, <ore:firewood>, <ore:firewood> ]]);
furnace.setFuel(<pyrotech:log_pile>, 480);

// Masonry Brick
recipes.addShapedMirrored(<pyrotech:material:16>,
   [[null       , clayLump    ],
    [<ore:rocks>, <ore:rocks> ]]);

// Stone Hammer
recipes.remove(<pyrotech:stone_hammer>);
recipes.addShaped(<pyrotech:stone_hammer>, [
    [<ore:rocks>    , <ore:rocks>         ],
    [<ore:stickWood>, <ore:rocks>.reuse() ]
]);


// Refractory
val refracLump  = <pyrotech:material:35>;
val refracBrick = <pyrotech:material:5>;
val refracBlock = <pyrotech:refractory_brick_block>;

recipes.remove(<pyrotech:brick_kiln>);
recipes.remove(<pyrotech:brick_oven>);
recipes.remove(<pyrotech:brick_sawmill>);
recipes.remove(<pyrotech:brick_crucible>);
recipes.remove(<pyrotech:bloomery>);

// Kiln
recipes.addShaped(<pyrotech:brick_kiln>,
   [[refracBrick, refracLump  , refracBrick ],
    [refracLump , null        , refracLump  ],
    [refracBrick, refracBlock , refracBrick ]]);
// Oven
recipes.addShaped(<pyrotech:brick_oven>,
   [[refracBrick, refracBrick , refracBrick ],
    [refracLump , null        , refracLump  ],
    [refracBrick, refracBlock , refracBrick ]]);
// Sawmill
recipes.addShaped(<pyrotech:brick_sawmill>,
   [[refracBrick, null        , refracBrick ],
    [refracLump , null        , refracLump  ],
    [refracBrick, refracBlock , refracBrick ]]);
// Crucible
recipes.addShaped(<pyrotech:brick_crucible>,
   [[refracBrick, null        , refracBrick ],
    [refracLump , refracLump  , refracLump  ],
    [refracBrick, refracBlock , refracBrick ]]);
// Bloomery
recipes.addShaped(<pyrotech:bloomery>,
   [[refracBrick, null        , refracBrick ],
    [refracBrick, null        , refracBrick ],
    [refracBrick, refracBlock , refracBrick ]]);


// Stone
val masonryBrick = <pyrotech:material:16>;
val masonryBlock = <pyrotech:stone_bricks>;

recipes.remove(<pyrotech:stone_kiln>);
recipes.remove(<pyrotech:stone_oven>);
recipes.remove(<pyrotech:stone_sawmill>);
recipes.remove(<pyrotech:stone_crucible>);

// Kiln
recipes.addShaped(<pyrotech:stone_kiln>,
   [[masonryBrick , clayLump    , masonryBrick  ],
    [clayLump     , null        , clayLump      ],
    [masonryBrick , masonryBlock, masonryBrick  ]]);
// Oven
recipes.addShaped(<pyrotech:stone_oven>,
   [[masonryBrick , masonryBrick  , masonryBrick],
    [clayLump     , null        , clayLump      ],
    [masonryBrick , masonryBlock, masonryBrick  ]]);
// Sawmill
recipes.addShaped(<pyrotech:stone_sawmill>,
   [[masonryBrick , null        , masonryBrick  ],
    [clayLump     , null        , clayLump      ],
    [masonryBrick , masonryBlock, masonryBrick  ]]);
// Crucible
recipes.addShaped(<pyrotech:stone_crucible>,
   [[masonryBrick , null        , masonryBrick  ],
    [clayLump     , clayLump    , clayLump      ],
    [masonryBrick , masonryBlock, masonryBrick  ]]);


// Soaking Pot
recipes.remove(<pyrotech:soaking_pot>);
recipes.addShaped(<pyrotech:soaking_pot>,
   [[<ore:lumber> , masonryBrick, <ore:lumber>  ],
    [masonryBrick , clayLump    , masonryBrick  ],
    [<ore:lumber> , masonryBrick, <ore:lumber>  ]]);

// Compacting Bin
recipes.remove(<pyrotech:compacting_bin>);
recipes.addShaped(<pyrotech:compacting_bin>,
   [[masonryBrick , <ore:lumber>, masonryBrick  ],
    [<ore:lumber> , null        , <ore:lumber>  ],
    [masonryBrick , <ore:lumber>, masonryBrick  ]]);

// Bellows
recipes.remove(<pyrotech:bellows>);
recipes.addShaped(<pyrotech:bellows>,
   [[<ore:lumber> , masonryBrick    , <ore:lumber>  ],
    [<ore:leather>, <ore:leather>   , <ore:leather> ],
    [masonryBrick , masonryBrick    , masonryBrick  ]]);


val boatFix as IIngredient[IItemStack] = {
    <minecraft:boat>            : <contenttweaker:lumber_vanilla_oak>     ,
    <minecraft:spruce_boat>     : <contenttweaker:lumber_vanilla_spruce>  ,
    <minecraft:birch_boat>      : <contenttweaker:lumber_vanilla_birch>   ,
    <minecraft:jungle_boat>     : <contenttweaker:lumber_vanilla_jungle>  ,
    <minecraft:acacia_boat>     : <contenttweaker:lumber_vanilla_acacia>  ,
    <minecraft:dark_oak_boat>   : <contenttweaker:lumber_vanilla_dark_oak>
};

for output, input in boatFix {
    recipes.remove(output);
    recipes.addShaped(output,
       [[input, null, input],
        [input, input, input]]);
}

val tongsFix as IIngredient[IItemStack] = {
    <pyrotech:tongs_stone>      : <pyrotech:material:16>,
    <pyrotech:tongs_flint>      : <pyrotech:material:10>,
    <pyrotech:tongs_bone>       : <pyrotech:material:11>,
    <pyrotech:tongs_iron>       : <pyrotech:material:19>,
    <pyrotech:tongs_gold>       : <pyrotech:material:34>,
    <pyrotech:tongs_diamond>    : <pyrotech:material:18>,
    <pyrotech:tongs_obsidian>   : <pyrotech:material:33>
};

for output, input in tongsFix {
    recipes.remove(output);
    recipes.addShaped(output,
       [[null           , input         , null  ],
        [<ore:rodStone> , input         , input ],
        [null           , <ore:rodStone>, null  ]]);
}

val cogFix as IIngredient[IItemStack] = {
    <pyrotech:cog_stone>    : <ore:rocks>           ,
    <pyrotech:cog_flint>    : <pyrotech:material:10>,
    <pyrotech:cog_bone>     : <pyrotech:material:11>
};

for output, input in cogFix {
    recipes.remove(output);
    recipes.addShaped(output,
       [[input, input         , input ],
        [input, <ore:rodStone>, input ],
        [input, input         , input ]]);
}


recipes.remove(<pyrotech:shelf_stone>);
recipes.remove(<pyrotech:stash_stone>);
recipes.remove(<pyrotech:crate_stone>);
recipes.remove(<pyrotech:mechanical_hopper>);
recipes.remove(<pyrotech:mechanical_bellows>);
recipes.remove(<pyrotech:mechanical_compacting_bin>);
recipes.remove(<pyrotech:mechanical_mulch_spreader>);

val treatLumber = <contenttweaker:treated_wood_lumber>;

// Durable Shelf
recipes.addShaped(<pyrotech:shelf_stone> * 2,
   [[masonryBrick, treatLumber     , masonryBrick  ],
    [treatLumber , <pyrotech:shelf>, treatLumber   ],
    [masonryBrick, treatLumber     , masonryBrick  ]]);

// Durable Stash
recipes.addShaped(<pyrotech:stash_stone> * 2,
   [[masonryBrick, treatLumber     , masonryBrick  ],
    [treatLumber , <pyrotech:stash>, treatLumber   ],
    [masonryBrick, treatLumber     , masonryBrick  ]]);

// Durable Crate
recipes.addShaped(<pyrotech:crate_stone> * 2,
   [[masonryBrick, treatLumber     , masonryBrick  ],
    [treatLumber , <pyrotech:crate>, treatLumber   ],
    [masonryBrick, treatLumber     , masonryBrick  ]]);

// Mechanical Hopper
recipes.addShaped(<pyrotech:mechanical_hopper>,
   [[masonryBrick, null            , masonryBrick  ],
    [treatLumber , <ore:rodStone>  , treatLumber   ],
    [null        , masonryBrick     , null         ]]);

// Mechanical Bellows
recipes.addShaped(<pyrotech:mechanical_bellows>,
   [[treatLumber   , <minecraft:piston>, treatLumber    ],
    [<ore:rodStone>, <pyrotech:bellows>, <ore:rodStone> ],
    [treatLumber   , null              , treatLumber    ]]);

// Mechanical Compacting Bin
recipes.addShapedMirrored(<pyrotech:mechanical_compacting_bin>,
   [[masonryBrick                , treatLumber, masonryBrick       ],
    [<pyrotech:mechanical_hopper>, null       , <minecraft:piston> ],
    [masonryBrick                , treatLumber, masonryBrick       ]]);

// Mechanical Mulch Spreader
recipes.addShaped(<pyrotech:mechanical_mulch_spreader>,
   [[masonryBrick                , treatLumber, masonryBrick                 ],
    [<pyrotech:mechanical_hopper>, null       , <pyrotech:mechanical_hopper> ],
    [masonryBrick                , treatLumber, masonryBrick                 ]]);


// Drying Rack
recipes.remove(<pyrotech:drying_rack:1>);
recipes.addShaped(<pyrotech:drying_rack:1>,
   [[<ore:stickWood>, <ore:stickWood>, <ore:stickWood> ],
    [<ore:lumber>   , null           , <ore:lumber>    ],
    [<ore:stickWood>, null           , <ore:stickWood> ]]);

// Composting Bin
recipes.remove(<pyrotech:compost_bin>);
recipes.addShaped(<pyrotech:compost_bin>,
   [[<ore:stickWood>, null           , <ore:stickWood> ],
    [<ore:stickWood>, <ore:stickWood>, <ore:stickWood> ],
    [<ore:lumber>   , null           , <ore:lumber>    ]]);
