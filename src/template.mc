import ./macros/example.mcm



function load{
    execute as @a run say reloaded!
    scoreboard objectives add health dummy

    scoreboard objectives add timer dummy
    scoreboard objectives add timer2 dummy
    scoreboard objectives add gravity dummy
    scoreboard objectives add exsan.sound dummy
    scoreboard objectives add radiate_timer dummy
    scoreboard objectives add skulls_timer dummy
    scoreboard objectives add contam_timer dummy
    scoreboard objectives add putre_timer dummy

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
    scoreboard objectives add xyneth.skulls minecraft.used:minecraft.carrot_on_a_stick
    scoreboard objectives add xyneth.skulls_clicked minecraft.used:minecraft.carrot_on_a_stick

    scoreboard objectives add werejix.timer minecraft.used:minecraft.carrot_on_a_stick
    scoreboard objectives add werejix.ragged minecraft.custom:damage_dealt
    scoreboard objectives add werejix.ragged.attacked dummy
    scoreboard objectives add feral.timer dummy
    scoreboard objectives add stim.timer dummy

    scoreboard objectives add carrot.use minecraft.used:minecraft.carrot_on_a_stick
    scoreboard objectives add carrot.use2 minecraft.used:minecraft.carrot_on_a_stick
    scoreboard objectives add carrot.dmg minecraft.custom:damage_dealt
    scoreboard objectives add carrot.timer dummy
    scoreboard objectives add rhakal.sweep dummy
    scoreboard objectives add flight.timer dummy


    #scoreboard objectives add jump minecraft.custom:jump

    #knockback scoreboards
    scoreboard objectives add motion_x1 dummy
    scoreboard objectives add motion_y1 dummy
    scoreboard objectives add motion_z1 dummy

    scoreboard objectives add motion_x2 dummy
    scoreboard objectives add motion_y2 dummy
    scoreboard objectives add motion_z2 dummy
    
    team add scrutinized 
    team modify scrutinized color dark_red
    team add noCollision
    team modify noCollision collisionRule never

    data merge storage minecraft:rot1 {rot1:1f}
    data merge storage minecraft:rot2 {rot2:1f}
}

