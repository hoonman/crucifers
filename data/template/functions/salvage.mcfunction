#built using mc-build (https://github.com/mc-build/mc-build)

say hi
execute if entity @s[scores={timer=10}] as @e[tag=user] run effect give @s strength 10 0 true
execute if entity @s[scores={timer=10}] as @e[tag=user] run effect give @s speed 10 0 true