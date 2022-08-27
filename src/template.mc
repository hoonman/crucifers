import ./macros/example.mcm



function load{
    execute as @a run say reloaded!
    scoreboard objectives add timer dummy
    scoreboard objectives add raycast.use minecraft.used:minecraft.carrot_on_a_stick
    scoreboard objectives add sneak minecraft.custom:minecraft.sneak_time

    scoreboard objectives add shakal.hemorrhage minecraft.custom:damage_dealt
    scoreboard objectives add shakal.visceral minecraft.used:minecraft.carrot_on_a_stick

    scoreboard objectives add xyneth.radiate minecraft.used:minecraft.carrot_on_a_stick
}

function tick{
    execute as @a[scores={raycast.use=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002999}}}] at @s anchored eyes run function template:cruiser
    execute as @a[scores={raycast.use=1..},tag=!sneaking,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002999}}}] at @s anchored eyes run function template:raycast
    execute as @a[scores={sneak=1..}] run scoreboard players set @s sneak 0

    execute as @a[scores={shakal.hemorrhage=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s run function template:hemorrhage
    execute as @a[scores={shakal.visceral=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s run function template:visceral

    execute as @a[scores={xyneth.radiate=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}}] at @s run function template:radiate

}

function radiate{
    say radiate activated
    execute as @s at @s run particle minecraft:block minecraft:slime_block ~ ~1 ~ 3 3 3 0.001 20 normal 
    execute as @s at @s run particle minecraft:spore_blossom_air ~ ~1 ~ 3 2 3 0.001 50 normal 
    playsound entity.slime.attack ambient @s ~ ~ ~ 
}

function visceral{
    say visceral e
    execute as @s at @s run summon armor_stand ~1 ~ ~-3 {Tags:["fin2"],Rotation:[90.0f,0.0f],NoGravity:1}
    execute as @e[tag=fin2] positioned ^ ^ ^3 run function template:shakal_fin
    kill @e[tag=fin2]
    scoreboard players reset @e
}

function hemorrhage{
    execute as @s run function template:hem_sound
    execute as @s run function template:hem_particle
    scoreboard players reset @e
}

function hem_sound{
    stopsound @s player minecraft:entity.player.attack.strong
    stopsound @s player minecraft:entity.player.attack.crit
    execute as @s at @s run playsound minecraft:block.metal.break block @s
    execute as @s at @s run block{
        playsound minecraft:block.metal.break block @s
        playsound minecraft:block.metal.break block @s
        playsound minecraft:block.metal.break block @s
        playsound minecraft:block.metal.break block @s
        playsound minecraft:block.metal.break block @s
        playsound minecraft:block.metal.break block @s
    }

}

function hem_particle{
    execute as @e[nbt={HurtTime:10s}] at @s run particle minecraft:block minecraft:redstone_wire ~ ~1.24 ~ 0.1 0.1 0.1 0.001 50 normal
    tag @e[nbt={HurtTime:10s}] add hurt
    scoreboard players set @e[tag=hurt, nbt={HurtTime:10s}] shakal.hemorrhage 0
    execute as @e[nbt={HurtTime:10s}] at @s run function template:hem_bleeding
    scoreboard players reset @a
    scoreboard players reset @e
}

function hem_bleeding{
    scoreboard players add @e[tag=hurt] shakal.hemorrhage 1
    execute if entity @e[tag=hurt,scores={shakal.hemorrhage=..8}] run schedule function template:hem_bleeding 0.7s replace
    execute if entity @e[tag=hurt,scores={shakal.hemorrhage=8..}] run tag @e[tag=hurt] remove hurt
    execute if entity @e[scores={shakal.hemorrhage=8..}] run scoreboard players reset @e
    execute as @e[tag=hurt] at @s run effect give @s instant_damage 1 1 true
    execute as @e[tag=hurt] at @s run effect give @s instant_health 1 1 true
    execute as @e[tag=hurt] at @s run particle minecraft:block minecraft:redstone_wire ~ ~1.24 ~ 0.1 0.1 0.1 0.001 50 normal
        execute if entity @e[tag=hurt] as @p at @s run block{
        playsound minecraft:block.metal.break block @s
        playsound minecraft:block.metal.break block @s
        playsound minecraft:block.metal.break block @s
        playsound minecraft:block.metal.break block @s
        playsound minecraft:block.metal.break block @s
        playsound minecraft:block.metal.break block @s
        playsound minecraft:block.metal.break block @s
        playsound minecraft:block.metal.break block @s
    }
}

function cruiser{
    execute as @s run tag @s add sneaking
    say infernal cruiser

    particle flame ~ ~ ~ 0 0 0 0.1 30 
    particle large_smoke ~ ~ ~ 0 0 0 0.01 5
    particle lava ~ ~ ~ 0 0 0 0.01 5

    #execute as @e[type=!player,distance=..5] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..5] at @s run setblock ~ ~ ~ fire
    execute as @e[type=!player,distance=..5] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..5] at @s run playsound entity.generic.explode ambient @a ~ ~ ~
    execute as @e[type=!player,distance=..5] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..5] at @s run function template:explode

    execute as @e[type=!player,distance=..7] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run kill @s
    execute positioned ^ ^ ^1 if block ~ ~ ~ air run function template:cruiser
    #playsound item.firecharge.use ambient @s ~ ~ ~ 0.5 1
    playsound entity.dragon_fireball.explode ambient @s ~ ~ ~ 0.5 1

    execute as @s run tag @s remove sneaking
    scoreboard players set @s sneak 0
    scoreboard players reset @e
}

function explode
{
    say explode
}
function raycast{
    say tipped fire
    #particle flame ~ ~ ~ 0 0 0 0.01 10
    particle flame ~ ~ ~ 0 0 0 0 1
    #execute as @e[type=!player,distance=..2] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..2] at @s run setblock ~ ~ ~ fire

    execute as @e[type=!player,distance=..2] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..2] run effect give @s instant_damage 1 1 true
    execute as @e[type=!player,distance=..2] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..2] run effect give @s instant_health 1 1 true

    execute positioned ^ ^ ^1 if block ~ ~ ~ air run function template:raycast
    playsound entity.arrow.shoot ambient @s ~ ~ ~ 0.5 2
    
    scoreboard players reset @e
}

function raycast2{
    say infernal
    #add tags
    scoreboard players reset @e
}


