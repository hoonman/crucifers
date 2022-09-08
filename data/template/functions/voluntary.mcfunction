#built using mc-build (https://github.com/mc-build/mc-build)

say voluntary
execute as @a[tag=voluntary] run effect give @s wither 1 1 true
execute as @a[tag=voluntary] run schedule function template:voluntary 1s replace