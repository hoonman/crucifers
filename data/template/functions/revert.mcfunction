#built using mc-build (https://github.com/mc-build/mc-build)

say revert
execute as @e[type=item] run data modify entity @s PickupDelay set value 0
playsound minecraft:block.anvil.land ambient @a ~ ~ ~ 0.1 0
item replace entity @s weapon with carrot_on_a_stick{CustomModelData:2002011,AttributeModifiers:[{AttributeName:"generic.armor",Amount:10,Slot:mainhand,Name:"generic.armor",UUID:[I;-12288,32474,185218,-64948]},{AttributeName:"generic.attack_damage",Amount:10,Slot:mainhand,Name:"generic.attack_damage",UUID:[I;-12288,32574,185218,-65148]},{AttributeName:"generic.attack_speed",Amount:1000,Slot:mainhand,Name:"generic.attack_speed",UUID:[I;-12288,32674,185218,-65348]},{AttributeName:"generic.knockback_resistance",Amount:100,Slot:mainhand,Name:"generic.knockback_resistance",UUID:[I;-12288,32774,185218,-65548]},{AttributeName:"generic.max_health",Amount:8,Slot:mainhand,Name:"generic.max_health",UUID:[I;-12288,32874,185218,-65748]}],display:{Name:'[{"text":"Rhakal","italic":false,"color":"aqua"}]',Lore:['[{"text":"Mace form","italic":false,"color":"dark_gray"},{"text":"","italic":false,"color":"dark_purple"}]','[{"text":"A grand mace edged with six","italic":false,"color":"gray"}]','[{"text":"blades. It serves as a gateway","italic":false,"color":"gray"}]','[{"text":"between dimensions.","italic":false,"color":"gray"}]']}}
kill @e[type=item,limit=1,distance=..3]
particle dust 0 0.2 0.753 1 ~ ~1 ~ 0.3 0 0.3 0 400
execute as @s run tag @s remove rhakalhold2