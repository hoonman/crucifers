import ./macros/example.mcm



function load{
    execute as @a run say reloaded!
    scoreboard objectives add timer dummy
    scoreboard objectives add timer2 dummy
    scoreboard objectives add gravity dummy
    scoreboard objectives add exsan.sound dummy

    scoreboard objectives add visceral.rot1 dummy
    scoreboard objectives add visceral.rot2 dummy

    
    scoreboard objectives add raycast.use minecraft.used:minecraft.carrot_on_a_stick
    scoreboard objectives add sneak minecraft.custom:minecraft.sneak_time

    scoreboard objectives add shakal.hemorrhage minecraft.custom:damage_dealt
    scoreboard objectives add shakal.attacked minecraft.custom:damage_dealt
    scoreboard objectives add shakal.visceral minecraft.used:minecraft.carrot_on_a_stick
    scoreboard objectives add shakal.clicked minecraft.used:minecraft.carrot_on_a_stick
    scoreboard objectives add shakal.hold minecraft.used:minecraft.carrot_on_a_stick

    scoreboard objectives add xyneth.radiate minecraft.used:minecraft.carrot_on_a_stick
    team add scrutinized 
    team modify scrutinized color dark_red

    data merge storage minecraft:rot1 {rot1:1f}
    data merge storage minecraft:rot2 {rot2:1f}
}

function tick{
    # execute as @a[scores={raycast.use=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002999}}}] at @s anchored eyes run function template:cruiser
    # execute as @a[scores={raycast.use=1..},tag=!sneaking,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002999}}}] at @s anchored eyes run function template:raycast
    
    execute as @a[scores={shakal.hemorrhage=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s run function template:hemorrhage
    execute as @a[scores={shakal.visceral=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s anchored eyes positioned ~ ~-0.5 ~ run function template:exsan
    #execute as @a[scores={shakal.visceral=1..},tag=!sneaking,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s anchored eyes positioned ~ ~-0.5 ~ run function template:visceral4
    execute as @a[scores={shakal.visceral=1..},tag=!sneaking,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s anchored eyes positioned ~ ~-0.5 ~ run function template:visceral5

    #execute as @a[scores={shakal.clicked=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s anchored eyes positioned ~ ~-0.5 ~ run function template:timer
    execute as @a[scores={shakal.clicked=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s anchored eyes positioned ~ ~-0.5 ~ run function template:timer2
    
    execute as @a[tag=shakalhold,nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}]}] run function template:scrutinize
    execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}]}] unless entity @s[tag=shakalhold] run function template:shakalhold
    execute as @a[scores={sneak=1..}] run scoreboard players set @s sneak 0

    execute as @a[scores={xyneth.radiate=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}}] at @s run function template:radiate
    execute at @e[type=item,nbt={Item:{id:"minecraft:netherite_sword",Count:1b}}] if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:8b}},distance=..1] run function template:getshakal

}

function visceral5{
    say visceral 5
    #scoreboard players add @s timer 1
    tag @s add user
    tag @a[tag=user] add shakal.toggler
    kill @e[tag=vis]
    #tag @s add user
    #execute as @a[tag=user] at @s anchored eyes positioned ^ ^-0.5 ^1 run function template:shakal_fin_new
    #summon skeleton ~ ~ ~ {NoAI:1b,Silent:1b,ActiveEffects:[{Id:14,Amplifier:0,Duration:100}]}
    summon armor_stand ~ ~ ~ {NoAI:1b,Silent:1b,NoGravity:1b,Invisible:1b,Invulnerable:1b}
    
   # tag @e[type=skeleton,distance=..1] add vis 
    tag @e[type=armor_stand,distance=..1] add vis 
    #effect give @e[tag=vis] minecraft:invisibility 10 0 true
    execute as @s store result score @s visceral.rot1 run data get entity @s Rotation[0] 1
    execute as @s store result score @s visceral.rot2 run data get entity @s Rotation[1] 1

    execute store result storage minecraft:rot1 rot1 float 1 run scoreboard players get @a[tag=user,limit=1] visceral.rot1
    execute store result storage minecraft:rot2 rot2 float 1 run scoreboard players get @a[tag=user,limit=1] visceral.rot2

    execute as @e[tag=!user] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run effect give @s instant_damage 1 1 true
    execute as @e[tag=!user] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run effect give @s wither 1 1 true
    execute as @e[tag=!user] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run effect give @s instant_health 1 1 true

    data modify entity @e[limit=1,tag=vis] Rotation[0] set from storage minecraft:rot1 rot1
    data modify entity @e[limit=1,tag=vis] Rotation[1] set from storage minecraft:rot2 rot2
    playsound entity.wither.shoot ambient @s ~ ~ ~ 50 0

    # #store the direction that the user was facing & the rotation in a scoreboard. and apply it to the functions that come after.

    scoreboard players set @s shakal.visceral 0

}

