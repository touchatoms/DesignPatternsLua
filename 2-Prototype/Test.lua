require(".functions")


-- 定义名为 Shape 的基础类  
local Shape = class("Shape")
-- ctor() 是类的构造函数，在调用 Shape.new() 创建 Shape 对象实例时会自动执行  
function Shape:ctor(shapeName) 
    self.shapeName = shapeName  
    print(string.format("Shape:ctor(%s)", self.shapeName))  
end
-- 为 Shape 定义个名为 draw() 的方法  
function Shape:draw()
    print(string.format("draw %s", self.shapeName))  
end
 
-- Circle 是 Shape 的继承类  
local Circle = class("Circle", Shape)
function Circle:ctor()  
    -- 如果继承类覆盖了 ctor() 构造函数，那么必须手动调用父类构造函数  
    -- 类名.super 可以访问指定类的父类  
    Circle.super:ctor("circle")  
    self.radius = 100  
end

-- 覆盖父类的同名方法  
function Circle:draw()  
    print(string.format("draw %s, radius = %0.2f", self.shapeName, self.radius))
end

function Circle:clone()
    return Circle.new()
end

function Circle:print()
    print("Circle: " .. tostring(self.radius))
end

local c1 = Circle.new()
local c2 = c1.clone()

c1:print()
c2:print()

--Cocos2d-x 应用实例
--function Node:clone()
--    local cloneNode = self:createCloneInstance_()
--
--    cloneNode:copyProperties_(self)
--    cloneNode:copySpecialPeerVal_(self)
--    cloneNode:copyClonedWidgetChildren_(self)
--
--    return cloneNode
--end