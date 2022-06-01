-- Using Inventory peripheral allows us to access additonal storage easily without needing to turn the turtle which saves time
assert(peripheral.isPresent("front"), "Puzzle barrel needs to be placed in front of turtle.")
local front = peripheral.wrap("front")

local hasBack, hasLeft, hasRight, hasUp, hasDown = false, false, false, false, false

local back = peripheral.wrap("back")
if not (back == nil) then hasBack = true end

local left = peripheral.wrap("left")
if not (left == nil) then hasLeft = true end

local right = peripheral.wrap("right")
if not (right == nil) then hasRight = true end

local up = peripheral.wrap("top")
if not (up == nil) then hasUp = true end

local down = peripheral.wrap("bottom")
if not (down == nil) then hasDown = true end

assert(hasBack or hasLeft or hasRight or hasUp or hasDown, "At least one storage item (i.e. chest, drawer, barrel, etc.) must be placed directly to the left, right, back, top or bottom of the turtle.")

local barrels_opened = 0

while true do

    local barrel_items = front.list()
    local total_item_count = 0
    local deposited_count = 0

    -- Process a barrel that is placed in front of the turtle.
    for slot, item_info in pairs(barrel_items) do

        print("Begin new barrel.")

        local item_name = item_info.name

        -- The puzzel box (barrel) contains nbt data, while standard MC barrels do not
        -- Leave puzzle box in current barrel and remove only after removing all other items
        if not (item_name == "minecraft:barrel" and front.getItemDetail(slot).nbt) then

            total_item_count = total_item_count + item_info.count
            -- pushItems(String toName, Number fromSlot) returns count of deposited items
            if hasUp then
                deposited_count = deposited_count + front.pushItems(peripheral.getName(up),slot)
            end
            if hasRight then
                deposited_count = deposited_count + front.pushItems(peripheral.getName(right),slot)
            end
            if hasDown then
                deposited_count = deposited_count + front.pushItems(peripheral.getName(down),slot)
            end
            if hasLeft then
                deposited_count = deposited_count + front.pushItems(peripheral.getName(left),slot)
            end
            if hasBack then
                deposited_count = deposited_count + front.pushItems(peripheral.getName(back),slot)
            end
        
        end

    end

    assert(total_item_count == deposited_count, "Unable to deposit items into attached storage.")
    barrels_opened = barrels_opened + 1
    print("Processed barrel " .. barrels_opened .. ".")
    -- Only a single barrel remainins in the inventory, get it and break (dig) the placed barrel
    turtle.select(1)
    assert(turtle.suck(), "Unable to pull a new barrel from front. Perhaps the end was reached?")

    assert(turtle.dig(), "Unable to break barrel in front.")
    assert(turtle.place(), "Unable to place new barrel.")
    turtle.select(2)
    assert(turtle.drop(),"Unable to drop old barrel in new barrel.")
    
end