function tick{
    # execute as @a[scores={raycast.use=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002999}}}] at @s anchored eyes run function template:cruiser
    # execute as @a[scores={raycast.use=1..},tag=!sneaking,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002999}}}] at @s anchored eyes run function template:raycast
    
    execute as @e run function template:health
    execute as @a[scores={shakal.hemorrhage=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s run function template:hemorrhage
    execute as @a[scores={shakal.visceral=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s anchored eyes positioned ~ ~-0.5 ~ run function template:exsan
    execute as @a[scores={shakal.visceral=1..},tag=!sneaking,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s anchored eyes positioned ~ ~-0.5 ~ run function template:visceral5

    execute as @a[scores={shakal.clicked=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}}] at @s anchored eyes positioned ~ ~-0.5 ~ run function template:timer2
    
    execute as @a[tag=shakalhold,nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}]}] run function template:scrutinize
    execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002001}}]}] unless entity @s[tag=shakalhold] run function template:shakalhold

    execute as @a[tag=xynethhold,nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}]}] run function template:putrefaction
    execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}]}] unless entity @s[tag=xynethhold] run function template:xynethhold



    #execute as @a[scores={sneak=1..}] run scoreboard players set @s sneak 0

    execute as @a[scores={xyneth.radiate=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}}] at @s run function template:radiate
    execute as @a[scores={xyneth.skulls_clicked=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}}] at @s run function template:contaminate
    execute as @a[scores={xyneth.skulls=1..},tag=!sneaking,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}}] at @s run function template:skulls
    #execute as @a[scores={xyneth.skulls_clicked=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}}] at @s run function template:skulls_timer
    
    execute as @a[scores={xyneth.skulls_clicked=1..},tag=!sneaking,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002002}}}] at @s run function template:lingering
    execute at @e[type=item,nbt={Item:{id:"minecraft:netherite_sword",Count:1b}}] if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:8b}},distance=..1] run function template:getshakal
    execute at @e[type=item,nbt={Item:{id:"minecraft:netherite_axe",Count:1b}}] if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:8b}},distance=..1] run function template:getxyneth
    execute at @e[type=item,nbt={Item:{id:"minecraft:netherite_shovel",Count:1b}}] if entity @e[type=item,nbt={Item:{id:"minecraft:netherite_ingot",Count:8b}},distance=..1] run function template:getwerejix

    execute as @a[scores={werejix.ragged=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}}] at @s run function template:ragged
    execute as @a[scores={werejix.timer=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}}] at @s run function template:hovering_armor
    execute as @a[scores={werejix.timer=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}}] at @s run function template:stimulus
    execute as @a[scores={werejix.timer=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}}] at @s run function template:stimulus_sound
    execute as @a[scores={werejix.timer=1..,sneak=0},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}}] run scoreboard players set @s stim.timer 0
    execute as @a[tag=werejixhold,nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}]}] run function template:feral_rage
    execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}]}] unless entity @s[tag=werejixhold] run function template:werejixhold

    #knockback template
    #execute as @e[nbt={HurtTime:10s},tag=!hover,tag=!user,team=!scrutinized,tag=!hurt] at @s rotated as @p run function template:apply_motion


    execute as @a[tag=rhakalhold,nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002011}}]}] at @s run function template:awaken 
    execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002011}}]}] unless entity @s[tag=rhakalhold] run function template:rhakalhold

    execute as @a[tag=rhakalhold2,nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}]}] at @s run function template:revert 
    execute as @a[nbt={Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}]}] unless entity @s[tag=rhakalhold2] run function template:rhakalhold2

    execute as @a[scores={carrot.dmg=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] at @s run function template:scythe

    execute as @a[scores={carrot.dmg=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002011}}}] at @s run function template:pound 
    execute as @a[scores={carrot.use=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002011}}}] at @s run function template:lunge 

    execute as @a[tag=!sneaking,scores={carrot.use=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] at @s run function template:hovering_rhakal

    execute as @a[tag=!sneaking,scores={carrot.use2=1..,sneak=0},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] unless entity @s[tag=scythe] at @s run function template:blink

    execute as @a[scores={carrot.use2=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] unless entity @s[tag=scythe] at @s run function template:doom_portal
    execute as @a[scores={sneak=0}] run scoreboard players set @s flight.timer 0

    execute as @a[scores={carrot.use=1..,sneak=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] unless entity @s[tag=scythe] at @s run function template:flight
    
    execute as @a if entity @a[tag=Air] run tag @a remove Air

    execute as @a[scores={sneak=1..}] run scoreboard players set @s sneak 0

}

function apply_motion_rhakal{
    say apply
    execute store result score @s motion_x1 run data get entity @s Pos[0] 1000
    execute store result score @s motion_y1 run data get entity @s Pos[1] 1000
    execute store result score @s motion_z1 run data get entity @s Pos[2] 1000

    tp @s ^ ^ ^0.1
    execute store result score @s motion_x2 run data get entity @s Pos[0] 1000
    execute store result score @s motion_y2 run data get entity @s Pos[1] 1000
    execute store result score @s motion_z2 run data get entity @s Pos[2] 1000

    #second becomes the "new"
    execute store result entity @s Motion[0] double 0.01 run scoreboard players operation @s motion_x2 -= @s motion_x1
    #execute store result entity @s Motion[1] double 0.01 run scoreboard players operation @s motion_y2 -= @s motion_y1
    data modify entity @s Motion[1] set value 2.8
    
    execute store result entity @s Motion[2] double 0.01 run scoreboard players operation @s motion_z2 -= @s motion_z1

    #tag @s add motion_added
}

function lunge{
    say lunge
    kill @e[tag=temp]

    scoreboard players set @s carrot.use 0
    scoreboard players set @s carrot.timer 0
    playsound entity.wither.shoot ambient @s ~ ~ ~ 1 2
    playsound entity.ender_dragon.ambient ambient @s ~ ~ ~ 1 0
    summon armor_stand ~ ~ ~ {Tags:["temp"],Invisible:1b}
    execute as @s at @s rotated as @s run tp @e[tag=temp] @s
    execute at @s rotated as @s as @e[tag=temp] run function template:apply_motion_rhakal
    execute as @s run schedule function template:lunge_repeat 0.1s replace
}

function lunge_repeat{
    scoreboard players add @a[tag=user] carrot.timer 1
    #execute as @a[tag=user] run tp @s @e[tag=temp,limit=1] 
    execute as @e[tag=temp] at @s rotated as @a[tag=user] run tp @a[tag=user] ~ ~ ~ ~ ~
    execute at @a[tag=user] if block ~ ~-1 ~ air run tag @a[tag=user] add Air
    execute as @a[tag=user,tag=!Air] run function template:lunge_effect
    #if armor stand is on the ground stop the timerd - summon entity where we expect the armor satnd to be. when it reaches it, we do something?

    execute as @e[tag=user] unless entity @a[tag=!Air] run schedule function template:lunge_repeat 0.1s replace
}

function lunge_effect{
    say on ground!
    execute at @a[tag=user] run playsound entity.iron_golem.death ambient @a[tag=user] ~ ~ ~ 1 2
    #playsound entity.zombie.attack_iron_door ambient @a ~ ~ ~ 0.3 0

    #execute as @a[tag=user] at @s run particle block dirt ~ ~1 ~ 10 2 10 0 300
    execute as @a[tag=user] at @s run particle block lapis_block ~ ~1 ~ 10 1 10 0 300
    #execute as @a[tag=user] at @s run particle lava ~ ~1 ~ 10 1 10 0 100
    execute as @a[tag=user] at @s run particle enchanted_hit ~ ~1 ~ 10 1 10 0 400
    execute as @a[tag=user] at @s if entity @e[tag=!user,distance=..10] run effect give @e[tag=!user,distance=..10] wither 1 1 true

}


function flight{
    say flight
    execute if entity @s[scores={flight.timer=100..}] run scoreboard players set @s flight.timer 0
    scoreboard players add @s flight.timer 1

    #charging sound until score = 20
    execute as @a[scores={sneak=0}] run scoreboard players set @s flight.timer 0

    execute if entity @s[scores={flight.timer=20..}] as @a[tag=user] unless entity @s[scores={sneak=0}] run function template:flying
    
}

function flying{
    say flying
    effect give @s slow_falling 1 1 true
    tp @s ^ ^ ^1
    execute as @a[scores={sneak=0}] run scoreboard players set @s flight.timer 0

    playsound entity.ender_dragon.flap ambient @a ~ ~ ~ 1 2

    #execute if entity @s[scores={sneak=0}] run scoreboard players set @s flight.timer 0
}

function doom_portal{
    say doom portal
    #kill @e[tag=portal]
    #kill @e[tag=portal2]
    tag @a[tag=user] add portalled

    scoreboard players set @s carrot.timer 0
    execute as @s run tag @s add sneaking
    playsound block.end_portal.spawn ambient @a ~ ~ ~ 1 0
    execute as @a[tag=user] rotated as @s at @s if entity @e[tag=portal] run summon armor_stand ^ ^ ^3 {Tags:["portal2"],NoGravity:1b,Invisible:1b}
    execute as @a[tag=user] rotated as @s at @s unless entity @e[tag=portal] run summon armor_stand ^ ^ ^3 {Tags:["portal"],NoGravity:1b,Invisible:1b}
    #execute as @e[tag=portal2,limit=1,sort=nearest] run kill @s
    execute as @e[tag=portal] unless entity @e[tag=portal2] at @s rotated as @a[tag=user] facing entity @a[tag=user] eyes run particle dust 0 0 0 1 ~ ~ ~ 3 5 3 0 800
    execute as @e[tag=portal2] at @s rotated as @a[tag=user] facing entity @a[tag=user] eyes run particle dust 0 0 0 1 ~ ~ ~ 3 5 3 0 800

    #execute as @e[tag=portal2,sort=furthest,limit=1] if entity @e[tag=portal2] run kill @s
    #execute as @e[tag=portal] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~ ~
    execute as @a[tag=user] run schedule function template:doom_repeat 0.1s replace

    # execute as @e[tag=portal] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~90 ~
    # execute as @e[tag=portal] run data modify entity @s Motion[0] set value 90.0f
    # execute as @e[tag=portal] at @s facing ^0.1 ^ ^ positioned as @s positioned ^ ^ ^ run function template:rhakal_portal

    execute as @e[tag=portal] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~90 ~
    execute as @e[tag=portal] run data modify entity @s Motion[0] set value 90.0f
    execute as @e[tag=portal2] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~90 ~
    execute as @e[tag=portal2] run data modify entity @s Motion[0] set value 90.0f

    scoreboard players set @s carrot.use2 0
    scoreboard players set @s sneak 0
    execute as @s run tag @s remove sneaking
 
}

function doom_repeat{
    say doom repeat
    scoreboard players add @a[tag=user] carrot.timer 1
    execute as @e[tag=portal] at @s facing ^0.1 ^ ^ positioned as @s positioned ^ ^ ^ run function template:rhakal_portal

    execute as @e[tag=portal2] at @s facing ^0.1 ^ ^ positioned as @s positioned ^ ^ ^ run function template:rhakal_portal

    execute as @a[tag=user] at @s if entity @e[tag=portal2,distance=..2] run function template:doom_teleport
    execute as @a[tag=user] at @s if entity @e[tag=portal,distance=..2] run function template:doom_teleport2


   # execute as @e[tag=portal2] at @s if entity @a[tag=user,distance=..2,tag=portalled] positioned ~ ~1 ~ run function template:doom_teleport
    #execute as @a[tag=user] if entity @e[tag=portal2,distance=..2] run tag @s add portalled

   # execute as @e[tag=portal] at @s if entity @a[tag=user,distance=..2,tag=portalled] positioned ~ ~1 ~ run function template:doom_teleport2

    execute as @a[scores={carrot.timer=100..}] unless entity @s[scores={carrot.timer=100..}] run scoreboard players set @s carrot.timer 0
    execute as @a[scores={carrot.timer=100}] run kill @e[tag=portal]
    execute as @a[scores={carrot.timer=100}] run kill @e[tag=portal2]
    
    execute as @a[scores={carrot.timer=..100}] run schedule function template:doom_repeat 0.1s replace

}

function doom_teleport{

    playsound block.end_portal.spawn ambient @a ~ ~ ~ 1 2
    tp @a[tag=user] @e[tag=portal,limit=1]

    #tp @a[tag=user] @e[tag=portal,limit=1]
    #tp @a[tag=user] ~ ~2 ~
    scoreboard players set @a[tag=user] carrot.timer 100
    tag @a remove portalled

    execute as @e[tag=portal] at @s positioned ~0.1 ~2 ~ run tp @a[tag=user] ~ ~ ~ ~-90 ~

    
    say portalled 1
    kill @e[tag=portal2]
}

function doom_teleport2{

    playsound block.end_portal.spawn ambient @a ~ ~ ~ 1 2
    tp @a[tag=user] @e[tag=portal2,limit=1]

    #tp @a[tag=user] ~ ~2 ~
    execute as @e[tag=portal2] at @s positioned ~0.1 ~2 ~ run tp @a[tag=user] ~ ~ ~ ~-90 ~
    #tp @a[tag=user] @e[tag=portal,limit=1]
    scoreboard players set @a[tag=user] carrot.timer 100
    tag @a remove portalled
    say p2        
    kill @e[tag=portal]
}

function blink{
    say blink2
    scoreboard players add @a[tag=user] carrot.use2 1
    #execute if block ~ ~ ~ air run tp @s ^ ^ ^3
    playsound entity.enderman.teleport ambient @a ~ ~ ~ 1 0

    particle firework ~ ~ ~ 0 0 0 0 1
    execute as @s at @s unless entity @s[scores={carrot.use2=10..}] run tp @s ^ ^0.01 ^1
    execute as @a[tag=user] at @s unless entity @s[scores={carrot.use2=10..}] run function template:blink
    execute as @a[scores={carrot.use2=10..}] run scoreboard players set @s carrot.use2 0
}

function hovering_rhakal{
    scoreboard players add @a[tag=user] carrot.use 1
    execute as @s at @s unless entity @e[tag=hover2] unless entity @a[tag=user,nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] run summon ghast ^ ^ ^-1 {NoGravity:1b,Tags:["hover2"],NoAI:1b,Silent:1b,Attributes:[{Name:"generic.armor",Base:9999f},{Name:"generic.knockback_resistance",Base:1000f},{Name:"generic.max_health",Base:1024f}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:false},{Id:11,Duration:10000,Amplifier:2,ShowParticles:0b}]}
    #execute as @s at @s unless entity @e[tag=hover2] unless entity @a[tag=user,nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] run summon ghast ^ ^ ^-1 {NoAI:1b,Silent:1b,Tags:["hover2"],ActiveEffects:[{Id:11,Duration:10000,Amplifier:2,ShowParticles:0b},{Id:14,Duration:10000,Amplifier:0,ShowParticles:0b}],Attributes:[{Name:"generic.max_health",Base:1024f}]}
    execute as @e[tag=hover2] rotated as @a[tag=user] at @a[tag=user] positioned ^ ^ ^4 run tp @s ~ ~ ~ ~-40 ~

    execute as @s[scores={carrot.use=..20}] run schedule function template:hovering_rhakal 0.1s replace
    execute as @e[tag=!user,distance=..5] run team join noCollision @s
    execute as @a[tag=user,scores={carrot.use=20..}] run scoreboard players set @s carrot.use 0
    execute as @a[tag=user] if entity @a[tag=user,nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] run function template:disappear
}

function scythe{
    say scythe
    tag @s add scythe
    stopsound @s player minecraft:entity.player.attack.strong
    stopsound @s player minecraft:entity.player.attack.crit
    stopsound @s player minecraft:entity.player.attack.nodamage
    stopsound @s player minecraft:entity.player.attack.weak
    #playsound entity.witch.throw ambient @a ~ ~ ~ 1 0
    playsound entity.wither.shoot ambient @a ~ ~ ~ 1 0 
    #playsound entity.drowned.shoot ambient @a ~ ~ ~ 1 0
    execute as @e[tag=hover2] rotated as @a[tag=user] positioned ^ ^ ^1.5 run tp @s ~ ~ ~ ~35 ~
    execute as @e[tag=hover2] at @s positioned ^ ^1 ^ unless entity @a[tag=user,scores={rhakal.sweep=1}] run function template:rhakal_fin_big3

    #execute as @e[tag=hover] at @s positioned ^ ^2 ^-4 run function template:rhakal_fin_big2
    execute as @e[tag=!user,distance=..6,type=!armor_stand,team=!scrutinized,tag=!hurt,tag=!hover2] at @s run function template:scythe_effect

    
    execute as @e[tag=hover2] if entity @a[tag=user,scores={rhakal.sweep=1}] rotated as @a[tag=user] positioned ^ ^ ^ run function template:rhakal_fin_big2
        scoreboard players add @s rhakal.sweep 1
    execute as @a[tag=user,scores={rhakal.sweep=2..}] run scoreboard players set @a[tag=user] rhakal.sweep 0
    tag @s remove scythe
    scoreboard players set @s carrot.dmg 0
}

function scythe_effect{
    execute as @s run effect give @s minecraft:wither 1 1 true
    execute as @s run effect give @s minecraft:instant_damage 1 1 true
    execute as @s run effect give @s minecraft:instant_health 1 1 true
    execute as @s at @s rotated as @p run function template:apply_motion
}
function rhakalhold{
    say rhakalhold
    tag @s add rhakalhold
}

function rhakalhold2{
    say rhakalhold2
    tag @s add rhakalhold2
}
function awaken{
    say awaken
    playsound minecraft:block.enchantment_table.use ambient @a ~ ~ ~ 1 2
    particle dust 0 0.698 0.996 1 ~ ~1 ~ 0.7 0 0.7 0 400 

    item replace entity @s weapon with carrot_on_a_stick{CustomModelData:2002004,AttributeModifiers:[{AttributeName:"generic.armor",Amount:30,Slot:mainhand,Name:"generic.armor",UUID:[I;-12288,18974,185218,-37948]},{AttributeName:"generic.attack_damage",Amount:7,Slot:mainhand,Name:"generic.attack_damage",UUID:[I;-12288,19074,185218,-38148]},{AttributeName:"generic.attack_speed",Amount:1000,Slot:mainhand,Name:"generic.attack_speed",UUID:[I;-12288,19174,185218,-38348]},{AttributeName:"generic.knockback_resistance",Amount:100,Slot:mainhand,Name:"generic.knockback_resistance",UUID:[I;-12288,19274,185218,-38548]},{AttributeName:"generic.max_health",Amount:20.0,Slot:mainhand,Name:"generic.max_health",UUID:[I;-12288,19374,185218,-38748]}],display:{Name:'[{"text":"Rhakal","italic":false,"color":"aqua"}]',Lore:['[{"text":"Scythe form","italic":false,"color":"dark_gray"},{"text":"","italic":false,"color":"dark_purple"}]','[{"text":"A grand scythe edged with six","italic":false,"color":"gray"}]','[{"text":"blades. It serves as a gateway","italic":false,"color":"gray"}]','[{"text":"between dimensions.","italic":false,"color":"gray"}]']}}
    kill @e[type=item,limit=1,distance=..3]

    execute as @s run tag @s remove rhakalhold
}


function revert{
    say revert 
    execute as @e[type=item] run data modify entity @s PickupDelay set value 0
    playsound minecraft:block.anvil.land ambient @a ~ ~ ~ 0.1 0
    item replace entity @s weapon with carrot_on_a_stick{CustomModelData:2002011,AttributeModifiers:[{AttributeName:"generic.armor",Amount:10,Slot:mainhand,Name:"generic.armor",UUID:[I;-12288,32474,185218,-64948]},{AttributeName:"generic.attack_damage",Amount:10,Slot:mainhand,Name:"generic.attack_damage",UUID:[I;-12288,32574,185218,-65148]},{AttributeName:"generic.attack_speed",Amount:1000,Slot:mainhand,Name:"generic.attack_speed",UUID:[I;-12288,32674,185218,-65348]},{AttributeName:"generic.knockback_resistance",Amount:100,Slot:mainhand,Name:"generic.knockback_resistance",UUID:[I;-12288,32774,185218,-65548]},{AttributeName:"generic.max_health",Amount:8,Slot:mainhand,Name:"generic.max_health",UUID:[I;-12288,32874,185218,-65748]}],display:{Name:'[{"text":"Rhakal","italic":false,"color":"aqua"}]',Lore:['[{"text":"Mace form","italic":false,"color":"dark_gray"},{"text":"","italic":false,"color":"dark_purple"}]','[{"text":"A grand mace edged with six","italic":false,"color":"gray"}]','[{"text":"blades. It serves as a gateway","italic":false,"color":"gray"}]','[{"text":"between dimensions.","italic":false,"color":"gray"}]']}}
    kill @e[type=item,limit=1,distance=..3]

    particle dust 0 0.2 0.753 1 ~ ~1 ~ 0.3 0 0.3 0 400 
    execute as @s run tag @s remove rhakalhold2
}

function pound{
    say pound
    #playsound entity.zombie.attack_iron_door ambient @a ~ ~ ~ 0.3 0
    playsound minecraft:entity.blaze.hurt ambient @a ~ ~ ~ 1 0
    execute as @e[tag=!user,nbt={HurtTime:10s},limit=1,distance=..5] at @s run function template:pound_effect 
    scoreboard players set @s carrot.dmg 0
}

function pound_effect{
    say i'm pounded :(
    effect give @s weakness 3 4
    #particle block brown_stained_glass ~ ~ ~ 1 1 1 0 40
    particle block lapis_block ~ ~1.8 ~ 0.2 0.2 0.2 0 100
    execute as @s at @s rotated as @p run function template:apply_motion

}

function stimulus_sound{
    say stimulus sound
    execute as @s[scores={stim.timer=1}] run playsound entity.spider.death ambient @a ~ ~ ~ 200 0
    scoreboard players add @s stim.timer 1
    execute as @s[scores={sneak=0}] run scoreboard players set @s stim.timer 0
}

function apply_motion{
    say apply
    execute store result score @s motion_x1 run data get entity @s Pos[0] 1000
    execute store result score @s motion_y1 run data get entity @s Pos[1] 1000
    execute store result score @s motion_z1 run data get entity @s Pos[2] 1000

    tp @s ^ ^ ^0.1
    execute store result score @s motion_x2 run data get entity @s Pos[0] 1000
    execute store result score @s motion_y2 run data get entity @s Pos[1] 1000
    execute store result score @s motion_z2 run data get entity @s Pos[2] 1000

    #second becomes the "new"
    execute store result entity @s Motion[0] double 0.005 run scoreboard players operation @s motion_x2 -= @s motion_x1
    #execute store result entity @s Motion[1] double 0.01 run scoreboard players operation @s motion_y2 -= @s motion_y1
    data modify entity @s Motion[1] set value 0.35
    
    execute store result entity @s Motion[2] double 0.005 run scoreboard players operation @s motion_z2 -= @s motion_z1

    #tag @s add motion_added
}

function feral_rage{
    say feral rage!
    effect give @s blindness 1 1 true
    playsound entity.ender_dragon.growl ambient @a ~ ~ ~ 200 0
    #execute as @a[tag=user] at @s run function template:garque_face
    scoreboard players set @a[tag=user] feral.timer 0
    execute as @e[type=item] run data modify entity @s PickupDelay set value 0
    execute as @s at @s positioned ~ ~1.4 ~ run function template:werejix_face
    execute as @a[tag=user] if entity @e[tag=!user] run schedule function template:feral_repeat 0.1s replace
    execute as @s run tag @s remove werejixhold

}

function feral_repeat{
    execute as @a[tag=user] run effect give @s haste 1 2 true
    execute as @a[tag=user] run effect give @s slow_falling 1 1 true
    #execute as @a[tag=user] positioned as @e[tag=!user,type=!armor_stand,tag=!hover,limit=1,sort=nearest] run tp @s ^3 ^ ^ ~90 ~
    execute as @a[tag=user] positioned as @e[tag=!user,type=!armor_stand,type=!item,type=!item_frame,tag=!hover,limit=1,sort=nearest] run tp @s ~3 ~ ~ ~90 ~
    execute as @e[tag=user,scores={feral.timer=..150}] unless entity @a[scores={feral.timer=150}] run schedule function template:feral_repeat 0.1s replace
    scoreboard players add @a[tag=user] feral.timer 1
}

function feral_rage_old{
    say feral rage
    scoreboard players set @a[tag=user] feral.timer 0
    execute as @a[tag=user] run tag @s remove voluntary
    execute as @e[type=item] run data modify entity @s PickupDelay set value 0
        #execute as @e[nbt={HurtTime:10s},tag=!hover,tag=!user,team=!scrutinized,tag=!hurt] at @s rotated as @p run function template:apply_motion
    execute as @a[tag=user] at @s rotated as @e[tag=!hover,tag=!user,distance=..5,limit=1] run function template:feral_apply_motion
    execute as @a[tag=user] if entity @e[tag=!user] run schedule function template:feral_repeat 0.1s replace
    execute as @s run tag @s remove werejixhold
}

function feral_repeat_old{
    say feral repeat
    #do user tp-ing here. "aimbot" happens here. need to tp the user in the respect of the enemy's x and z coords (not the y)

    execute as @a[tag=user] run effect give @s haste 1 2 true
    #execute as @a[tag=user] at @s rotated as @e[tag=!user,type=!armor_stand,distance=..5,tag=!hover] run tp @s ~ ~ ~ ~ ~
    execute as @e[tag=!user,type=!armor_stand,tag=!hover,limit=1] at @s run tp @a[tag=user] ^ ^0.1 ^5 ~180 ~
    execute as @e[tag=!user,type=!armor_stand,tag=!hover,limit=1] at @s run data modify entity @s Rotation[1] set value -40f
    execute as @e[tag=user,scores={feral.timer=..30}] unless entity @a[scores={feral.timer=30}] run schedule function template:feral_repeat 0.1s replace
    scoreboard players add @a[tag=user] feral.timer 1
}



function werejixhold{
    say tagged werejixhold
    tag @s add werejixhold
}



function stimulus{
    say stimulus
    execute as @a[tag=user] run tag @s remove voluntary
    #playsound minecraft:entity.spider.hurt ambient @a ~ ~ ~ 2 0
    #execute as @e[tag=!user,distance=..3] rotated as @a[tag=user] facing entity @a[tag=user] eyes at @s run tp @s ^ ^0.1 ^0.3
    execute as @e[tag=!user,distance=..5] run effect give @s wither 1 1 true
    
    execute as @a[tag=user] run effect give @s speed 1 5 true
    execute as @a[tag=user] run effect give @s invisibility 1 0 true
    execute as @a[tag=user] run particle ash ~ ~ ~ 0.5 1 0.5 0 300
    execute as @a[tag=user] run particle dust 0.62 0.62 0.145 1 ~ ~ ~ 0.2 1 0.2 0 50
    execute as @e[nbt={HurtTime:10s},type=!armor_stand,tag=!user,team=!scrutinized,tag=!hurt] at @s rotated as @p run function template:apply_motion

    #execute as @a[tag=user] 
    execute as @a[tag=user,scores={sneak=0}] run tag @s add voluntary
    
}

function hovering_armor{
    scoreboard players add @e[tag=user] werejix.timer 1
    execute as @a[tag=user,scores={werejix.timer=..20}] run tag @s add voluntary
    
    #execute as @a[tag=user] at @s unless entity @e[tag=hover] run summon armor_stand ^ ^ ^1 {NoGravity:1b,Tags:["hover"],Health:20}
    execute as @a[tag=user] at @s unless entity @e[tag=hover] unless entity @a[tag=user,nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}}] run summon ghast ^ ^ ^3 {NoGravity:1b,Tags:["hover"],NoAI:1b,Silent:1b,Attributes:[{Name:"generic.armor",Base:9999f},{Name:"generic.knockback_resistance",Base:1000f},{Name:"generic.max_health",Base:500f}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:false},{Id:11,Amplifier:255,Duration:1000000,ShowParticles:false}]}
    execute as @e[tag=hover] rotated as @a[tag=user] at @a[tag=user] positioned ^ ^ ^4 run tp @s ~ ~ ~ ~-40 ~

    execute as @a[tag=voluntary] if entity @a[tag=voluntary,nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}}] run schedule function template:voluntary 1s replace
    
    execute as @e[tag=user,scores={werejix.timer=..20}] run schedule function template:hovering_armor 0.1s replace
    execute as @e[tag=!user,distance=..5] run team join noCollision @s
    #execute as @e[tag=ragged] run effect give @s wither 1 1 true
    execute as @e[tag=user,scores={werejix.timer=20..}] run scoreboard players set @s werejix.timer 0
    execute as @a[tag=user] if entity @a[tag=user,nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002003}}}] run function template:disappear
}

