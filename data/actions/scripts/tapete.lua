local tapetes = {
    [21] = 2080,
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(fromPosition.x == CONTAINER_POSITION) then
	  doPlayerSendCancel(cid, "Primeiro, coloque o tapete no chão...")
	 elseif(not getTileInfo(fromPosition).house) then
	  doPlayerSendCancel(cid,"Você só pode colocar este tapete dentro de uma casa.")
	 elseif(tapetes[item.itemid] ~= nil) then
	  doTransformItem(item.uid, tapetes[item.itemid])
	 else
	 return false
    end
   return true
end
