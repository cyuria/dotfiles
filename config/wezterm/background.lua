local MAXBRIGHTNESS = 3
local MINBRIGHTNESS = 1
local BRIGHTNESSRANGE = MAXBRIGHTNESS - MINBRIGHTNESS

local backgrounds = {
    {
        File = '/home/cyuria/wallpapers/cyber_girl.jpg',
        brightness = 0.03,
    },
    {
        File = '/home/cyuria/wallpapers/sword-red.png',
        brightness = 0.01,
    },
    {
        File = '/home/cyuria/wallpapers/vi-wallpaper-1080p.jpg',
        brightness = 0.04,
    },
}

local function getRandIndex(time, offset)
    time = time or os.date("*t")
    offset = offset or 0
    math.randomseed(time.hour + offset + 1)
    return math.random(#backgrounds)
end

local function smoothtransform(val, min, range)
    -- get the initial smoothing. This will be
    -- squared to achieve sin^2(x*Pi/2)
    local sqrtsmooth = math.sin(math.pi * val / 2)
    -- Square the intermediate value
    local smoothed = sqrtsmooth * sqrtsmooth
    -- Transform the smoothed value to fit the given bounds
    return smoothed * smoothed * range + min
end
local function getBrightness(time)
    -- Get the local time
    time = time or os.date("*t")
    -- Calculate the number of hours in the day so far
    -- including minutes and seconds as fractional components
    local hour = time.hour + (time.min / 60) + (time.sec / 3600)
    -- Put the brightness through a simple transform which centers
    -- the peak brightness on 12 o clock and 
    local HOURSINHALFDAY = 12
    local hourtransform = 1 - math.abs(HOURSINHALFDAY - hour) / HOURSINHALFDAY
    local brightness = smoothtransform(
        hourtransform,
        MINBRIGHTNESS,
        BRIGHTNESSRANGE
    )
    return brightness
end
local function parseWallpaper(wallpaper, brightnessmultiplier)
    brightnessmultiplier = brightnessmultiplier or getBrightness()
    return {
        source = {
            File = wallpaper.File,
            speed = wallpaper.speed,
        },
        repeat_x = wallpaper.repeat_x or 'Mirror',
        hsb = {
            hue = wallpaper.hue,
            saturation = wallpaper.saturation,
            brightness = brightnessmultiplier * (wallpaper.brightness or 1),
        },
    }
end

local function getWallpaper()
    local time = os.date("*t")
    local index = getRandIndex(time)

    local brightness = getBrightness(time)
    local wallpaper = parseWallpaper(
        backgrounds[index],
        brightness
    )

    if (time.min >= 1) then
        return { wallpaper }
    end

    local prevwallpaperindex = getRandIndex(time, -1)
    local prevwallpaper = parseWallpaper(
        backgrounds[prevwallpaperindex],
        brightness
    )

    wallpaper.opacity = time.sec / 60
    return { prevwallpaper, wallpaper }
end

return {
    backgrounds = backgrounds,
    get = getWallpaper,
}