function voluntary{
    say voluntary
    execute as @a[tag=voluntary] run effect give @s wither 1 1 true
    execute as @a[tag=voluntary] run schedule function template:voluntary 1s replace

}

function disappear{
    execute as @e[tag=hover] run tp @s ~ ~-200 ~
    execute as @e[tag=hover] run kill @s
    execute as @e[tag=hover2] run tp @s ~ ~-200 ~
    execute as @e[tag=hover2] run kill @s
    execute as @a[tag=user] run scoreboard players set @s werejix.timer 0
    execute as @a[tag=user] run scoreboard players set @s carrot.timer 0
    execute as @a[tag=user] run tag @s remove voluntary


}

function ragged{
    say ragged
    stopsound @a[tag=user] player minecraft:entity.player.attack.strong
    stopsound @a[tag=user] player minecraft:entity.player.attack.crit
    stopsound @a[tag=user] player minecraft:entity.player.attack.nodamage
    stopsound @a[tag=user] player minecraft:entity.player.attack.weak

    #/execute as @e[type=zombie] at @s rotated as @p run function template:apply_motion

    #idea: do facing an armorstand that i have in the back?

    #playsound entity.wither.shoot ambient @a ~ ~ ~ 0.7 2
    #playsound entity.player.attack.sweep ambient @a ~ ~ ~ 1 2
    execute as @a[tag=user] unless entity @s[scores={feral.timer=..150}] run playsound entity.wither.shoot ambient @a ~ ~ ~ 1 2
    execute as @a[tag=user] unless entity @s[scores={feral.timer=..150}] run playsound entity.player.attack.sweep ambient @a ~ ~ ~ 1 2

    execute as @a[tag=user] unless entity @s[scores={feral.timer=150..}] run playsound entity.ender_dragon.growl ambient @a ~ ~ ~ 0.5 2
 
    
    #playsound minecraft:entity.iron_golem.death ambient @a ~ ~ ~ 200 2
    #playsound minecraft:entity ambient @a ~ ~ ~ 200 2

    
    scoreboard players add @a[tag=user] werejix.ragged.attacked 1
    execute as @e[tag=hover] if entity @a[tag=user,scores={werejix.ragged.attacked=1}] rotated as @a[tag=user] positioned ^ ^ ^4 run tp @s ~ ~ ~ ~25 ~
    execute as @e[tag=hover] unless entity @a[scores={feral.timer=..150}] at @s positioned ^ ^2 ^-4 run function template:werejix_claw2
    execute as @e[tag=hover] unless entity @a[scores={feral.timer=..150}] at @s positioned ^1 ^2 ^-4 run function template:werejix_claw2
    execute as @e[tag=hover] unless entity @a[scores={feral.timer=..150}] at @s positioned ^-1 ^2 ^-4 run function template:werejix_claw2

    execute as @e[tag=hover] unless entity @a[scores={feral.timer=150..}] at @s positioned ^ ^2 ^-4 run function template:werejix_claw3
    execute as @e[tag=hover] unless entity @a[scores={feral.timer=150..}] at @s positioned ^1 ^2 ^-4 run function template:werejix_claw3
    execute as @e[tag=hover] unless entity @a[scores={feral.timer=150..}] at @s positioned ^-1 ^2 ^-4 run function template:werejix_claw3

   # execute as @e[tag=!user,distance=..4] at @s run effect give @s minecraft:instant_health 1 1 true
        #execute as @e[nbt={HurtTime:10s},type=!armor_stand,tag=!user,team=!scrutinized,tag=!hurt] at @s rotated as @p run function template:apply_motion

    execute as @e[tag=!user,distance=..5,type=!armor_stand,team=!scrutinized,tag=!hurt,tag=!hover] at @s run function template:ragged_effect
    execute as @e[tag=!user,distance=..4] at @s run tag @s add ragged

    scoreboard players set @a werejix.ragged 0
    execute as @a[tag=user,scores={werejix.ragged.attacked=2..}] run scoreboard players set @a[tag=user] werejix.ragged.attacked 0
}

