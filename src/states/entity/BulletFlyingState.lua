BulletFlyingState = Class{__includes = EntityBaseState}

function BulletFlyingState:init(bullet)
    self.entity = bullet
    self.entity:changeAnimation('standar')
end