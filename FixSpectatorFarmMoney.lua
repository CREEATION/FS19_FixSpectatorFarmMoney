--[[

    @author CREE7EN
    @copyright 2019 Thomas Creeten, CREEATION.de
    @see https://github.com/CREEATION/FS19_FixSpectatorFarmMoney

--]]

--- prevents spectator farm from trying to get money every hour
-- this happens when a placeable has `incomePerHour` set, but nobody bought the farmland yet
Placeable.hourChanged = Utils.overwrittenFunction(
  Placeable.hourChanged,
  function ( self, superFunc )
    --- skip function execution if placeable belongs to spectator farm (`farmId 0`)
    if self:getOwnerFarmId() ~= FarmManager.SPECTATOR_FARM_ID then
      superFunc( self )
    end
  end
)
