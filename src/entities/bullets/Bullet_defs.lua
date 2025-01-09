BULLET_DEFS = {
    ['playerSmallBullet'] = {
        animation = {
            ['standar'] = {
                frames = {1},
                interval = 1,
                texture = 'playerBulletSheet'
            }
        },
        data = {
            width = 8,
            height = 8,
            hitboxWidth = 8,
            hitboxHeight = 8,
            scoreOnDodge = 0,
            hitboxInsetX = 0,
            hitboxInsetY = 0,
            damage = 5,
            bulletType = 'player'
        },
        pattern = {
            [1] = {"Accelerate", {0, 255, 5}},
        },
    },
    ['smallBulletGreen'] = {
        animation = {
            ['standar'] = {
                frames = {1,2},
                interval = 0.1,
                texture = 'x16bulletSheet'
            }
        },
        data = {
            width = 16,
            height = 16,
            hitboxWidth = 12,
            hitboxHeight = 12,
            scoreOnDodge = 10,
            hitboxInsetX = 2,
            hitboxInsetY = 2,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            [1] = {"Accelerate", {0, 255, 5}},
        },
    },
    ['smallBulletBlue'] = {
        animation = {
            ['standar'] = {
                frames = {3,4},
                interval = 0.1,
                texture = 'x16bulletSheet'
            }
        },
        data = {
            width = 16,
            height = 16,
            hitboxWidth = 12,
            hitboxHeight = 12,
            scoreOnDodge = 10,
            hitboxInsetX = 2,
            hitboxInsetY = 2,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            [1] = {"AimToPlayerAndAccelerate", {40, 2, 5}},
        },
    },
    ['smallBulletYellow'] = {
        animation = {
            ['standar'] = {
                frames = {5,6},
                interval = 0.1,
                texture = 'x16bulletSheet'
            }
        },
        data = {
            width = 16,
            height = 16,
            hitboxWidth = 12,
            hitboxHeight = 12,
            scoreOnDodge = 10,
            hitboxInsetX = 2,
            hitboxInsetY = 2,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            --[1] = {'Accelerate(self.bullet, 0, 255, 5)', false}
            [1] = {"Accelerate", {0, 255, 5}, false},
            --Pattern.Accelerate(self,0,255,5)
        },
    },
    ['smallBulletPurple'] = {
        animation = {
            ['standar'] = {
                frames = {7,8},
                interval = 0.1,
                texture = 'x16bulletSheet'
            }
        },
        data = {
            width = 16,
            height = 16,
            hitboxWidth = 12,
            hitboxHeight = 12,
            scoreOnDodge = 10,
            hitboxInsetX = 2,
            hitboxInsetY = 2,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            --[1] = {'Accelerate(self.bullet, 0, 255, 5)', false}
            [1] = {"Accelerate", {0, 255, 5}, false},
            --Pattern.Accelerate(self,0,255,5)
        },
    },
    ['smallLaserGreen'] = {
        animation = {
            ['standar'] = {
                frames = {9,10,11,12},
                interval = 0.2,
                texture = 'x16bulletSheet'
            }
        },
        data = {
            width = 16,
            height = 16,
            hitboxWidth = 6,
            hitboxHeight = 14,
            scoreOnDodge = 20,
            hitboxInsetX = 5,
            hitboxInsetY = 1,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            --[1] = {'Accelerate(self.bullet, 0, 255, 5)', false}
            [1] = {"Accelerate", {0, 255, 5}, false},
            --Pattern.Accelerate(self,0,255,5)
        },
    },
    ['smallLaserBlue'] = {
        animation = {
            ['standar'] = {
                frames = {13,14,15,16},
                interval = 0.2,
                texture = 'x16bulletSheet'
            }
        },
        data = {
            width = 16,
            height = 16,
            hitboxWidth = 6,
            hitboxHeight = 14,
            scoreOnDodge = 20,
            hitboxInsetX = 5,
            hitboxInsetY = 1,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            --[1] = {'Accelerate(self.bullet, 0, 255, 5)', false}
            [1] = {"Accelerate", {0, 255, 5}, false},
            --Pattern.Accelerate(self,0,255,5)
        },
    },
    ['smallLaserYellow'] = {
        animation = {
            ['standar'] = {
                frames = {17,18,19,20},
                interval = 0.2,
                texture = 'x16bulletSheet'
            }
        },
        data = {
            width = 16,
            height = 16,
            hitboxWidth = 6,
            hitboxHeight = 14,
            scoreOnDodge = 20,
            hitboxInsetX = 5,
            hitboxInsetY = 1,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            --[1] = {'Accelerate(self.bullet, 0, 255, 5)', false}
            [1] = {"Accelerate", {0, 255, 5}, false},
            --Pattern.Accelerate(self,0,255,5)
        },
    },
    ['smallLaserPurple'] = {
        animation = {
            ['standar'] = {
                frames = {21,22,23,24},
                interval = 0.2,
                texture = 'x16bulletSheet'
            }
        },
        data = {
            width = 16,
            height = 16,
            hitboxWidth = 6,
            hitboxHeight = 14,
            scoreOnDodge = 20,
            hitboxInsetX = 5,
            hitboxInsetY = 1,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            --[1] = {'Accelerate(self.bullet, 0, 255, 5)', false}
            [1] = {"Accelerate", {0, 255, 5}, false},
            --Pattern.Accelerate(self,0,255,5)
        },
    },
    ['smallPulsarGreen'] = {
        animation = {
            ['standar'] = {
                frames = {25,26,27,26},
                interval = 0.2,
                texture = 'x16bulletSheet'
            }
        },
        data = {
            width = 16,
            height = 16,
            hitboxWidth = 10,
            hitboxHeight = 10,
            scoreOnDodge = 20,
            hitboxInsetX = 3,
            hitboxInsetY = 3,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            --[1] = {'Accelerate(self.bullet, 0, 255, 5)', false}
            [1] = {"Accelerate", {0, 255, 5}, false},
            --Pattern.Accelerate(self,0,255,5)
        },
    },
    ['smallPulsarBlue'] = {
        animation = {
            ['standar'] = {
                frames = {28,29,30,29},
                interval = 0.2,
                texture = 'x16bulletSheet'
            }
        },
        data = {
            width = 16,
            height = 16,
            hitboxWidth = 10,
            hitboxHeight = 10,
            scoreOnDodge = 20,
            hitboxInsetX = 3,
            hitboxInsetY = 3,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            --[1] = {'Accelerate(self.bullet, 0, 255, 5)', false}
            [1] = {"Accelerate", {0, 255, 5}, false},
            --Pattern.Accelerate(self,0,255,5)
        },
    },
    ['smallPulsarYellow'] = {
        animation = {
            ['standar'] = {
                frames = {31,32,33,32},
                interval = 0.2,
                texture = 'x16bulletSheet'
            }
        },
        data = {
            width = 16,
            height = 16,
            hitboxWidth = 10,
            hitboxHeight = 10,
            scoreOnDodge = 20,
            hitboxInsetX = 3,
            hitboxInsetY = 3,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            --[1] = {'Accelerate(self.bullet, 0, 255, 5)', false}
            [1] = {"Accelerate", {0, 255, 5}, false},
            --Pattern.Accelerate(self,0,255,5)
        },
    },
    ['smallPulsarPurple'] = {
        animation = {
            ['standar'] = {
                frames = {34,35,36,35},
                interval = 0.2,
                texture = 'x16bulletSheet'
            }
        },
        data = {
            width = 16,
            height = 16,
            hitboxWidth = 10,
            hitboxHeight = 10,
            scoreOnDodge = 20,
            hitboxInsetX = 3,
            hitboxInsetY = 3,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            --[1] = {'Accelerate(self.bullet, 0, 255, 5)', false}
            [1] = {"Accelerate", {0, 255, 5}, false},
            --Pattern.Accelerate(self,0,255,5)
        },
    },
    ['mediumBulletGreen'] = {
        animation = {
            ['standar'] = {
                frames = {1,2,3,4,3,2},
                interval = 0.1,
                texture = 'x32bulletSheet'
            }
        },
        data = {
            width = 32,
            height = 32,
            hitboxWidth = 26,
            hitboxHeight = 26,
            scoreOnDodge = 40,
            hitboxInsetX = 3,
            hitboxInsetY = 3,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            --[1] = {'Accelerate(self.bullet, 0, 255, 5)', false}
            [1] = {"Accelerate", {0, 255, 5}, false},
            --Pattern.Accelerate(self,0,255,5)
        },
    },
    ['mediumBulletBlue'] = {
        animation = {
            ['standar'] = {
                frames = {5,6,7,8,7,6},
                interval = 0.1,
                texture = 'x32bulletSheet'
            }
        },
        data = {
            width = 32,
            height = 32,
            hitboxWidth = 26,
            hitboxHeight = 26,
            scoreOnDodge = 40,
            hitboxInsetX = 3,
            hitboxInsetY = 3,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            --[1] = {'Accelerate(self.bullet, 0, 255, 5)', false}
            [1] = {"Accelerate", {0, 255, 5}, false},
            --Pattern.Accelerate(self,0,255,5)
        },
    },
    ['mediumBulletYellow'] = {
        animation = {
            ['standar'] = {
                frames = {9,10,11,12,11,10},
                interval = 0.2,
                texture = 'x32bulletSheet'
            }
        },
        data = {
            width = 32,
            height = 32,
            hitboxWidth = 26,
            hitboxHeight = 26,
            scoreOnDodge = 40,
            hitboxInsetX = 3,
            hitboxInsetY = 3,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            --[1] = {'Accelerate(self.bullet, 0, 255, 5)', false}
            [1] = {"Accelerate", {0, 255, 5}, false},
            --Pattern.Accelerate(self,0,255,5)
        },
    },
    ['mediumBulletPurple'] = {
        animation = {
            ['standar'] = {
                frames = {13,14,15,16,15,14},
                interval = 0.1,
                texture = 'x32bulletSheet'
            }
        },
        data = {
            width = 32,
            height = 32,
            hitboxWidth = 24,
            hitboxHeight = 24,
            scoreOnDodge = 40,
            hitboxInsetX = 4,
            hitboxInsetY = 4,
            damage = 1,
            bulletType = 'enemy'
        },
        pattern = {
            --[1] = {'Accelerate(self.bullet, 0, 255, 5)', false}
            [1] = {"Accelerate", {0, 255, 5}, false},
            --Pattern.Accelerate(self,0,255,5)
        },
    },
}