require(".functions")

local Car = class("Car")

function Car:ctor(carName)
    self.carName = carName
end

function Car:drive()
    print(string.format("drive %s", self.carName))
end


local AudiCar = class("AudiCar", Car)

function AudiCar:ctor()
    AudiCar.super:ctor("AudiCar")
end

local TeslaCar = class("TeslaCar", Car)

function TeslaCar:ctor()
    TeslaCar.super:ctor("TeslaCar")
end

local CarFactory = {}

function CarFactory.getCar(carType)
    if carType == "audi" then
        return AudiCar.new()
    elseif carType == "tesla" then
        return TeslaCar.new()
    end
end

CarFactory.getCar("audi"):drive()
CarFactory.getCar("tesla"):drive()