#built using mc-build (https://github.com/mc-build/mc-build)

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
scoreboard objectives add carrot.timer2 dummy
scoreboard objectives add carrot.timer3 dummy
scoreboard objectives add rhakal.sweep dummy
scoreboard objectives add flight.timer dummy
scoreboard objectives add snowball.use minecraft.used:minecraft.snowball
scoreboard objectives add snowball.use2 minecraft.used:minecraft.snowball
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