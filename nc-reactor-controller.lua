local component = require("component")

if component.isAvailable("nc_fission_reactor") then
    r = component.proxy(component.nc_fission_reactor.address)
else
    --Some kind of error handling or break
end

tMax = r.getMaxHeatLevel()
eMax = r.getMaxEnergyStored()

while true
    t = r.getHeatLevel()
    e = r.getEnergyLevel()

    ePercent = e / eMax

    if ePercent < 0.8 then
        r.activate()
    else
        r.deactivate()
    end
end