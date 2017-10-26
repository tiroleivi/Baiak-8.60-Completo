function onSay(cid, words, param)
file = io.open('forjas.txt','r')
notice = file:read(-1)
doShowTextDialog(cid,9004,notice)
file:close()
end