function timer2{
    scoreboard players add @e[tag=vis] timer 1
    
    execute as @e[scores={timer=1},tag=vis,limit=1] at @s anchored eyes positioned ^ ^ ^1 run function template:shakal_fin_new

    execute as @e[scores={timer=2},tag=vis,limit=1] at @s anchored eyes positioned ^ ^ ^2.5 run function template:shakal_fin_new

    execute as @e[scores={timer=4},tag=vis,limit=1] at @s anchored eyes positioned ^ ^ ^4 run function template:shakal_fin_new

    execute as @e[scores={timer=6},tag=vis,limit=1] at @s anchored eyes positioned ^ ^ ^5.5 run function template:shakal_fin_new

    execute as @e[scores={timer=7},tag=vis] at @s run kill @s

    #execute if entity @s[scores={timer=7}] run kill @e[tag=fin] 
    execute as @a[scores={timer=100}] run tag @s remove shakal.toggler
    execute as @e[tag=vis] if entity @s[scores={timer=150..}] run scoreboard players set @s timer 0
   
    

    execute if entity @s[scores={shakal.clicked=2..}] run scoreboard players set @s timer 0
    execute if entity @s[scores={shakal.clicked=2..}] run scoreboard players set @e[tag=vis] timer 0
    execute if entity @s[scores={shakal.clicked=2..}] run scoreboard players set @s shakal.clicked 1
}

function remove{
    tag @s remove user
}

function shakalhold{
    say tagged shakalhold
    tag @s add shakalhold
}

function exsan{
    execute as @s run tag @s add sneaking
    say exsanguinate

    playsound minecraft:entity.wither.death ambient @s ~ ~ ~ 1 0.9
    playsound minecraft:block.lava.pop ambient @s ~ ~ ~ 50 0.3
    execute as @s run schedule function template:exsan_sound 2.5s replace
 
    execute as @a[tag=user] at @s anchored eyes positioned ~ ~1 ~ run function template:exsan_symbol

    execute as @e[tag=!user] facing entity @e[tag=user] eyes run data modify entity @s Motion[0] set value 0.7d
    execute as @e[tag=!user] facing entity @e[tag=user] eyes run data modify entity @s Motion[1] set value 0.5d
    execute as @e[tag=!user] facing entity @e[tag=user] eyes run data modify entity @s Motion[2] set value 0.0d

    execute as @s run tag @s remove sneaking
    scoreboard players set @s sneak 0
    scoreboard players reset @e
}

function exsan_sound{
    say hi
    scoreboard players add @e[tag=user] exsan.sound 1
    playsound minecraft:block.lava.pop voice @e[tag=user,type=player] ~ ~ ~ 50 0.3
    #execute as @s at @s run playsound minecraft:block.lava.pop ambient @s ~ ~ ~ 50 0.3 
    execute as @e[tag=user,scores={exsan.sound=..20}] unless entity @a[scores={exsan.sound=20}] run schedule function template:exsan_sound 0.1s replace
    execute as @e[tag=user,scores={exsan.sound=20..}] run scoreboard players set @e[tag=user] exsan.sound 0 
}

function exsan_symbol{
    kill @e[tag=symbol_exsan]
    execute as @s at @s run summon armor_stand ~ ~ ~ {Tags:["symbol_exsan"],NoGravity:1,Invisible:1b}
    execute as @e[tag=symbol_exsan] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~90 ~
    execute as @e[tag=symbol_exsan] run data modify entity @s Motion[0] set value 90.0f
    #execute as @e[tag=symbol_exsan] at @s facing ^0.1 ^ ^ positioned as @a[tag=user] positioned ^-3.54 ^ ^ run function template:shakal_face
    execute as @e[tag=user] at @s positioned ^ ^0.5 ^ run function template:shakal_face_new
    kill @e[tag=symbol_exsan]
}

function scrutinize{
    say scrutinize
    #execute if entity @e[team=scrutinized] as @e[team=scrutinized] run say second time.. what to do?
    execute as @s run tag @s add user
    execute as @e[tag=!user,type=!item,type=!item_frame,tag=!vis] run function template:scrutinize_effect
    execute as @a[tag=user] at @s anchored eyes positioned ~ ~1 ~ run function template:scru_symbol

    execute as @e[type=item] run data modify entity @s PickupDelay set value 0
    execute as @s run team leave @s
    execute as @s run tag @s remove shakalhold
}

function scru_symbol{
    kill @e[tag=symbol]
    execute as @s at @s run summon armor_stand ~ ~ ~ {Tags:["symbol"],NoGravity:1,Invisible:1b}
    execute as @e[tag=symbol] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~90 ~
    execute as @e[tag=symbol] run data modify entity @s Motion[0] set value 90.0f
    execute as @e[tag=symbol] at @s facing ^0.1 ^ ^ positioned as @a[tag=user] positioned ^-1 ^2 ^ run function template:scrutinize_symbol
    execute as @e[tag=symbol] at @s facing ^0.1 ^ ^ positioned as @a[tag=user] positioned ^-2 ^1 ^ run function template:scrutinize_symbol_medium
    execute as @e[tag=symbol] at @s facing ^0.1 ^ ^ positioned as @a[tag=user] positioned ^-3 ^ ^ run function template:scrutinize_symbol_big
    kill @e[tag=symbol]
}

