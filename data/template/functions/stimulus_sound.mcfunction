#built using mc-build (https://github.com/mc-build/mc-build)

say stimulus sound
execute as @s[scores={stim.timer=1}] run playsound entity.spider.death ambient @a ~ ~ ~ 200 0
scoreboard players add @s stim.timer 1
execute as @s[scores={sneak=0}] run scoreboard players set @s stim.timer 0