function ragged_effect{
    execute as @s run effect give @s minecraft:wither 1 1 true
    execute as @s run effect give @s minecraft:instant_damage 1 1 true
    execute as @s run effect give @s minecraft:instant_health 1 1 true
    execute as @s at @s rotated as @p run function template:apply_motion
}

function putrefaction{
    say putrefaction
    kill @e[tag=putre]
    kill @e[tag=putre2]
    kill @e[tag=putre3]
    kill @e[tag=putre4]
    kill @e[tag=putre5]
    kill @e[tag=putre6]
    scoreboard players set @a[tag=user] putre_timer 0
    execute as @e[type=item] run data modify entity @s PickupDelay set value 0
    execute as @a[tag=user] at @s run summon minecraft:armor_stand ~ ~12 ~ {Tags:["putre"],Invisible:1b}
    #leap: execute as @a[tag=user] at @s run tp @s ~ ~12 ~
    execute as @e[tag=putre] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~90 ~
    execute as @e[tag=putre] run data modify entity @s Motion[0] set value 90.0f

    #execute as @e[tag=putre] at @s facing ^0.1 ^ ^ positioned as @a[tag=user] positioned ^ ^ ^3 run function template:xyneth_faceup_relativelocal
    execute as @a[tag=user] if entity @e[distance=..30,tag=!user] run schedule function template:putre_repeat 0.1s replace
    execute as @s run tag @s remove xynethhold
}