function scrutinize_effect{
    playsound minecraft:entity.wither.spawn ambient @a ~ ~ ~ 10 0
    
    # kill @e[tag=symbol]
    # execute as @a[tag=user] at @s run summon armor_stand ^ ^ ^1.8 {Tags:["symbol"],NoGravity:1}
    # execute as @e[tag=symbol] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~ ~
    # execute as @e[tag=symbol] at @s facing ^1.8 ^ ^ positioned ^-0.7 ^ ^ run function template:scrutinize_symbol
    


    execute as @s run team join scrutinized @s
    #execute as @s run data modify entity @s NoAI set value 1b
    execute as @s run data modify entity @s Rotation[1] set value 180f
    execute as @s run data modify entity @s NoGravity set value 1b
    execute as @s run data remove entity @s HandItems[0]
    execute as @s run tag @s add hurt
    execute as @s run scoreboard players set @s shakal.hemorrhage 0
    execute as @s run function template:hem_bleeding
    execute run schedule function template:removegravity 8.0s append

    execute as @e[tag=hurt] if entity @e[scores={shakal.hemorrhage=8..}] run tag @s remove hurt

    execute as @s run effect give @s blindness 8 8
    execute as @s run effect give @s glowing 8 8
    execute as @s run effect give @s hunger 8 8
    execute as @s run effect give @s levitation 1 0
    execute as @s run effect give @s mining_fatigue 8 8
    execute as @s run effect give @s night_vision 8 8
    execute as @s run effect give @s nausea 8 8
    execute as @s run effect give @s slow_falling 8 8
    execute as @s run effect give @s slowness 8 8
    execute as @s run effect give @s unluck 8 8
    execute as @s run effect give @s weakness 8 8
}

function removegravity{
    execute as @e[team=scrutinized] run data modify entity @s NoGravity set value 0b
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
    execute as @e[scores={xyneth.radiate=2..}] run scoreboard players reset @s
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

    # execute as @a[scores={shakal.attacked=1..}] run tag @s remove salvage3
    # execute as @a[scores={shakal.attacked=1..}] run tag @s remove salvage2
    # execute as @a[scores={shakal.attacked=1..}] run tag @s remove salvage1
    # execute as @a[scores={shakal.attacked=1..}] run scoreboard players set @s shakal.attacked 0

    #execute if entity @s[scores={timer=200..}] as @e[tag=user] run scoreboard players set @s timer 0

    # execute if entity @s[scores={timer=30}] as @e[tag=user,tag=!salvage1] run effect give @s strength 10 0 true
    # execute if entity @s[scores={timer=30}] as @e[tag=user,tag=!salvage1] run effect give @s speed 10 0 true
    # execute if entity @s[scores={timer=30}] as @e[tag=user] run tag @s add salvage1

    # execute if entity @s[scores={timer=90}] as @e[tag=user,tag=salvage1,tag=!salvage3] run effect give @s strength 10 1 true
    # execute if entity @s[scores={timer=90}] as @e[tag=user,tag=salvage1,tag=!salvage3] run effect give @s speed 10 1 true
    # execute if entity @s[scores={timer=90}] as @e[tag=user,tag=salvage1,tag=!salvage3] run tag @s add salvage2

    # execute if entity @s[scores={timer=150}] as @e[tag=user,tag=salvage2] run effect give @s strength 10 2 true
    # execute if entity @s[scores={timer=150}] as @e[tag=user,tag=salvage2] run effect give @s speed 10 2 true
    # execute if entity @s[scores={timer=150}] as @e[tag=user,tag=salvage2] run tag @s add salvage3

    execute if entity @s[scores={shakal.clicked=2..}] run scoreboard players set @s timer 0
    execute if entity @s[scores={shakal.clicked=2..}] run scoreboard players set @s shakal.clicked 1
}

function salvage{
    say hi
    execute if entity @s[scores={timer=10}] as @e[tag=user] run effect give @s strength 10 0 true
    execute if entity @s[scores={timer=10}] as @e[tag=user] run effect give @s speed 10 0 true


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
    #execute if entity @e[scores={shakal.hemorrhage=8..}] run scoreboard players reset @e
    execute if entity @e[scores={shakal.hemorrhage=8..}] run scoreboard players set @a shakal.hemorrhage 0
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

    execute as @e[type=!player,distance=..7] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run kill @s
    execute positioned ^ ^ ^1 if block ~ ~ ~ air run function template:cruiser
    #playsound item.firecharge.use ambient @s ~ ~ ~ 0.5 1
    playsound entity.dragon_fireball.explode ambient @s ~ ~ ~ 0.5 1

    execute as @s run tag @s remove sneaking
    scoreboard players set @s sneak 0
    scoreboard players reset @e
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
