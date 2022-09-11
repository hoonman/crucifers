#built using mc-build (https://github.com/mc-build/mc-build)

say doom repeat
scoreboard players add @a[tag=user] carrot.timer 1
execute as @e[tag=portal] at @s facing ^0.1 ^ ^ positioned as @s positioned ^ ^ ^ run function template:rhakal_portal
execute as @e[tag=portal2] at @s facing ^0.1 ^ ^ positioned as @s positioned ^ ^ ^ run function template:rhakal_portal
execute as @a[tag=user] at @s if entity @e[tag=portal2,distance=..2] run function template:doom_teleport
execute as @a[tag=user] at @s if entity @e[tag=portal,distance=..2] run function template:doom_teleport2
execute as @a[scores={carrot.timer=100..}] unless entity @s[scores={carrot.timer=100..}] run scoreboard players set @s carrot.timer 0
execute as @a[scores={carrot.timer=100}] run kill @e[tag=portal]
execute as @a[scores={carrot.timer=100}] run kill @e[tag=portal2]
execute as @a[scores={carrot.timer=..100}] run schedule function template:doom_repeat 0.1s replace