function putre_repeat{
    say putre repeat
    scoreboard players add @e[tag=user] putre_timer 1
    execute as @e[tag=user,scores={putre_timer=..11}] at @s run playsound minecraft:entity.zombie.attack_wooden_door ambient @a[tag=user] ~ ~ ~ 100 0
    execute as @e[tag=user,scores={putre_timer=11}] run playsound minecraft:entity.zombie.break_wooden_door ambient @a ~ ~ ~ 100 0
    execute as @e[tag=user,scores={putre_timer=11}] at @s run particle block lime_terracotta ~ ~ ~ 10 1 10 0 2000
    execute as @e[tag=user,scores={putre_timer=11}] at @s run particle dust 0.259 0.427 0.208 1 ~ ~ ~ 10 0 10 0 1000

    execute if entity @a[tag=user,scores={putre_timer=11}] as @e[distance=..30,type=!armor_stand,tag=!user,team=!scrutinized,tag=!hurt] at @s rotated as @p run function template:apply_motion
    
    #execute as @e[nbt={HurtTime:10s},type=!armor_stand,tag=!user,team=!scrutinized,tag=!hurt] at @s rotated as @p run function template:apply_motion

    #execute as @e[tag=user,scores={putre_timer=11}] at @s run particle  ~ ~ ~ 5 0 5 0 300
    execute as @a[tag=user] if entity @a[tag=user,scores={putre_timer=11}] at @a[tag=user] run summon armor_stand ~ ~ ~ {Tags:["putre2"],Invisible:1b} 
    execute as @a[tag=user] if entity @a[tag=user,scores={putre_timer=11}] at @a[tag=user] run summon armor_stand ~ ~ ~ {Tags:["putre3"],Invisible:1b} 
    execute as @a[tag=user] if entity @a[tag=user,scores={putre_timer=11}] at @a[tag=user] run summon armor_stand ~ ~ ~ {Tags:["putre4"],Invisible:1b} 
    execute as @a[tag=user] if entity @a[tag=user,scores={putre_timer=11}] at @a[tag=user] run summon armor_stand ~ ~ ~ {Tags:["putre5"],Invisible:1b} 
    execute as @a[tag=user] if entity @a[tag=user,scores={putre_timer=11}] at @a[tag=user] run summon armor_stand ~ ~ ~ {Tags:["putre6"],Invisible:1b} 

    execute as @e[tag=putre2] at @s facing entity @e[distance=..30,tag=!user,type=!armor_stand,type=!arrow,limit=1,sort=nearest] feet if entity @a[tag=user,scores={putre_timer=11..}] run tp @s ^1.5 ^ ^0.5
    execute as @e[tag=putre3] at @s facing entity @e[distance=..30,tag=!user,type=!armor_stand,type=!arrow,limit=1,sort=furthest] feet if entity @a[tag=user,scores={putre_timer=11..}] run tp @s ^-1.5 ^ ^0.5
    execute as @e[tag=putre4] at @s facing entity @e[distance=..30,tag=!user,type=!armor_stand,type=!arrow,limit=1,sort=random] feet if entity @a[tag=user,scores={putre_timer=11..}] run tp @s ^ ^ ^-0.5
    execute as @e[tag=putre5] at @s facing entity @e[distance=..30,tag=!user,type=!armor_stand,type=!arrow,limit=1,sort=nearest] feet if entity @a[tag=user,scores={putre_timer=11..}] run tp @s ^-1.5 ^ ^-0.5
    execute as @e[tag=putre6] at @s facing entity @e[distance=..30,tag=!user,type=!armor_stand,type=!arrow,limit=1,sort=furthest] feet if entity @a[tag=user,scores={putre_timer=11..}] run tp @s ^1.5 ^ ^-0.5

    execute if entity @a[tag=user,scores={putre_timer=11}] as @e[type=!armor_stand,tag=!user,distance=..30] at @s run particle block slime_block ~ ~ ~ 0 3 0 0 300
    execute if entity @a[tag=user,scores={putre_timer=11}] as @e[type=!armor_stand,tag=!user,distance=..30] at @s store result entity @s Health float 1 run scoreboard players remove @s health 10
    execute if entity @a[tag=user,scores={putre_timer=11}] as @e[type=!armor_stand,tag=!user,distance=..30] at @s run effect give @s wither 1 1 true
    execute as @e[tag=putre2] at @s run particle dust 0.251 1 0 1 ~ ~ ~ 0 0 0 0 30
    execute as @e[tag=putre3] at @s run particle dust 0.251 1 0 1 ~ ~ ~ 0 0 0 0 30
    execute as @e[tag=putre4] at @s run particle dust 0.251 1 0 1 ~ ~ ~ 0 0 0 0 30
    execute as @e[tag=putre5] at @s run particle dust 0.251 1 0 1 ~ ~ ~ 0 0 0 0 30
    execute as @e[tag=putre6] at @s run particle dust 0.251 1 0 1 ~ ~ ~ 0 0 0 0 30

    execute as @e[tag=user,scores={putre_timer=..30}] run scoreboard players set @s radiate_timer 1

   # execute as @e[tag=putre2] at @e[tag=!user,type=!armor_stand,limit=1] run particle block emerald_block ~ ~ ~ 0 5 0 0 400
    execute as @e[tag=putre] at @s facing ^0.1 ^ ^ positioned as @e[tag=putre] positioned ^ ^-2 ^3 run function template:xyneth_faceup_relativelocal
    execute as @e[tag=user,scores={putre_timer=30..}] run kill @e[tag=putre]
    execute as @e[tag=user,scores={putre_timer=..30}] unless entity @a[scores={putre_timer=30}] run schedule function template:putre_repeat 0.1s replace
    execute as @e[tag=user,scores={putre_timer=30..}] run kill @e[type=armor_stand]
    execute as @e[tag=user,scores={putre_timer=30..}] run scoreboard players set @e[tag=user] putre_timer 0 
}

function xynethhold{
    say tagged xynethhold
    tag @s add xynethhold
}

function health{
    execute as @s store result score @s health run data get entity @s Health
    #execute as @s store result entity @s Health float 1 run scoreboard players remove @s health 2
}

function contaminate{
    say contaminate
    kill @e[tag=contam]
    execute as @s run tag @s add sneaking
    execute as @s run tag @s remove sneaking

    #execute as @s run summon armor_stand ~ ~ ~ {NoGravity:1b,Tags:["contam"]}
    execute as @a[tag=user] run schedule function template:contam_timer 0.1s replace

    scoreboard players set @s sneak 0
    scoreboard players set @s xyneth.skulls 0
    scoreboard players set @s xyneth.skulls_clicked 0
}

