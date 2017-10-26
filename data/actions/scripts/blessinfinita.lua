local priceBless = getConfigInfo("blessPrice")

function onUse(cid, item, frompos, item2, topos)

    if getPlayerBlessing(cid, 1) or getPlayerBlessing(cid, 2) or getPlayerBlessing(cid, 3) or getPlayerBlessing(cid, 4) or getPlayerBlessing(cid, 5) or getPlayerBlessing(cid, 6) or getPlayerBlessing(cid, 7) or getPlayerBlessing(cid, 8) or getPlayerBlessing(cid, 9) or getPlayerBlessing(cid, 10)  or getPlayerBlessing(cid, 11)or getPlayerBlessing(cid, 12) then

		    doPlayerSendCancel(cid,'You have already got one or more blessings!')

    else

		    if doPlayerRemoveMoney(cid, priceBless) == TRUE then

						  doPlayerAddBlessing(cid, 1)

						 doPlayerAddBlessing(cid, 2)

				    doPlayerAddBlessing(cid, 3)

				   doPlayerAddBlessing(cid, 4)

				  doPlayerAddBlessing(cid, 5)

				 doPlayerAddBlessing(cid, 6)

		    doPlayerAddBlessing(cid, 7)

				 doPlayerAddBlessing(cid, 8)

				  doPlayerAddBlessing(cid, 9)

				   doPlayerAddBlessing(cid, 10)

				    doPlayerAddBlessing(cid, 11)

						  doPlayerAddBlessing(cid, 12)

doSendMagicEffect(getPlayerPosition(cid), CONST_ME_HOLYDAMAGE)



				    doPlayerSendTextMessage(cid,25,'You have been blessed by the gods!')

		    else

				    doPlayerSendCancel(cid, "You need "..priceBless.." gold coins to get all blessings!")

		    end

    end  

    return 1

end