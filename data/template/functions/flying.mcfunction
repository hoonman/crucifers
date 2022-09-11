#built using mc-build (https://github.com/mc-build/mc-build)

say flying
effect give @s slow_falling 1 1 true
tp @s ^ ^ ^1
execute as @a[scores={sneak=0}] run scoreboard players set @s flight.timer 0
playsound entity.ender_dragon.flap ambient @a ~ ~ ~ 1 2