function contam_timer{
    scoreboard players add @a[tag=user] contam_timer 1
    # execute as @a[tag=user,scores={contam_timer=1}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 1 0 1 0 100
    # execute as @a[tag=user,scores={contam_timer=2}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 2 0 2 0 150
    # execute as @a[tag=user,scores={contam_timer=3}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 3 0 3 0 200
    # execute as @a[tag=user,scores={contam_timer=4}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 4 0 4 0 250
    # execute as @a[tag=user,scores={contam_timer=5}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 5 0 5 0 300
    # execute as @a[tag=user,scores={contam_timer=6}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 6 0 6 0 400
    # execute as @a[tag=user,scores={contam_timer=7}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 7 0 7 0 800
    # execute as @a[tag=user,scores={contam_timer=8}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 8 0 8 0 1200
    # execute as @a[tag=user,scores={contam_timer=9}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 9 0 9 0 1500
    # execute as @a[tag=user,scores={contam_timer=10}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 10 0 10 0 2000
    execute as @a[tag=user,scores={contam_timer=1}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 2 0 2 0 100
    execute as @a[tag=user,scores={contam_timer=2}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 4 0 4 0 150
    execute as @a[tag=user,scores={contam_timer=3}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 6 0 6 0 200
    execute as @a[tag=user,scores={contam_timer=4}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 8 0 8 0 250
    execute as @a[tag=user,scores={contam_timer=5}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 10 0 10 0 300
    execute as @a[tag=user,scores={contam_timer=6}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 12 0 12 0 400
    execute as @a[tag=user,scores={contam_timer=7}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 14 0 14 0 800
    execute as @a[tag=user,scores={contam_timer=8}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 16 0 16 0 1200
    execute as @a[tag=user,scores={contam_timer=9}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 18 0 18 0 1500
    execute as @a[tag=user,scores={contam_timer=10}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 20 0 20 0 2000

    execute as @e[tag=!user,distance=..20,type=!armor_stand] at @s run say hi 
    execute as @e[tag=!user,distance=..20,type=!armor_stand] at @s run effect give @e[tag=!user,distance=..10] poison 3 100 false 
    execute as @e[tag=!user,distance=..20,type=!armor_stand] at @s run effect give @e[tag=!user,distance=..10] nausea 3 1 true 
    execute as @e[tag=!user,distance=..20,type=!armor_stand] at @s run effect give @e[tag=!user,distance=..10] wither 3 10 true 
    execute as @e[tag=user] at @e[tag=!user,type=!armor_stand,distance=..20] run particle dust 0.169 0.557 0.125 1 ~ ~1.8 ~ 0.3 0.3 0.3 0 100
    playsound minecraft:entity.iron_golem.death voice @e[tag=user,type=player] ~ ~ ~ 50 0
    execute as @e[tag=user,scores={contam_timer=..20}] run scoreboard players set @s radiate_timer 1
    execute as @e[tag=user,scores={contam_timer=..10}] unless entity @a[scores={contam_timer=10}] run schedule function template:contam_timer 0.1s replace
    execute as @e[tag=user,scores={contam_timer=10..}] run scoreboard players set @e[tag=user] contam_timer 0
}

function skulls{
    say skulls
    execute if entity @e[tag=!user,distance=30..] run say too far away!
    execute run function template:skulls_armor_stand
    execute if entity @s[scores={xyneth.skulls_clicked=2..}] run kill @e[tag=skulls,tag=skulls2]
    scoreboard players set @s xyneth.skulls 0
}

function skulls_armor_stand{
    kill @e[type=armor_stand]
    summon armor_stand ~ ~ ~ {NoAI:1b,Silent:1b,Tags:["skulls"],NoGravity:1b,Invisible:1b}
    summon armor_stand ~ ~ ~ {NoAI:1b,Silent:1b,Tags:["skulls2"],NoGravity:1b,Invisible:1b}
    summon armor_stand ~ ~ ~ {NoAI:1b,Silent:1b,Tags:["skulls3"],NoGravity:1b,Invisible:1b}
    summon armor_stand ~ ~ ~ {NoAI:1b,Silent:1b,Tags:["skulls4"],NoGravity:1b,Invisible:1b}
    summon armor_stand ~ ~ ~ {NoAI:1b,Silent:1b,Tags:["skulls5"],NoGravity:1b,Invisible:1b}
    summon armor_stand ~ ~ ~ {NoAI:1b,Silent:1b,Tags:["skulls6"],NoGravity:1b,Invisible:1b}
}

function skulls_timer{
    say teleported
    scoreboard players add @a[tag=user] skulls_timer 1

    execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run tp @s ^ ^ ^1
    #execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes positioned as @s run playsound entity.zombie.hurt player @a[tag=user] ~ ~ ~ 100 0
    execute at @e[tag=skulls2,limit=1] run playsound entity.zombie.hurt ambient @a[tag=user] ~ ~ ~ 1 0
    execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..3] wither 1 2 true
    execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..3] poison 1 3 false
    execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run tp @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..3] ^ ^1 ^-2
    execute as @e[tag=skulls2] at @s run particle dust 0.102 0.867 0.165 1 ~ ~ ~ 0.1 0.1 0.1 0.001 50 normal
    say did it run till here?
    #format: /execute as @s facing entity @e[type=ravager] eyes run tp hoonman ^ ^ ^1
    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=4}] run spreadplayers ~ ~ 1 2 false @e[tag=skulls]
    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=8}] run spreadplayers ~ ~ 1 2 false @e[tag=skulls]

    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=12}] run spreadplayers ~ ~ 1 2 false @e[tag=skulls]
    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=16}] run spreadplayers ~ ~ 1 2 false @e[tag=skulls]
    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=20}] run spreadplayers ~ ~ 1 4 false @e[tag=skulls]
    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=24}] run spreadplayers ~ ~ 1 4 false @e[tag=skulls]
    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=28}] run spreadplayers ~ ~ 1 4 false @e[tag=skulls]
    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=32}] run spreadplayers ~ ~ 1 6 false @e[tag=skulls]
    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=38}] run spreadplayers ~ ~ 1 6 false @e[tag=skulls]
    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=42}] run spreadplayers ~ ~ 1 6 false @e[tag=skulls]
    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=49}] run tp @s @e[type=!armor_stand,tag=!user,limit=1,distance=..30] 
    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=80..}] run kill @s 
    execute as @e[tag=skulls2] at @s if entity @a[tag=user,scores={skulls_timer=80..}] run kill @s

    #error: if we start this again before the first skull didn't completely stop (below 80? ) the skill stops midway
        say did it run till here? 2

    execute as @e[tag=user,scores={skulls_timer=80..}] run scoreboard players set @s skulls_timer 0
        say did it run till here? 3
    execute if entity @s[scores={xyneth.skulls_clicked=2..}] run scoreboard players set @s skulls_timer 0
    execute if entity @s[scores={xyneth.skulls_clicked=2..}] run scoreboard players set @s xyneth.skulls_clicked 1
}

function lingering{
    #say lingering 
    scoreboard players add @a[tag=user] skulls_timer 1
    #execute as @a[tag=user] if entity @s[scores={xyneth.skulls_clicked=1..}] run scoreboard players add @a[tag=user] skulls_timer 1
    execute as @e[tag=skulls2] at @s run particle dust 0.102 0.867 0.165 1 ~ ~-2 ~ 0.1 0.1 0.1 0.001 50 normal
    execute as @e[tag=skulls4] at @s run particle dust 0.157 0.502 0.184 1 ~ ~-2 ~ 0.1 0.1 0.1 0.001 50 normal
    execute as @e[tag=skulls6] at @s run particle dust 0.498 0.675 0.361 1 ~ ~-2 ~ 0.1 0.1 0.1 0.001 50 normal

    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=..30}] facing entity @e[limit=1,distance=..30,type=!armor_stand,tag=!user,sort=nearest] eyes run tp @s ^1 ^0.1 ^1
    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=30..40}] facing entity @e[limit=1,distance=..30,type=!armor_stand,tag=!user] eyes run tp @s ^1 ^ ^1

    execute as @e[tag=skulls3] at @s if entity @a[tag=user,scores={skulls_timer=..30}] facing entity @e[limit=1,distance=..30,type=!armor_stand,tag=!user,sort=nearest] eyes run tp @s ^-1 ^0.1 ^1
    execute as @e[tag=skulls3] at @s if entity @a[tag=user,scores={skulls_timer=30..40}] facing entity @e[limit=1,distance=..30,type=!armor_stand,tag=!user] eyes run tp @s ^1 ^ ^1
    
    execute as @e[tag=skulls5] at @s if entity @a[tag=user,scores={skulls_timer=..30}] facing entity @e[limit=1,distance=..30,type=!armor_stand,tag=!user,sort=nearest] eyes run tp @s ^ ^0.1 ^1
    execute as @e[tag=skulls5] at @s if entity @a[tag=user,scores={skulls_timer=30..40}] facing entity @e[limit=1,distance=..30,type=!armor_stand,tag=!user] eyes run tp @s ^1 ^ ^1

    # execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run tp @e[distance=..5,type=!armor_stand,tag=!user] ^ ^0.5 ^-2
    # execute as @e[tag=skulls4] at @s facing entity @e[tag=skulls] eyes run tp @e[distance=..5,type=!armor_stand,tag=!user] ^ ^0.5 ^-2
    # execute as @e[tag=skulls6] at @s facing entity @e[tag=skulls] eyes run tp @e[distance=..5,type=!armor_stand,tag=!user] ^ ^0.5 ^-2

    execute as @e[nbt={HurtTime:10s},type=!armor_stand,tag=!user,team=!scrutinized,tag=!hurt] at @s rotated as @p run function template:apply_motion
    #execute as @e[distance=..7,tag=!hover,tag=!user] at @s rotated as @p run function template:apply_motion

    execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..6] wither 1 7 true
    execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..6] poison 1 7 false

    execute as @e[tag=skulls4] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..6] wither 1 7 true
    execute as @e[tag=skulls4] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..6] poison 1 7 false

    execute as @e[tag=skulls6] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..6] wither 1 7 true
    execute as @e[tag=skulls6] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..6] poison 1 7 false
    
    execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run kill @e[tag=skulls]
    execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run kill @e[tag=skulls2]
    execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run kill @e[tag=skulls3]
    execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run kill @e[tag=skulls4]
    execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run kill @e[tag=skulls5]
    execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run kill @e[tag=skulls6]
    execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run scoreboard players set @s xyneth.skulls_clicked 0
    execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run scoreboard players set @a[tag=user] skulls_timer 0 
    execute at @e[tag=skulls2,limit=1] run playsound entity.zombie.hurt ambient @a[tag=user] ~ ~ ~ 1 0

    #execute as @e[tag=user,scores={skulls_timer=..40}] run scoreboard players set @s radiate_timer 1

    execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run tp @s ^ ^ ^1
    execute as @e[tag=skulls4] at @s facing entity @e[tag=skulls3] eyes run tp @s ^ ^ ^1
    execute as @e[tag=skulls6] at @s facing entity @e[tag=skulls5] eyes run tp @s ^ ^ ^1
    
    execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=4}] run spreadplayers ~ ~ 1 2 false @e[tag=skulls]

    execute as @e[tag=user,scores={skulls_timer=40..}] run scoreboard players set @s skulls_timer 0
    execute if entity @s[scores={xyneth.skulls_clicked=2..}] run scoreboard players set @s skulls_timer 0
    execute if entity @s[scores={xyneth.skulls_clicked=2..}] run scoreboard players set @s xyneth.skulls_clicked 1
    execute if entity @s[scores={xyneth.skulls_clicked=2..}] run kill @e[tag=skulls]
    execute if entity @s[scores={xyneth.skulls_clicked=2..}] run kill @e[tag=skulls2]
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
    execute as @s store result score @s visceral.rot1 run data get entity @s Rotation[0] 1
    execute as @s store result score @s visceral.rot2 run data get entity @s Rotation[1] 1

    execute store result storage minecraft:rot1 rot1 float 1 run scoreboard players get @a[tag=user,limit=1] visceral.rot1
    execute store result storage minecraft:rot2 rot2 float 1 run scoreboard players get @a[tag=user,limit=1] visceral.rot2

    #execute as @e[tag=!user] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run effect give @s instant_damage 1 1 true

    #execute as @e[tag=!user] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run effect give @s wither 1 1 true
    execute as @e[distance=..7,tag=!hover,tag=!user] positioned ~-0.99 ~-0.99 ~-0.99 at @s rotated as @p run function template:visceral_effect
    #execute as @e[distance=..7,tag=!hover,tag=!user] at @s rotated as @p run function template:apply_motion
    #execute as @e[tag=!user,type=wither] at @s positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run summon potion ^ ^2 ^ {Item:{id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:healing"}}}

    execute as @e[tag=!user,type=!armor_stand] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] store result entity @s Health float 1 run scoreboard players remove @s health 18

    #execute as @e[tag=!user,tag=!vis] if entity @s[distance=..7] facing entity @a[tag=user] feet at @s run tp @s ^ ^1.6 ^1
   # execute as @e[tag=!user] at @s if entity @s[distance=..2] facing entity @a[tag=user] eyes run tp @e[tag=!user,distance=..2,tag=!vis] ^ ^1.5 ^-2
    #format : execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run tp @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..3] ^ ^1 ^-2
    

    data modify entity @e[limit=1,tag=vis] Rotation[0] set from storage minecraft:rot1 rot1
    data modify entity @e[limit=1,tag=vis] Rotation[1] set from storage minecraft:rot2 rot2
    playsound entity.wither.shoot ambient @s ~ ~ ~ 50 0

    # #store the direction that the user was facing & the rotation in a scoreboard. and apply it to the functions that come after.

    scoreboard players set @s shakal.visceral 0

}

