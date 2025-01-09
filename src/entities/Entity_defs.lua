ENTITY_DEFS = {
    ['player'] = {
        animation = {
            ['still'] = {
                frames = {1},
                interval = 0.2,
                texture = 'playerShip'
            },
            ['stillFocus'] = {
                frames = {1},
                interval = 0.2,
                texture = 'playerShip'
            },
            ['moving-left'] = {
                frames = {2},
                interval = 0.2,
                texture = 'playerShip'
            },
            ['movingFocus-left'] = {
                frames = {2},
                interval = 0.2,
                texture = 'playerShip'
            },
            ['moving-right'] = {
                frames = {4},
                interval = 0.2,
                texture = 'playerShip'
            },
            ['movingFocus-right'] = {
                frames = {4},
                interval = 0.2,
                texture = 'playerShip'
            },
            ['moving-up'] = {
                frames = {3},
                interval = 0.2,
                texture = 'playerShip'
            },
            ['movingFocus-up'] = {
                frames = {3},
                interval = 0.2,
                texture = 'playerShip'
            },
            ['moving-down'] = {
                frames = {5},
                interval = 0.2,
                texture = 'playerShip'
            },
            ['movingFocus-down'] = {
                frames = {5},
                interval = 0.2,
                texture = 'playerShip'
            },
            ['explode'] = {
                frames = {1,2,3,4,5,6,7,8,9,10},
                interval = 0.1,
                texture = 'x32explosion'
            }

        },
        patterns = {
            bullets = {
                --[[ ['bulletLeft'] = {
                    bullet = 'playerSmallBullet',
                    dx = 0,
                    dy = -225,
                    width = 8,
                    height = 8,
                    xLeft = 10,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    speed = 100,
                },
                ['bulletRight'] = {
                    bullet = 'playerSmallBullet',
                    dx = 0,
                    dy = -225,
                    width = 8,
                    height = 8,
                    xLeft = 0,
                    xRight = 10,
                    yUp = 0,
                    yDown = 0,
                    speed = 100,
                }]]
            },
            repeatShot = 1,
            fireRate = 0.25,
            wait = 0.25,
        },
        data = {
            width = 32,
            height = 32,
            hp = 3,
            scoreOnDeath = 0,
            bombs = 99,
        }
    },
    ['alien-small-spaceship-1'] = {
        animation = {
            ['still'] = {
                frames = {1},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-left'] = {
                frames = {2},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-right'] = {
                frames = {4},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-up'] = {
                frames = {3},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-down'] = {
                frames = {5},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['explode'] = {
                frames = {1,2,3,4,5,6,7,8,9,10},
                interval = 0.1,
                texture = 'x32explosion'
            }
        },
        patterns = {
            bullets = {
                ['bulletCenter'] = {
                    bullet = 'smallBulletBlue',
                    dx = 0,
                    dy = 0,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    speed = 125,
                },
            },
            repeatShot = 3,
            fireRate = 0.3,
            wait = 1,
        },
        data = {
            width = 32,
            height = 32,
            hp = 60,
            scoreOnDeath = 750
        }
    },
    ['alien-small-spaceship-2'] = {
        animation = {
            ['still'] = {
                frames = {6},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-left'] = {
                frames = {7},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-right'] = {
                frames = {9},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-up'] = {
                frames = {8},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-down'] = {
                frames = {10},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['explode'] = {
                frames = {1,2,3,4,5,6,7,8,9,10},
                interval = 0.1,
                texture = 'x32explosion'
            }
        },
        patterns = {
            bullets = {
                ['YellowBottom'] = {
                    bullet = 'smallBulletYellow',
                    dx = 0,
                    dy = 200,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
                ['YellowBottomLeft'] = {
                    bullet = 'smallBulletYellow',
                    dx = -100,
                    dy = 100,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
                ['YellowBottomRight'] = {
                    bullet = 'smallBulletYellow',
                    dx = 100,
                    dy = 100,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
                ['YellowLeft'] = {
                    bullet = 'smallBulletYellow',
                    dx = -200,
                    dy = 0,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
                ['YellowRight'] = {
                    bullet = 'smallBulletYellow',
                    dx = 200,
                    dy = 0,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
                ['YellowTopLeft'] = {
                    bullet = 'smallBulletYellow',
                    dx = -100,
                    dy = -100,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
                ['YellowTopRight'] = {
                    bullet = 'smallBulletYellow',
                    dx = 100,
                    dy = -100,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
                ['YellowTop'] = {
                    bullet = 'smallBulletYellow',
                    dx = 0,
                    dy = -200,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
            },
            repeatShot = 1,
            fireRate = 0,
            wait = 2,
        },
        data = {
            width = 32,
            height = 32,
            hp = 50,
            scoreOnDeath = 1000
        }
    },
    ['alien-small-spaceship-3'] = {
        animation = {
            ['still'] = {
                frames = {11},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-left'] = {
                frames = {12},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-right'] = {
                frames = {14},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-up'] = {
                frames = {13},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-down'] = {
                frames = {15},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['explode'] = {
                frames = {1,2,3,4,5,6,7,8,9,10},
                interval = 0.1,
                texture = 'x32explosion'
            }
        },
        patterns = {
            bullets = {
                ['bulletTopLeft'] = {
                    bullet = 'smallBulletGreen',
                    dx = 0,
                    dy = 0,
                    width = 16,
                    height = 16,
                    xLeft = 10,
                    xRight = 0,
                    yUp = 10,
                    yDown = 0,
                    aimToPlayer = true,
                    speed = 75,
                },
                ['bulletTopRight'] = {
                    bullet = 'smallBulletGreen',
                    dx = 0,
                    dy = 0,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 10,
                    yUp = 10,
                    yDown = 0,
                    aimToPlayer = true,
                    speed = 75,
                },
                ['bulletBottomLeft'] = {
                    bullet = 'smallBulletGreen',
                    dx = 0,
                    dy = 0,
                    width = 16,
                    height = 16,
                    xLeft = 10,
                    xRight = 0,
                    yUp = 0,
                    yDown = 10,
                    aimToPlayer = true,
                    speed = 75,
                },
                ['bulletBottomRight'] = {
                    bullet = 'smallBulletGreen',
                    dx = 0,
                    dy = 0,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 10,
                    yUp = 0,
                    yDown = 10,
                    aimToPlayer = true,
                    speed = 75,
                },
                ['bulletCenter'] = {
                    bullet = 'smallBulletBlue',
                    dx = 0,
                    dy = 0,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = true,
                    speed = 75,
                },
            },
            repeatShot = 1,
            fireRate = 0,
            wait = 3,
        },
        data = {
            width = 32,
            height = 32,
            hp = 100,
            scoreOnDeath = 1500
        }
    },
    ['alien-small-spaceship-4'] = {
        animation = {
            ['still'] = {
                frames = {16},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-left'] = {
                frames = {17},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-right'] = {
                frames = {19},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-up'] = {
                frames = {18},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['moving-down'] = {
                frames = {20},
                interval = 0.2,
                texture = 'x32EnemyShips'
            },
            ['explode'] = {
                frames = {1,2,3,4,5,6,7,8,9,10},
                interval = 0.1,
                texture = 'x32explosion'
            }
        },
        patterns = {
            bullets = {
                ['bulletFarLeft'] = {
                    bullet = 'smallBulletPurple',
                    dx = -20,
                    dy = 85,
                    width = 16,
                    height = 16,
                    xLeft = 10,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 75,
                },
                ['bulletCloseLeft'] = {
                    bullet = 'smallBulletPurple',
                    dx = -10,
                    dy = 90,
                    width = 16,
                    height = 16,
                    xLeft = 5,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 75,
                },
                ['bulletFarRigth'] = {
                    bullet = 'smallBulletPurple',
                    dx = 20,
                    dy = 85,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 10,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 75,
                },
                ['bulletCloseRigth'] = {
                    bullet = 'smallBulletPurple',
                    dx = 10,
                    dy = 90,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 5,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 75,
                },
                ['bulletCenter'] = {
                    bullet = 'smallBulletPurple',
                    dx = 0,
                    dy = 92,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 100,
                },
            },
            repeatShot = 1,
            fireRate = 0,
            wait = 1.5,
        },
        data = {
            width = 32,
            height = 32,
            hp = 60,
            scoreOnDeath = 900
        }
    },
    ['alien-small-spaceship-5'] = {
        animation = {
            ['still'] = {
                frames = {1},
                interval = 0.2,
                texture = 'x48EnemyShips'
            },
            ['moving-left'] = {
                frames = {2},
                interval = 0.2,
                texture = 'x48EnemyShips'
            },
            ['moving-right'] = {
                frames = {4},
                interval = 0.2,
                texture = 'x48EnemyShips'
            },
            ['moving-up'] = {
                frames = {3},
                interval = 0.2,
                texture = 'x48EnemyShips'
            },
            ['moving-down'] = {
                frames = {5},
                interval = 0.2,
                texture = 'x48EnemyShips'
            },
            ['explode'] = {
                frames = {1,2,3,4,5,6,7,8,9,10},
                interval = 0.1,
                texture = 'x32explosion'
            }
        },
        patterns = {
            bullets = {
                ['bulletLeft'] = {
                    bullet = 'smallBulletBlue',
                    dx = 0,
                    dy = 0,
                    width = 16,
                    height = 16,
                    xLeft = 32,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = true,
                    speed = 100,
                },
                ['bulletRight'] = {
                    bullet = 'smallBulletBlue',
                    dx = 0,
                    dy = 0,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 32,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = true,
                    speed = 100,
                },
            },
            repeatShot = 5,
            fireRate = 0.1,
            wait = 1.2,
        },
        data = {
            width = 48,
            height = 38,
            hp = 80,
            scoreOnDeath = 2500
        }
    },
    ['alien-small-spaceship-6'] = {
        animation = {
            ['still'] = {
                frames = {6},
                interval = 0.2,
                texture = 'x48EnemyShips'
            },
            ['moving-left'] = {
                frames = {7},
                interval = 0.2,
                texture = 'x48EnemyShips'
            },
            ['moving-right'] = {
                frames = {9},
                interval = 0.2,
                texture = 'x48EnemyShips'
            },
            ['moving-up'] = {
                frames = {8},
                interval = 0.2,
                texture = 'x48EnemyShips'
            },
            ['moving-down'] = {
                frames = {10},
                interval = 0.2,
                texture = 'x48EnemyShips'
            },
            ['explode'] = {
                frames = {1,2,3,4,5,6,7,8,9,10},
                interval = 0.1,
                texture = 'x32explosion'
            }
        },
        patterns = {
            bullets = {
                ['YellowBottom'] = {
                    bullet = 'mediumBulletYellow',
                    dx = 0,
                    dy = 130,
                    width = 32,
                    height = 32,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
                ['YellowBottomLeft'] = {
                    bullet = 'smallBulletYellow',
                    dx = -100,
                    dy = 100,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
                ['YellowBottomRight'] = {
                    bullet = 'smallBulletYellow',
                    dx = 100,
                    dy = 100,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
                ['YellowLeft'] = {
                    bullet = 'mediumBulletYellow',
                    dx = -130,
                    dy = 0,
                    width = 32,
                    height = 32,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
                ['YellowRight'] = {
                    bullet = 'mediumBulletYellow',
                    dx = 130,
                    dy = 0,
                    width = 32,
                    height = 32,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
                ['YellowTopLeft'] = {
                    bullet = 'smallBulletYellow',
                    dx = -100,
                    dy = -100,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
                ['YellowTopRight'] = {
                    bullet = 'smallBulletYellow',
                    dx = 100,
                    dy = -100,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
                ['YellowTop'] = {
                    bullet = 'mediumBulletYellow',
                    dx = 0,
                    dy = -130,
                    width = 32,
                    height = 32,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 200,
                },
            },
            repeatShot = 1,
            fireRate = 1,
            wait = 1,
        },
        data = {
            width = 48,
            height = 48,
            hp = 120,
            scoreOnDeath = 3000
        }
    },
    ['alien-boss-1'] = {
        animation = {
            ['still'] = {
                frames = {1},
                interval = 0.2,
                texture = 'boss1Ship'
            },
            ['moving-left'] = {
                frames = {1},
                interval = 0.2,
                texture = 'boss1Ship'
            },
            ['moving-right'] = {
                frames = {1},
                interval = 0.2,
                texture = 'boss1Ship'
            },
            ['moving-up'] = {
                frames = {1},
                interval = 0.2,
                texture = 'boss1Ship'
            },
            ['moving-down'] = {
                frames = {1},
                interval = 0.2,
                texture = 'boss1Ship'
            },
            ['explode'] = {
                frames = {1,2,3,4,5,6,7,8,9,10},
                interval = 0.1,
                texture = 'x32explosion'
            }
        },
        patterns = {
            bullets = {
                ['bulletCenter'] = {
                    bullet = 'mediumBulletPurple',
                    dx = 0,
                    dy = 0,
                    width = 32,
                    height = 32,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 38,
                    aimToPlayer = true,
                    speed = 40,
                },
                ['bulletBlue1'] = {
                    bullet = 'smallBulletBlue',
                    dx = -25,
                    dy = 0,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletBlue2'] = {
                    bullet = 'smallBulletBlue',
                    dx = -23,
                    dy = -7,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletBlue3'] = {
                    bullet = 'smallBulletBlue',
                    dx = -18,
                    dy = -13,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletBlue4'] = {
                    bullet = 'smallBulletBlue',
                    dx = -13,
                    dy = -18,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletBlue5'] = {
                    bullet = 'smallBulletBlue',
                    dx = -7,
                    dy = -23,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletBlue6'] = {
                    bullet = 'smallBulletBlue',
                    dx = 0,
                    dy = -25,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletBlue7'] = {
                    bullet = 'smallBulletBlue',
                    dx = 7,
                    dy = -23,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletBlue8'] = {
                    bullet = 'smallBulletBlue',
                    dx = 13,
                    dy = -18,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletBlue9'] = {
                    bullet = 'smallBulletBlue',
                    dx = 18,
                    dy = -13,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletBlue10'] = {
                    bullet = 'smallBulletBlue',
                    dx = 23,
                    dy = -7,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletBlue11'] = {
                    bullet = 'smallBulletBlue',
                    dx = 25,
                    dy = 0,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 0,
                    yUp = 0,
                    yDown = 0,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletLeftFarLeftArm'] = {
                    bullet = 'smallBulletYellow',
                    dx = -100,
                    dy = 100,
                    width = 16,
                    height = 16,
                    xLeft = 34,
                    xRight = 0,
                    yUp = 0,
                    yDown = 34,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletRightFarLeftArm'] = {
                    bullet = 'smallBulletYellow',
                    dx = 100,
                    dy = 100,
                    width = 16,
                    height = 16,
                    xLeft = 34,
                    xRight = 0,
                    yUp = 0,
                    yDown = 34,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletLeftCloseLeftArm'] = {
                    bullet = 'smallBulletYellow',
                    dx = -100,
                    dy = 200,
                    width = 16,
                    height = 16,
                    xLeft = 24,
                    xRight = 0,
                    yUp = 0,
                    yDown = 39,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletRightCloseLeftArm'] = {
                    bullet = 'smallBulletYellow',
                    dx = 100,
                    dy = 200,
                    width = 16,
                    height = 16,
                    xLeft = 24,
                    xRight = 0,
                    yUp = 0,
                    yDown = 39,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletLeftFarRightArm'] = {
                    bullet = 'smallBulletYellow',
                    dx = -100,
                    dy = 100,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 34,
                    yUp = 0,
                    yDown = 34,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletRightFarRightArm'] = {
                    bullet = 'smallBulletYellow',
                    dx = 100,
                    dy = 100,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 34,
                    yUp = 0,
                    yDown = 34,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletLeftCloseRightArm'] = {
                    bullet = 'smallBulletYellow',
                    dx = -100,
                    dy = 200,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 24,
                    yUp = 0,
                    yDown = 39,
                    aimToPlayer = false,
                    speed = 100,
                },
                ['bulletRightCloseRightArm'] = {
                    bullet = 'smallBulletYellow',
                    dx = 100,
                    dy = 200,
                    width = 16,
                    height = 16,
                    xLeft = 0,
                    xRight = 24,
                    yUp = 0,
                    yDown = 39,
                    aimToPlayer = false,
                    speed = 100,
                },
            },
            repeatShot = 1,
            fireRate = 0,
            wait = 0.5,
        },
        data = {
            width = 77,
            height = 77,
            hp = 500,
            scoreOnDeath = 15000
        }
    },
}