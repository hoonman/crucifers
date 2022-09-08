#built using mc-build (https://github.com/mc-build/mc-build)

execute as @e[team=scrutinized] run data modify entity @s NoGravity set value 0b
execute as @e[team=scrutinized] run effect clear @s
execute as @e[team=scrutinized] run schedule function template:remove_team 1.0s append