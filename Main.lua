-- Liswebsite

-- Use this function to perform your initial setup
function setup()
    print("Hello World!")
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(40, 40, 50)

    -- This sets the line thickness
    strokeWidth(5)

    -- Do your drawing here
    
end

-- Configuración inicial
function setup()
    background(20, 20, 30)
    
    -- Cargar portada y assets
    portada = readImage(asset.documents.Liswebsite.portada_lis)
    lisLogo = readImage(asset.documents.Liswebsite.lisLogo)
    lisAnimacion = readImage(asset.documents.Liswebsite.lisanimacion)
    
    -- Cargar banners
    banner1 = readImage(asset.documents.Liswebsite.banner1)
    banner2 = readImage(asset.documents.Liswebsite.banner2)
    banner3 = readImage(asset.documents.Liswebsite.banner3)
    banner4 = readImage(asset.documents.Liswebsite.banner4)
    banner5 = readImage(asset.documents.Liswebsite.banner5)
    
    -- Cargar anuncios
    anuncio1 = readImage(asset.documents.Liswebsite.anuncio1)
    anuncio2 = readImage(asset.documents.Liswebsite.anuncio2)
    anuncio3 = readImage(asset.documents.Liswebsite.anuncio3)
    
    scrollY = 0
    time = 0
    
    -- Lista de moneditas flotantes
    moneditas = {}
    for i = 1, 10 do
        table.insert(moneditas, {
            x = math.random(WIDTH),
            y = math.random(HEIGHT),
            size = math.random(30, 50),
            speedX = math.random(-30, 30) / 100,
            speedY = math.random(-30, 30) / 100
        })
    end
    
    -- Botones principales
    buttons = {
        {x = WIDTH / 2, y = HEIGHT / 2 - 100, width = 250, height = 60, text = "Connect Wallet", pressed = false},
        {x = WIDTH / 2, y = HEIGHT / 2 - 180, width = 250, height = 60, text = "NFTs", pressed = false},
        {x = WIDTH / 2, y = HEIGHT / 2 - 260, width = 250, height = 60, text = "Juego", pressed = false}
    }
end

function draw()
    background(20, 20, 30)
    
    -- Scroll
    translate(0, scrollY)
    
    -- Portada superior
    spriteMode(CORNER)
    sprite(portada, 0, HEIGHT / 2, WIDTH, HEIGHT / 2)
    
    -- Moneda principal flotante
    time = time + DeltaTime
    local logoY = (HEIGHT / 4.3) - 60 + math.sin(time * 2) * 15
    spriteMode(CENTER)
    sprite(lisLogo, WIDTH / 2, logoY, 180, 180)
    
    -- Moneditas flotantes
    for i = 1, #moneditas do
        local m = moneditas[i]
        sprite(lisAnimacion, m.x, m.y, m.size, m.size)
        m.x = m.x + m.speedX
        m.y = m.y + m.speedY
        if m.x < 0 or m.x > WIDTH then m.speedX = -m.speedX end
        if m.y < 0 or m.y > HEIGHT then m.speedY = -m.speedY end
    end
    
    -- Dibujar botones
    for i, btn in ipairs(buttons) do
        drawButton(btn)
    end
    
    -- Parámetros de diseño
    local baseY = HEIGHT / 2 - 600 -- Empezar más abajo de los botones
    local spacingY = 450 -- Espacio vertical entre cada elemento
    local bannerWidth = WIDTH * 0.5
    local bannerHeight = HEIGHT * 0.22
    local anuncioWidth = WIDTH * 0.35
    local anuncioHeight = HEIGHT * 0.18
    
    -- Distribución ordenada de banners y anuncios
    sprite(banner1, WIDTH / 2, baseY, bannerWidth, bannerHeight)
    
    sprite(anuncio1, WIDTH / 2, baseY - spacingY, anuncioWidth, anuncioHeight)
    
    sprite(banner2, WIDTH / 2, baseY - spacingY * 2, bannerWidth, bannerHeight)
    
    sprite(anuncio2, WIDTH / 2, baseY - spacingY * 3, anuncioWidth, anuncioHeight)
    
    sprite(banner3, WIDTH / 2, baseY - spacingY * 4, bannerWidth, bannerHeight)
    
    sprite(anuncio3, WIDTH / 2, baseY - spacingY * 5, anuncioWidth, anuncioHeight)
    
    sprite(banner4, WIDTH / 2, baseY - spacingY * 6, bannerWidth, bannerHeight)
    
    sprite(banner5, WIDTH / 2, baseY - spacingY * 7, bannerWidth, bannerHeight)
end

function drawButton(btn)
    if btn.pressed then
        fill(150, 70, 250)
    else
        fill(100, 50, 200)
    end
    rectMode(CENTER)
    rect(btn.x, btn.y, btn.width, btn.height, 10)
    
    fill(255)
    fontSize(20)
    text(btn.text, btn.x, btn.y)
end

function touched(touch)
    if touch.state == MOVING then
        scrollY = scrollY + touch.deltaY
    end
end