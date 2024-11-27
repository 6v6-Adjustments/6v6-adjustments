#!mainFile "../../dev_main.opy"

playervar clobber_cooldown_accelerator


rule "[venture/clobber.opy]: Correct Venture melee damage":
    @Event playerDealtDamage
    @Hero venture
    @Condition eventAbility == Button.MELEE

    eventPlayer.clobber_cooldown_accelerator = eventPlayer.getAbilityCooldown(Button.ABILITY_1)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, eventPlayer.clobber_cooldown_accelerator - ADJ_VENTURE_CLOBBER_COOLDOWN_ACCELERATION)
