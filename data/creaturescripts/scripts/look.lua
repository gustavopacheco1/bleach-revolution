itemsPrice = {
["Charmander"] = 3000,
["Charmeleon"] = 8000, 
}

function onLook(cid, thing, position, lookDistance)
      if getItemAttribute(thing.uid, "description") then    
            table.insert (str, " Price: $")
			else
			table.insert(str, "Price: Unsellable.")
		end
end