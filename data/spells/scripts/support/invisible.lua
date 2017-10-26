local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_BLOCKHIT)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_INVISIBLE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 200000)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
if (getPlayerStorageValue(cid, _CTF_LIB.teamssto) > 0) then
return doPlayerSendCancel(cid, "Você não pode usar invisible durante o CTF!") and doSendMagicEffect(getThingPos(cid), 2)
end

	return doCombat(cid, combat, var)
end
