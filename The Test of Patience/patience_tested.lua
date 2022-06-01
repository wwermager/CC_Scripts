
-- Using Inventory peripheral allows us to access additonal storage easily without needing to turn the turtle which saves time
front = peripheral.wrap("front")
back = peripheral.wrap("back")
left = peripheral.wrap("left")
right = peripheral.wrap("right")
up = peripheral.wrap("top")
down = peripheral.wrap("bottom")

while true do

    turtle.select(1)

    local barrel_items = front.list()
    local total_item_count = 0
    local deposited_count = 0

    for slot, item_info in pairs(barrel_items) do

        local item_name = item_info.name()
        
        if not (item_name == "minecraft:barrel") then

            total_item_count = total_item_count + item_info.count
            -- pushItems(String toName, Number fromSlot) returns count of deposited items
            deposited_count = deposited_count + front.pushItems(peripheral.getName(up),slot)
            deposited_count = deposited_count + front.pushItems(peripheral.getName(down),slot)
            deposited_count = deposited_count + front.pushItems(peripheral.getName(left),slot)
            deposited_count = deposited_count + front.pushItems(peripheral.getName(right),slot)
            deposited_count = deposited_count + front.pushItems(peripheral.getName(back),slot)
        
        end

    end

    assert(total_item_count == deposited_count, "All chests full.")
    
    -- Only a single barrel should remainin the inventory, get it and break the placed barrel
    assert(turtle.suck(), "Unable to suck front.")
    assert(turtle.dig(), "Unable to dig front.")
    assert(turtle.place(), "Unable to place new barrel.")
    
end



--     local hasContents = turtle.suck()
--     -- Assuming final barrel does not have a barrel use this to end application
--     local hasBarrel = false
--     print("Begin processing barrel contents...")
--     while hasContents do

--         local item_name = turtle.getItemDetail().name
--         local dropped = false

--         -- API limits us to drop, dropUp, and dropDown methods
--         -- Avoiding turning to use other storage as this increases the time spent processing barrels
--         -- Choosing to store misc. items like apples, cookies, etc. with barrels as these stack more efficiently than messages (paper)

--         if not (item_name == "minecraft:paper"  or item_name == "minecraft:barrel") then
--             -- print("Found " .. item_name .. ", dropping to upper inventory...")
--             dropped = turtle.dropUp()
--             if not (dropped) then
--                 error("UP INVENTORY FULL")
--             end
--         -- paper goes down
--         elseif (item_name == "minecraft:paper") then
--             -- print("Found paper " .. ", dropping to lower inventory...")
--             dropped = turtle.dropDown()
--             if not (dropped) then
--                 error("DOWN INVENTORY FULL")
--             end
--         -- mystery barrel
--         else
--             -- move mystery barrel to inventory slot 2
--             -- print("Found the mystery barrel, moving to slot 2...")
--             turtle.transferTo(2)
--             hasBarrel = true
--         end

--         hasContents = turtle.suck()

--     end

--     if not (hasBarrel) then
--         error("NO NESTED BARREL... WINNER???")
--     end

--     -- break current barrel and store
--     turtle.dig()
--     dropped = turtle.dropUp()
--     if not (dropped) then
--         error("UP INVENTORY FULL")
--     end

--     turtle.select(2)
--     turtle.place()

-- end