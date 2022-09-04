#built using mc-build (https://github.com/mc-build/mc-build)

say skulls
execute if entity @e[tag=!user,distance=30..] run say too far away!
execute run function template:skulls_armor_stand
execute if entity @s[scores={xyneth.skulls_clicked=2..}] run kill @e[tag=skulls,tag=skulls2]
scoreboard players set @s xyneth.skulls 0