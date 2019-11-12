require(".functions")

local Car = class("Car")

function Car:ctor(carName)
    self.carName = carName
end

function Car:setTire(tire)
    self.tire = tire
end

function Car:setLight(light)
    self.light = light
end

function Car:setSeat(seat)
    self.seat = seat
end

function Car:show()
    print(self.carName .. ":" .. tostring(self.light) .. ":".. tostring(self.seat) .. ":".. tostring(self.tire) .. ":")
end

local Builder = class("Builder")

function Builder:ctor(builderName)
    self.builderName = builderName
end

function Builder:buildTire(tire)
end

function Builder:buildLight(light)
end

function Builder:buildSeat(seat)
end


local TeslaBuilder = class("Builder", Builder)

function TeslaBuilder:ctor()
    TeslaBuilder.super.ctor(self, "TeslaBuilder")
end

function TeslaBuilder:buildTire()
    self.car:setTire("特斯拉轮胎")
end

function TeslaBuilder:buildLight()
    self.car:setLight("特斯拉大灯")
end

function TeslaBuilder:buildSeat(seat)
    self.car:setSeat("特斯拉座位")
end

function TeslaBuilder:createCar()
    self.car = Car.new("Tesla")
    return self.car
end
local BMWBuilder = class("BMWBuilder", Builder)

function BMWBuilder:ctor()
    BMWBuilder.super.ctor(self, "BMWBuilder")
end

function BMWBuilder:buildTire()
    self.car:setTire("BMW轮胎")
end

function BMWBuilder:buildLight()
    self.car:setLight("BMW大灯")
end

function BMWBuilder:buildSeat(seat)
    self.car:setSeat("BMW座位")
end

function BMWBuilder:createCar()
    self.car = Car.new("BMW")
    return self.car
end

local Director = class("Director")

function Director:ctor(builder)
    self.builder = builder
end

function Director:build()
    local car = self.builder:createCar()
    self.builder:buildTire()
    self.builder:buildLight()
    self.builder:buildSeat()
    return car
end

local TeslaBuilder = TeslaBuilder.new()
local BMWBuilder = BMWBuilder.new()
local Director1 = Director.new(TeslaBuilder)
local Director2 = Director.new(BMWBuilder)
local car1 = Director1:build()
local car2 = Director2:build()
car1:show()
car2:show()