function visceral_effect{
    effect give @s wither 1 1 true
    execute run function template:apply_motion
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
    kill @e[tag=exsan]
    say exsanguinate
    #kill @e[tag=exsan]
    playsound minecraft:entity.wither.death ambient @s ~ ~ ~ 1 0.9
    execute as @e[tag=!user] at @s run effect give @s slowness 10 255 true
    playsound minecraft:block.lava.pop ambient @s ~ ~ ~ 50 0.3
    execute as @e[tag=!user,type=!arrow,type=!item,type=!item_frame,type=!armor_stand,distance=..20] at @s run summon armor_stand ~ ~0.1 ~ {Tags:["exsan"],ActiveEffects:[{Id:28,Duration:1000000,ShowParticles:true}],Invisible:1b,NoGravity:1b}

    execute as @a[tag=user] at @s if entity @e[distance=..20,tag=!user] run schedule function template:exsan_sound 2.5s replace


 
    execute as @a[tag=user] at @s anchored eyes positioned ~ ~1 ~ run function template:exsan_symbol

    #execute as @a[tag=user] at @s run function template:exsan_effect
    execute as @s run tag @s remove sneaking
    scoreboard players set @s sneak 0
    scoreboard players set @s shakal.visceral 0
}

function exsan_effect{
    say exsan effect
    
    execute as @e[tag=!user,type=!arrow,distance=..20] at @s run summon armor_stand ~ ~0.1 ~ {Tags:["exsan"],ActiveEffects:[{Id:28,Duration:1000000,ShowParticles:true}]}
    execute as @e[tag=!user,tag=exsan,distance=..20] at @s run function template:exsan_particles
    execute as @e[tag=!user,tag=exsan,distance=..20] at @s rotated as @a[tag=user] facing entity @a[tag=user] eyes run tp @s ^ ^5 ^1
}

function exsan_particles{
    execute as @s at @s run particle block redstone_block ~ ~ ~ 0.1 0.1 0.1 0.001 30 force
    execute as @e[tag=user,scores={exsan.sound=..20}] unless entity @a[scores={exsan.sound=20}] run schedule function template:exsan_particles 2t replace
}

function exsan_sound{
    say hi
    scoreboard players add @e[tag=user] exsan.sound 1
    playsound minecraft:block.lava.pop voice @e[tag=user,type=player] ~ ~ ~ 50 0.3
    #execute as @s at @s run playsound minecraft:block.lava.pop ambient @s ~ ~ ~ 50 0.3 
    #execute as @e[tag=exsan] at @s rotated as @a[tag=user] facing entity @a[tag=user] eyes run tp @e[tag=exsan] ^ ^1 ^1

    #format: /execute as @e[type=minecraft:armor_stand] at @s rotated as @a[tag=user] facing entity @a[tag=user] eyes run tp @s ^ ^1 ^1

    # execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=4}] run effect give @s instant_damage 1 1
    # execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=4}] run effect give @s instant_health 1 1
    # execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=4}] run effect give @s instant_health 1 1
    # execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=4}] run effect give @s saturation 1 1

    # execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=8}] run effect give @s instant_damage 1 1
    # execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=8}] run effect give @s instant_health 1 1
    # execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=8}] run effect give @s instant_health 1 1
    # execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=8}] run effect give @s saturation 1 1

    # execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=16}] run effect give @s instant_damage 1 1
    # execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=16}] run effect give @s instant_health 1 1
    # execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=16}] run effect give @s instant_health 1 1
    # execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=16}] run effect give @s saturation 1 1

    # execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=24}] run effect give @s instant_damage 1 1
    # execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=24}] run effect give @s instant_health 1 1
    # execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=24}] run effect give @s instant_health 1 1
    # execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=24}] run effect give @s saturation 1 1

    # execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=32}] run effect give @s instant_damage 1 1
    # execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=32}] run effect give @s instant_health 1 1
    # execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=32}] run effect give @s instant_health 1 1
    # execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=32}] run effect give @s saturation 1 1


    execute at @a[tag=user] as @e[distance=..20,tag=!user] if entity @a[tag=user,scores={exsan.sound=4..60}] run effect give @s wither 1 10
        # execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=4}] run effect give @s instant_health 1 1
    execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=4..60}] run effect give @s saturation 1 0 true
    execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=4..60}] run effect give @s instant_health 1 0 true

    execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=4..60}] store result entity @s Health float 1 run scoreboard players add @s health 1
    execute as @e[tag=!user,type=!armor_stand,distance=..20] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=4..60}] store result entity @s Health float 1 run scoreboard players remove @s health 1 

    #execute as @e[tag=!user,type=!armor_stand] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=4..60}] run summon minecraft:area_effect_cloud ~ ~ ~ {Radius:5f,Duration:6,Age:4,Effects:[{Id:20b,Amplifier:100b,Duration:1,ShowParticles:1b}]}
    #/execute as hoonman at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Radius:0f,Duration:6,Age:4,Effects:[{Id:20b,Amplifier:5b,Duration:1,ShowParticles:0b}]}
    #execute as @e[tag=!user] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run effect give @s wither 1 1 true
    
    #format: execute as @e[tag=!user,type=!armor_stand] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] store result entity @s Health float 1 run scoreboard players remove @s health 18

    execute as @e[tag=exsan] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=..60}] run tp @s ^ ^0.5 ^1
    #execute as @e[tag=exsan] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=30..}] run tp @s ^ ^ ^1


   #execute as @e[tag=!user,tag=exsan] at @s rotated as @a[tag=user] facing entity @a[tag=user] eyes run tp @s ^ ^-1 ^-1
    execute as @e[tag=exsan] at @s run particle block redstone_wire ~ ~ ~ 0.1 0.1 0.1 0.001 30 force

   # execute as @e[tag=user,scores={exsan.sound=..50}] at @e[tag=exsan] rotated as @s facing entity @s eyes run tp @e[tag=exsan] ^ ^1 ^0.001
    #execute as @e[tag=user,scores={exsan.sound=10..}] at @e[tag=exsan] rotated as @s facing entity @s eyes run tp @e[tag=exsan] ^ ^-1 ^

    execute as @e[tag=user,scores={exsan.sound=60..}] run kill @e[tag=exsan]
    execute as @e[tag=user,scores={exsan.sound=..60}] unless entity @a[scores={exsan.sound=60}] run schedule function template:exsan_sound 0.1s replace
    execute as @e[tag=user,scores={exsan.sound=60..}] run scoreboard players set @e[tag=user] exsan.sound 0 
}

