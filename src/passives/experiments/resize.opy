# mainFile "../dev_main.op"
# changes hero spec on death


playervar hero_size_multiplyer

rule "Respawn Size Change":
 
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true


    eventPlayer.hero_size_multiplyer = random.randint(1, 100) * 0.03
    eventPlayer.setMaxHealth(eventPlayer.hero_size_multiplyer * 100)
    damage(eventPlayer, null, eventPlayer.hero_size_multiplyer * -100)
    eventPlayer.startScalingSize(eventPlayer.hero_size_multiplyer, true)
