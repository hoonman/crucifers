import ./macros/example.mcm



function load{
    execute as @a run say reloaded!
    scoreboard objectives add timer dummy
    scoreboard objectives add timer2 dummy

    scoreboard objectives add raycast.use minecraft.used:minecraft.carrot_on_a_stick
    scoreboard objectives add sneak minecraft.custom:minecraft.sneak_time

    scoreboard objectives add shakal.hemorrhage minecraft.custom:damage_dealt
    scoreboard objectives add shakal.visceral minecraft.used:minecraft.carrot_on_a_stick
    scoreboard objectives add shakal.clicked minecraft.used:minecraft.carrot_on_a_stick
    scoreboard objectives add shakal.hold minecraft.used:minecraft.carrot_on_a_stick

    scoreboard objectives add xyneth.radiate minecraft.used:minecraft.carrot_on_a_stick

    


}

function tick{
    
    #execute as @a run function template:timer
    execute as @a[scores={raycast.use=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002999}}}] at @s anchored eyes run function template:cruiser
    execute as @a[scores={raycast.use=1..},tag=!sneaking,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002999}}}] at @s anchored eyes run function template:raycast
    execute as @a[scores={sneak=1..}] run scoreboard players set @s sneak 0

    execute as @a[scores={shakal.hemorrhage=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s run function template:hemorrhage
    execute as @a[scores={shakal.visceral=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s anchored eyes positioned ~ ~-0.5 ~ run function template:visceral4
    execute as @a[scores={shakal.clicked=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s anchored eyes positioned ~ ~-0.5 ~ run function template:timer
    execute as @a[scores={shakal.hold=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s run function template:shakalhold

    execute as @a[scores={xyneth.radiate=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}}] at @s run function template:radiate
    execute at @e[type=item,nbt={Item:{id:"minecraft:netherite_sword",Count:1b}}] if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:8b}},distance=..1] run function template:getshakal

}

function getshakal{
    playsound entity.wither.spawn hostile @s ~ ~ ~ 50 0
    playsound entity.wither.spawn voice @a ~ ~ ~ 50 0
    execute as @s at @s run playsound entity.wither.spawn ambient @s ~ ~ ~ 50 0
    particle dust 0 0 0 1 ~ ~ ~ 7 7 7 0.0001 400 normal 
    kill @e[type=item,distance=..3]
    summon item ~ ~ ~ {Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"Shakal","color":"dark_red","italic":false}',Lore:['{"text":"Heletha\'s blood forged into a","color":"gray","italic":false}','{"text":"sword. Its reeking smell is a","color":"gray","italic":false}','{"text":"reminder of the slaughter that","color":"gray","italic":false}','{"text":"the blade is responsible for.","color":"gray","italic":false}']},Unbreakable:1b,Damage:8,CustomModelData:2002001,AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:8,Operation:0,UUID:[I;2109495668,-1705227843,-1113968743,-227232755],Slot:"mainhand"},{AttributeName:"generic.knockback_resistance",Name:"generic.knockback_resistance",Amount:10,Operation:0,UUID:[I;-517673160,58740607,-2099330525,-243429035],Slot:"mainhand"},{AttributeName:"generic.armor",Name:"generic.armor",Amount:30,Operation:0,UUID:[I;-608258823,-601732334,-1514724207,-2071094845],Slot:"mainhand"},{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:1000,Operation:0,UUID:[I;1517072118,561990803,-1904397061,645258998],Slot:"mainhand"}]}}}
}

function radiate{
    say radiate activated
    execute as @s at @s run particle minecraft:block minecraft:slime_block ~ ~1 ~ 3 3 3 0.001 20 normal 
    execute as @s at @s run particle minecraft:spore_blossom_air ~ ~1 ~ 3 2 3 0.001 50 normal 
    execute as @s run tag @s add user

    execute as @e[tag=!user,distance=..7] run effect give @s wither 10 7 true
    execute as @e[tag=!user,distance=..7] run effect give @s nausea 10 3 true
    execute as @e[tag=!user,distance=..7] run effect give @s poison 10 7 false
    #playsound entity.slime.attack ambient @s ~ ~ ~ 

    tag @s remove user
    
    
}

function visceral2{
    say visceral v2
    kill @e[tag=fin]
    tag @s add user

    scoreboard players add @s timer 1
    execute if entity @s[scores={timer=20}] run tag @s add after
    execute if entity @s[scores={timer=..20}] run tag @s remove after
    execute as @s at @s run summon armor_stand ^ ^ ^1.8 {Tags:["fin"],NoGravity:1}
    execute as @s at @s if entity @s[scores={timer=20}] run summon armor_stand ^ ^ ^3.3 {Tags:["fin"],NoGravity:1}

    execute as @e[tag=fin] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~ ~
    execute as @s run function template:finandtag

    playsound entity.wither.shoot ambient @s ~ ~ ~ 50 0

   # scoreboard players set @s shakal.visceral 0

   #separate tags to delinate the slash and the timer so while the timer runs continuously, we need the slash to happen only when we right click.
    execute if entity @s[tag=after] run scoreboard players set @s shakal.visceral 0
    tag @s remove user
}


function finandtag{
    execute as @e[tag=fin] at @s facing ^1 ^ ^ positioned ^-0.7 ^ ^ run function template:shakal_fin
    execute as @s run tag @s add shakalFirst
    #scoreboard players set @s timer 0
}

function visceral4{
    say visceralv4
    kill @e[tag=fin]
    kill @e[tag=fin2]

    tag @s add user
    execute as @s at @s run summon armor_stand ^ ^ ^1.8 {Tags:["fin"],NoGravity:1,Invisible:1b} 
    #fix the invisible issue where you can't v.s. in the same location as you did since the armor stand is invisible in front of the exact place where the user just used v.s.
    #above issue kinda fixed since fin armorstand gets killed after 8 ticks

    execute as @e[tag=fin] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~ ~
    execute as @e[tag=fin] at @s facing ^1.8 ^ ^ positioned ^-0.7 ^ ^ run function template:shakal_fin
    #damage
    execute as @e[tag=!user] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run effect give @s instant_damage 1 1 true
    execute as @e[tag=!user] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run effect give @s instant_health 1 1 true
    playsound entity.wither.shoot ambient @s ~ ~ ~ 50 0

    scoreboard players set @s shakal.visceral 0
}

function timer{
    scoreboard players add @a timer 1
    
    execute if entity @s[scores={timer=2}] as @e[tag=fin] at @s run summon armor_stand ^ ^ ^1.8 {Tags:["fin2"],NoGravity:1}
    execute as @e[tag=fin2] at @s rotated as @e[tag=fin] run tp @s ~ ~ ~ ~ ~
    execute as @e[tag=fin] at @e[tag=fin2] facing ^1.8 ^ ^ positioned ^-0.7 ^ ^ run function template:shakal_fin
    execute if entity @e[tag=fin2,distance=..10] run kill @e[tag=fin2]

    execute if entity @s[scores={timer=4}] as @e[tag=fin] at @s run summon armor_stand ^ ^ ^3.6 {Tags:["fin3"],NoGravity:1}
    execute as @e[tag=fin3] at @s rotated as @e[tag=fin] run tp @s ~ ~ ~ ~ ~
    execute as @e[tag=fin] at @e[tag=fin3] facing ^1.8 ^ ^ positioned ^-0.7 ^ ^ run function template:shakal_fin
    execute if entity @e[tag=fin3,distance=..10] run kill @e[tag=fin3]

    execute if entity @s[scores={timer=6}] as @e[tag=fin] at @s run summon armor_stand ^ ^ ^5.4 {Tags:["fin3"],NoGravity:1}
    execute as @e[tag=fin3] at @s rotated as @e[tag=fin] run tp @s ~ ~ ~ ~ ~
    execute as @e[tag=fin] at @e[tag=fin3] facing ^1.8 ^ ^ positioned ^-0.7 ^ ^ run function template:shakal_fin
    execute if entity @e[tag=fin3,distance=..10] run kill @e[tag=fin3]

    execute if entity @s[scores={timer=7}] run kill @e[tag=fin]

    execute if entity @s[scores={shakal.clicked=2..}] run scoreboard players set @s timer 0
    execute if entity @s[scores={shakal.clicked=2..}] run scoreboard players set @s shakal.clicked 1
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