function exsan_symbol{
    kill @e[tag=symbol_exsan]
    execute as @s at @s run summon armor_stand ~ ~ ~ {Tags:["symbol_exsan"],NoGravity:1,Invisible:1b}
    
    #execute as @e[tag=symbol_exsan] run data modify entity @s Motion[0] set value 90.0f
    #execute as @e[tag=symbol_exsan] at @s facing ^0.1 ^ ^ positioned as @a[tag=user] positioned ^-3.54 ^ ^ run function template:shakal_face
    execute as @e[tag=user] at @s positioned ^ ^0.5 ^ run function template:shakal_face_new
    kill @e[tag=symbol_exsan]
}

function scrutinize{
    say scrutinize
    #execute if entity @e[team=scrutinized] as @e[team=scrutinized] run say second time.. what to do?
    execute as @s run tag @s add user
    execute at @a[tag=user] as @e[tag=!user,type=!item,type=!item_frame,tag=!vis,type=!armor_stand,distance=..10] run function template:scrutinize_effect
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
    #execute as @e[team=scrutinized] run team leave @s
    execute as @e[team=scrutinized] run effect clear @s
    execute as @e[team=scrutinized] run schedule function template:remove_team 1.0s append

}

function remove_team{
    execute as @e[team=scrutinized] run team leave @s
    #execute as @e[team=scrutinized] run effect clear @s
}

function getshakal{
    playsound entity.wither.spawn hostile @s ~ ~ ~ 50 0
    playsound entity.wither.spawn voice @a ~ ~ ~ 50 0
    execute as @s at @s run playsound entity.wither.spawn ambient @s ~ ~ ~ 50 0
    particle dust 0 0 0 1 ~ ~ ~ 7 7 7 0.0001 400 normal 
    kill @e[type=item,distance=..3]
    summon item ~ ~ ~ {Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"Shakal","color":"dark_red","italic":false}',Lore:['{"text":"Heletha\'s blood forged into a","color":"gray","italic":false}','{"text":"sword. Its reeking smell is a","color":"gray","italic":false}','{"text":"reminder of the slaughter that","color":"gray","italic":false}','{"text":"the blade is responsible for.","color":"gray","italic":false}']},Unbreakable:1b,Damage:8,CustomModelData:2002001,AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:8,Operation:0,UUID:[I;2109495668,-1705227843,-1113968743,-227232755],Slot:"mainhand"},{AttributeName:"generic.knockback_resistance",Name:"generic.knockback_resistance",Amount:10,Operation:0,UUID:[I;-517673160,58740607,-2099330525,-243429035],Slot:"mainhand"},{AttributeName:"generic.armor",Name:"generic.armor",Amount:30,Operation:0,UUID:[I;-608258823,-601732334,-1514724207,-2071094845],Slot:"mainhand"},{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:1000,Operation:0,UUID:[I;1517072118,561990803,-1904397061,645258998],Slot:"mainhand"}]}}}
}

function getxyneth{
    playsound entity.wither.spawn hostile @s ~ ~ ~ 50 0
    playsound entity.wither.spawn voice @a ~ ~ ~ 50 0
    execute as @s at @s run playsound entity.wither.spawn ambient @s ~ ~ ~ 50 0
    particle block slime_block ~ ~ ~ 7 7 7 0 400
    kill @e[type=item,distance=..3]
    summon item ~ ~ ~ {HasVisualFire:0b,Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"Xyneth","color":"green","italic":false}',Lore:['{"text":"An agent of annihilation. Even in","color":"gray","italic":false}','{"text":"its dormant state, its corruption","color":"gray","italic":false}','{"text":"will spread uncontrollably.","color":"gray","italic":false}']},Unbreakable:1b,Damage:20,CustomModelData:2002002,AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Amount:100,Operation:0,UUID:[I;826460782,-227521590,-1495538476,-824830141],Slot:"mainhand"},{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:20,Operation:0,UUID:[I;577997057,1978287921,-1250132814,1697010659],Slot:"mainhand"},{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:1000,Operation:0,UUID:[I;-671632160,2101038285,-1473843317,1945992613],Slot:"mainhand"},{AttributeName:"generic.knockback_resistance",Name:"generic.knockback_resistance",Amount:10,Operation:0,UUID:[I;-1174290593,1596015795,-1464806681,-1557675637],Slot:"mainhand"},{AttributeName:"generic.armor",Name:"generic.armor",Amount:50,Operation:0,UUID:[I;-42451081,727665850,-1132277563,-1187387884],Slot:"mainhand"}]}}}
}

function getwerejix{
    playsound entity.wither.spawn hostile @s ~ ~ ~ 50 0
    playsound entity.wither.spawn voice @a ~ ~ ~ 50 0
    execute as @s at @s run playsound entity.wither.spawn ambient @s ~ ~ ~ 50 0
    particle dust 0.647 0.647 0.647 1 ~ ~ ~ 7 7 7 0 200
    particle dust 0.773 0.741 0.196 1 ~ ~ ~ 7 7 7 0 200
    kill @e[type=item,distance=..3]
    summon item ~ ~ ~ {HasVisualFire:0b,Item:{id:"minecraft:carrot_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"Werejix","color":"yellow","italic":false}',Lore:['{"text":"The ragged claws of Heletha.","color":"gray","italic":false}','{"text":"It constantly gnaws at the user,","color":"gray","italic":false}','{"text":"inflicting pain only a few can","color":"gray","italic":false}','{"text":"tolerate.","color":"gray","italic":false}']},Unbreakable:1b,CustomModelData:2002003,AttributeModifiers:[{AttributeName:"generic.attack_damage",Name:"generic.attack_damage",Amount:4,Operation:0,UUID:[I;533583803,-2055651002,-1289359585,1869929134],Slot:"mainhand"},{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:1000,Operation:0,UUID:[I;391752542,1914391404,-1964384777,-924409513],Slot:"mainhand"},{AttributeName:"generic.knockback_resistance",Name:"generic.knockback_resistance",Amount:10,Operation:0,UUID:[I;-1029750626,-2015933745,-1129285842,585732077],Slot:"mainhand"},{AttributeName:"generic.armor",Name:"generic.armor",Amount:1,Operation:0,UUID:[I;-380368874,187845732,-1498609571,-810857910],Slot:"mainhand"},{AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:0.1,Operation:0,UUID:[I;-138625383,1014583265,-1133456409,687921779],Slot:"mainhand"}]}}}
}


function radiate{
    execute as @s run tag @s add radiate_user
    scoreboard players add @s radiate_timer 1
    execute as @e[tag=radiate_user] if entity @s[scores={radiate_timer=20..}] run scoreboard players set @s radiate_timer 0
    execute as @e[tag=radiate_user] if entity @s[scores={radiate_timer=10}] at @s run particle block minecraft:slime_block ~ ~1 ~ 3 3 3 0.001 200 normal
    execute as @e[tag=radiate_user] if entity @s[scores={radiate_timer=10}] at @s if entity @e[tag=!user,type=!armor_stand,distance=..5] run playsound minecraft:entity.slime.attack ambient @a[tag=user] ~ ~ ~ 200 0
    execute as @e[tag=!radiate_user,distance=..5] if entity @a[scores={radiate_timer=10}] run effect give @s wither 1 3 false


    #execute as @e[tag=!radiate_user,distance=..7] run effect give @s wither 1 7 true
    execute as @e[tag=!radiate_user,distance=..5] run effect give @s nausea 1 3 true
    #execute as @e[tag=!radiate_user,distance=..7] run effect give @s poison 1 7 false
    execute as @e[tag=!radiate_user,distance=..5,type=!armor_stand,type=!arrow] at @s anchored eyes run particle dust 0.212 0.808 0.38 1 ~ ~2 ~ 0.01 0.01 0.01 0.001 10 normal
    tag @s remove radiate_user

    #execute as @e[scores={xyneth.radiate=2..}] run scoreboard players set @s xyneth.radiate 0
    
}

function radiate_skull{
    say radiate skull
    execute run function template:xyneth_skull
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

function salvage{
    say hi
    execute if entity @s[scores={timer=10}] as @e[tag=user] run effect give @s strength 10 0 true
    execute if entity @s[scores={timer=10}] as @e[tag=user] run effect give @s speed 10 0 true
}

function hemorrhage{
    execute as @s run function template:hem_sound
    execute as @s run function template:hem_particle
    scoreboard players set @a shakal.hemorrhage 0
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
    scoreboard players set @e shakal.hemorrhage 0

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
