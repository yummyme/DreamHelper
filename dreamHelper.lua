script_author('yummy')
script_name('DreamHelper')
script_moonloader(026)
script_version("0.3beta")
script_description("")


require 'lib.moonloader'
require 'lib.sampfuncs'
local notf = import 'imgui_notf.lua'
local imgui = require 'imgui'
local sampev = require 'lib.samp.events'
local hook = require "lib.samp.events"
local encoding = require 'encoding'
local rkeys = require 'rkeys'
local memory = require 'memory'
imgui.HotKey = require('imgui_addons').HotKey
local inicfg = require 'inicfg'
local icons = require 'fAwesome5'
encoding.default = 'CP1251'
u8 = encoding.UTF8




----------- server load save 

local serverList = "moonloader/dhelpresource/settings.ini"
local loadServer = inicfg.load(nil, serverList)
local servers = {}
if loadServer.serverlist == nil then 
    loadServer.serverlist = {
        ips = 0 ,
        startAC = 0
    }
end
---- load other 
local otherCfg = "moonloader/dhelpresource/settings.ini"
local loadOthercfg = inicfg.load(nil, otherCfg)
if loadOthercfg.other == nil then 
    loadOthercfg.other = {
        startAF = 0,
        startFD = 0,
        startDD = 0,
        showFPS = 0,
        positionx = 300.00,
        positiony = 20.00,
    }
end

---------- load themem 
local ThemeConfig = "moonloader/dhelpresource/settings.ini"
local loadTheme = inicfg.load(nil, ThemeConfig)
if loadTheme.theme == nil then 
    loadTheme.theme = {
       themenumber = 1
    }
end
------------load skins
local skinsID = "moonloader/dhelpresource/settings.ini"
local loadSkinID = inicfg.load(nil, skinsID)
if loadSkinID.skin == nil then 
    loadSkinID.skin = {
       id = 115, 
       staticBool = 1
    }
end

---------- keys 

local allKeys = "moonloader/dhelpresource/settings.ini"
local loadKeys = inicfg.load(nil, allKeys)
local tLastKeys = {}
if loadKeys.settings == nil then 
    loadKeys.settings = {
        key1 = "[18,83]"
    }
end
local ActiveMenu = {
	v = decodeJson(loadKeys.settings.key1)
}

-------- WTc laod 
local TConfig = "moonloader/dhelpresource/settings.ini"
local loadTConfig = inicfg.load(nil, TConfig)
if loadTConfig.wtconfig == nil then 
    loadTConfig.wtconfig = {
        hour = "[12]",
        weather = "[13]",
        distance = 1000
    }
end


-----


local bindpath = "moonloader/dhelpresource/settings.ini"
local bindlist = inicfg.load(nil, bindpath)
if bindlist.binder == nil then
   bindlist.binder = {
        bind1= 'text1',
        bind2= 0,
        bind3= 0,
        bind4= 0,
        bind5= 0,
        bind6= 0,
        bind7= 0,
        bind8= 0,      
        bindkey1 = "[18,83]",
        bindkey2 = "[18,83]",
        bindkey3 = "[18,83]",
        bindkey4 = "[18,83]",
        bindkey5 = "[18,83]",
        bindkey6 = "[18,83]",
        bindkey7 = "[18,83]",
        bindkey8 = "[18,83]",
    }
end
local enterBind1 = {
    v = decodeJson(bindlist.binder.bindkey1)
}
local enterBind2 = {
    v = decodeJson(bindlist.binder.bindkey2)
}
local enterBind3 = {
    v = decodeJson(bindlist.binder.bindkey3)
}
local enterBind4 = {
    v = decodeJson(bindlist.binder.bindkey4)
}
local enterBind5 = {
    v = decodeJson(bindlist.binder.bindkey5)
}
local enterBind6 = {
    v = decodeJson(bindlist.binder.bindkey6)
}
local enterBind7 = {
    v = decodeJson(bindlist.binder.bindkey7)
}
local enterBind8 = {
    v = decodeJson(bindlist.binder.bindkey8)
}
local bindLastKeys = {}
-----windows 
local body_script = 1
show_main_window = imgui.ImBool(false)
local x,y = getScreenResolution()
local btn_size = imgui.ImVec2(-0.1,0)
time_slider = imgui.ImInt(0)
weather_slider = imgui.ImInt(0)
distance_slider = imgui.ImFloat(0)
bool_result  = imgui.ImInt(0)
price_bool  = imgui.ImInt(0)
skinID = imgui.ImInt(0)
testBool = imgui.ImBuffer(256)
old = {}





------icons 
local fa_font = nil
local fa_glyph_ranges = imgui.ImGlyphRanges({ icons.min_range, icons.max_range })
function imgui.BeforeDrawFrame()
    if fa_font == nil then
        local font_config = imgui.ImFontConfig() 
        font_config.MergeMode = true

        fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/dhelpresource/fonts/fa-solid-900.ttf', 13.0, font_config, fa_glyph_ranges)
    end
end
-------- pricelist
local moto = "moonloader/dhelpresource/prices/moto.ini"
local skins = "moonloader/dhelpresource/prices/skins.ini"
local other = "moonloader/dhelpresource/prices/other.ini"
local accessories = "moonloader/dhelpresource/prices/accessories.ini"
local cars = "moonloader/dhelpresource/prices/cars.ini"
loadMoto = inicfg.load(nil, moto)
loadSkins = inicfg.load(nil, skins)
loadOther = inicfg.load(nil, other)
loadAccessories =  inicfg.load(nil, accessories)
loadCars = inicfg.load(nil, cars)


local carsNames = {
    names = {
     loadCars.cars.name_1,
     loadCars.cars.name_2,
     loadCars.cars.name_3,
     loadCars.cars.name_4,
     loadCars.cars.name_5,
     loadCars.cars.name_6,
     loadCars.cars.name_7,
     loadCars.cars.name_8,
     loadCars.cars.name_9,
     loadCars.cars.name_10,
     loadCars.cars.name_11,
     loadCars.cars.name_12,
     loadCars.cars.name_13,
     loadCars.cars.name_14,
     loadCars.cars.name_15,
     loadCars.cars.name_16,
     loadCars.cars.name_17,
     loadCars.cars.name_18,
     loadCars.cars.name_19,
     loadCars.cars.name_20,
     loadCars.cars.name_21,
     loadCars.cars.name_22,
     loadCars.cars.name_23,
     loadCars.cars.name_24,
     loadCars.cars.name_25,
     loadCars.cars.name_26,
     loadCars.cars.name_27,
     loadCars.cars.name_28,
     loadCars.cars.name_29,
     loadCars.cars.name_30,
     loadCars.cars.name_31,
     loadCars.cars.name_32, 
    
    }
}


local carsPrices = {
    prices = {
     loadCars.cars.price_1,
     loadCars.cars.price_2,
     loadCars.cars.price_3,
     loadCars.cars.price_4,
     loadCars.cars.price_5,
     loadCars.cars.price_6,
     loadCars.cars.price_7,
     loadCars.cars.price_8,
     loadCars.cars.price_9,
     loadCars.cars.price_10,
     loadCars.cars.price_11,
     loadCars.cars.price_12,
     loadCars.cars.price_13,
     loadCars.cars.price_14,
     loadCars.cars.price_15,
     loadCars.cars.price_16,
     loadCars.cars.price_17,
     loadCars.cars.price_18,
     loadCars.cars.price_19,
     loadCars.cars.price_20,
     loadCars.cars.price_21,
     loadCars.cars.price_22,
     loadCars.cars.price_23,
     loadCars.cars.price_24,
     loadCars.cars.price_25,
     loadCars.cars.price_26,
     loadCars.cars.price_27,
     loadCars.cars.price_28,
     loadCars.cars.price_29,
     loadCars.cars.price_30,
     loadCars.cars.price_31,
     loadCars.cars.price_32, 
     
    }
}



local otherPrices = {
    prices = {
    loadOther.other.price_1,
    loadOther.other.price_2,
    loadOther.other.price_3,
    loadOther.other.price_4,
    loadOther.other.price_5,
    loadOther.other.price_6,
    loadOther.other.price_7,
    loadOther.other.price_8,
    loadOther.other.price_9,
    loadOther.other.price_10,
    }
}

local otherNames = {
    names = {
    loadOther.other.name_1,
    loadOther.other.name_2,
    loadOther.other.name_3,
    loadOther.other.name_4,
    loadOther.other.name_5,
    loadOther.other.name_6,
    loadOther.other.name_7,
    loadOther.other.name_8,
    loadOther.other.name_9,
    loadOther.other.name_10,
    }
}

local skinPrices = {
    prices = {
    loadSkins.skins.price_1,
    loadSkins.skins.price_2,
    loadSkins.skins.price_3,
    loadSkins.skins.price_4,
    loadSkins.skins.price_5,
    loadSkins.skins.price_6,
    loadSkins.skins.price_7,
    loadSkins.skins.price_8,
    loadSkins.skins.price_9,
    loadSkins.skins.price_10,
    loadSkins.skins.price_11,
    loadSkins.skins.price_12,
    loadSkins.skins.price_13,
    }
}

local skinNames = {
    names = {
    loadSkins.skins.name_1,
    loadSkins.skins.name_2,
    loadSkins.skins.name_3,
    loadSkins.skins.name_4,
    loadSkins.skins.name_5,
    loadSkins.skins.name_6,
    loadSkins.skins.name_7,
    loadSkins.skins.name_8,
    loadSkins.skins.name_9,
    loadSkins.skins.name_10,
    loadSkins.skins.name_11,
    loadSkins.skins.name_12,
    loadSkins.skins.name_13, 
    }
}

local motoprices = {
    prices = {
     loadMoto.moto.price_1,
     loadMoto.moto.price_2, 
     loadMoto.moto.price_3,
     loadMoto.moto.price_4, 
     loadMoto.moto.price_5, 
     loadMoto.moto.price_6, 
     loadMoto.moto.price_7

    }
}
local motoNames = {
    names = {
     loadMoto.moto.name_1,
     loadMoto.moto.name_2,
     loadMoto.moto.name_3,
     loadMoto.moto.name_4,
     loadMoto.moto.name_5,
     loadMoto.moto.name_6,
     loadMoto.moto.name_7,
    }
}

accessoriesNames = {
    names = {
    loadAccessories.accessories.name_1,
    loadAccessories.accessories.name_2,
    loadAccessories.accessories.name_3,
    loadAccessories.accessories.name_4,
    loadAccessories.accessories.name_5,
    loadAccessories.accessories.name_6,
    loadAccessories.accessories.name_7,
    loadAccessories.accessories.name_8,
    loadAccessories.accessories.name_9,
    loadAccessories.accessories.name_10,
    loadAccessories.accessories.name_12,
    loadAccessories.accessories.name_14,
    loadAccessories.accessories.name_15,
    loadAccessories.accessories.name_16,
    loadAccessories.accessories.name_17,
    loadAccessories.accessories.name_18,
    loadAccessories.accessories.name_19,
    loadAccessories.accessories.name_20,
    loadAccessories.accessories.name_21,
    loadAccessories.accessories.name_22,
    loadAccessories.accessories.name_23,
    loadAccessories.accessories.name_24,
    loadAccessories.accessories.name_25,
    loadAccessories.accessories.name_25,
    loadAccessories.accessories.name_26,
    loadAccessories.accessories.name_27,
    loadAccessories.accessories.name_28,
    loadAccessories.accessories.name_29,
    loadAccessories.accessories.name_30,
    loadAccessories.accessories.name_31,
    loadAccessories.accessories.name_32,
    loadAccessories.accessories.name_33,
    loadAccessories.accessories.name_33,
    loadAccessories.accessories.name_34,
    loadAccessories.accessories.name_35,
    loadAccessories.accessories.name_36,
    loadAccessories.accessories.name_37,
    loadAccessories.accessories.name_38,
    loadAccessories.accessories.name_39,
    loadAccessories.accessories.name_40,
    loadAccessories.accessories.name_41,
    loadAccessories.accessories.name_42,
    loadAccessories.accessories.name_43,
    loadAccessories.accessories.name_43,
    loadAccessories.accessories.name_44,
    loadAccessories.accessories.name_45,
    loadAccessories.accessories.name_46,    
    loadAccessories.accessories.name_47,
    loadAccessories.accessories.name_48,
    loadAccessories.accessories.name_49,
    loadAccessories.accessories.name_50,
    loadAccessories.accessories.name_51,
    loadAccessories.accessories.name_52,
    loadAccessories.accessories.name_53,
    loadAccessories.accessories.name_53,
    loadAccessories.accessories.name_54,
    loadAccessories.accessories.name_55,
    loadAccessories.accessories.name_56,
    loadAccessories.accessories.name_57,
    loadAccessories.accessories.name_58,
    loadAccessories.accessories.name_59,
    loadAccessories.accessories.name_60,
    loadAccessories.accessories.name_70,
    loadAccessories.accessories.name_71,
    loadAccessories.accessories.name_72,
    loadAccessories.accessories.name_73,
    loadAccessories.accessories.name_74,
    loadAccessories.accessories.name_75,
    loadAccessories.accessories.name_76,
    loadAccessories.accessories.name_77,
    loadAccessories.accessories.name_78,
    loadAccessories.accessories.name_79,
    }
}    

accessoriesPrices = {
    prices = {
    loadAccessories.accessories.price_1,
    loadAccessories.accessories.price_2,
    loadAccessories.accessories.price_3,
    loadAccessories.accessories.price_4,
    loadAccessories.accessories.price_5,
    loadAccessories.accessories.price_6,
    loadAccessories.accessories.price_7,
    loadAccessories.accessories.price_8,
    loadAccessories.accessories.price_9,
    loadAccessories.accessories.price_10,
    loadAccessories.accessories.price_12,
    loadAccessories.accessories.price_14,
    loadAccessories.accessories.price_15,
    loadAccessories.accessories.price_16,
    loadAccessories.accessories.price_17,
    loadAccessories.accessories.price_18,
    loadAccessories.accessories.price_19,
    loadAccessories.accessories.price_20,
    loadAccessories.accessories.price_21,
    loadAccessories.accessories.price_22,
    loadAccessories.accessories.price_23,
    loadAccessories.accessories.price_24,
    loadAccessories.accessories.price_25,
    loadAccessories.accessories.price_25,
    loadAccessories.accessories.price_26,
    loadAccessories.accessories.price_27,
    loadAccessories.accessories.price_28,
    loadAccessories.accessories.price_29,
    loadAccessories.accessories.price_30,
    loadAccessories.accessories.price_31,
    loadAccessories.accessories.price_32,
    loadAccessories.accessories.price_33,
    loadAccessories.accessories.price_33,
    loadAccessories.accessories.price_34,
    loadAccessories.accessories.price_35,
    loadAccessories.accessories.price_36,
    loadAccessories.accessories.price_37,
    loadAccessories.accessories.price_38,
    loadAccessories.accessories.price_39,
    loadAccessories.accessories.price_40,
    loadAccessories.accessories.price_41,
    loadAccessories.accessories.price_42,
    loadAccessories.accessories.price_43,
    loadAccessories.accessories.price_43,
    loadAccessories.accessories.price_44,
    loadAccessories.accessories.price_45,
    loadAccessories.accessories.price_46,    
    loadAccessories.accessories.price_47,
    loadAccessories.accessories.price_48,
    loadAccessories.accessories.price_49,
    loadAccessories.accessories.price_50,
    loadAccessories.accessories.price_51,
    loadAccessories.accessories.price_52,
    loadAccessories.accessories.price_53,
    loadAccessories.accessories.price_53,
    loadAccessories.accessories.price_54,
    loadAccessories.accessories.price_55,
    loadAccessories.accessories.price_56,
    loadAccessories.accessories.price_57,
    loadAccessories.accessories.price_58,
    loadAccessories.accessories.price_59,
    loadAccessories.accessories.price_60,
    loadAccessories.accessories.price_70,
    loadAccessories.accessories.price_71,
    loadAccessories.accessories.price_72,
    loadAccessories.accessories.price_73,
    loadAccessories.accessories.price_74,
    loadAccessories.accessories.price_75,
    loadAccessories.accessories.price_76,
    loadAccessories.accessories.price_77,
    loadAccessories.accessories.price_78,
    loadAccessories.accessories.price_79,
    }
}    

--------- all functions

    function motoPrice()
        imgui.BeginChild("#moto", imgui.ImVec2(395,360), true)
        imgui.Columns(2,"Moto", true)
        imgui.Text(u8"Название:")
        imgui.NextColumn()
        imgui.Text(u8"Цена:")
        imgui.Separator()
        imgui.NextColumn()
            for i, k in ipairs(motoNames.names) do
                imgui.Text(u8(k)) 
            end
        imgui.NextColumn()
            for i, k in ipairs(motoprices.prices) do
                imgui.Text(k..'$')
            end
        imgui.Columns(1)
        imgui.Separator()
        imgui.EndChild()
    end

    function skinsPrice()
        imgui.BeginChild("#skins", imgui.ImVec2(395,360), true)
        imgui.Columns(2,"Skins", true)
        imgui.Text(u8"Название:")
        imgui.NextColumn()
        imgui.Text(u8"Цена:")
        imgui.Separator()
        imgui.NextColumn()
            for i, k in ipairs(skinNames.names) do
                imgui.Text(u8(k)) 
            end
        imgui.NextColumn()
            for i, k in ipairs(skinPrices.prices) do
                imgui.Text(k..'$')
            end
        imgui.Columns(1)
        imgui.Separator()
        imgui.EndChild()
    end
    function otherPrice()
        imgui.BeginChild("#other", imgui.ImVec2(395,360), true)
        imgui.Columns(2,"Other", true)
        imgui.Text(u8"Название:")
        imgui.NextColumn()
        imgui.Text(u8"Цена:")
        imgui.Separator()
        imgui.NextColumn()
            for i, k in ipairs(otherNames.names) do
                imgui.Text(u8(k)) 
            end
        imgui.NextColumn()
            for i, k in ipairs(otherPrices.prices) do
                imgui.Text(k..'$')
            end
        imgui.Columns(1)
        imgui.Separator()
        imgui.EndChild()
    end
    function accessoriesPrice()
        imgui.BeginChild("#accessories", imgui.ImVec2(395,360), true)
        imgui.Columns(2,"Accessories", true)
        imgui.Text(u8"Название:")
        imgui.NextColumn()
        imgui.Text(u8"Цена:")
        imgui.Separator()
        imgui.NextColumn()
            for i, k in ipairs(accessoriesNames.names) do
                imgui.Text(u8(k)) 
            end
        imgui.NextColumn()
            for i, k in ipairs(accessoriesPrices.prices) do
                imgui.Text(k..'$')
            end
        imgui.Columns(1)
        imgui.Separator()
        imgui.EndChild()
    end

    -- function moneySeparate() -- взято от сюда https://forum.grand-rp.su/threads/198136/
        
    -- function comma_value(n)
    --     local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
    --     return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
    -- end

    -- function separator(text)
    --     if text:find("$") then
    --         for S in string.gmatch(text, "%$%d+") do
    --             local replace = comma_value(S)
    --             text = string.gsub(text, S, replace)
    --         end
    --         for S in string.gmatch(text, "%d+%$") do
    --             S = string.sub(S, 0, #S-1)
    --             local replace = comma_value(S)
    --             text = string.gsub(text, S, replace)
    --         end
    --     end
    --     return text
    -- end

    -- function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
    --     text = separator(text)
    --     title = separator(title)
    --     return {dialogId, style, title, button1, button2, text}
    -- end

    -- function sampev.onServerMessage(color, text)
    --     text = separator(text)
    --     return {color, text}
    -- end

    -- function sampev.onCreate3DText(id, color, position, distance, testLOS, attachedPlayerId, attachedVehicleId, text)
    --     text = separator(text)
    --     return {id, color, position, distance, testLOS, attachedPlayerId, attachedVehicleId, text}
    -- end

    -- function sampev.onTextDrawSetString(id, text)
    --     text = separator(text)
    --     return {id, text}
    -- end
    -- end 




    function carsPrice()
        imgui.BeginChild("#cars", imgui.ImVec2(395,360), true)
        imgui.Columns(2,"Cars", true)
        imgui.Text(u8"Название:")
        imgui.NextColumn()
        imgui.Text(u8"Цена:")
        imgui.Separator()
        imgui.NextColumn()
            for i, k in ipairs(carsNames.names) do
                imgui.Text(u8(k)) 
            end
        imgui.NextColumn()
            for i, k in ipairs(carsPrices.prices) do
                imgui.Text(k..'$')
            end
        imgui.Columns(1)
        imgui.Separator()
        imgui.EndChild()
    end

    function imgui.Link(link)
        if status_hovered then
            local p = imgui.GetCursorScreenPos()
            imgui.TextColored(imgui.ImVec4(0, 0.5, 1, 1), link)
            imgui.GetWindowDrawList():AddLine(imgui.ImVec2(p.x, p.y + imgui.CalcTextSize(link).y), imgui.ImVec2(p.x + imgui.CalcTextSize(link).x, p.y + imgui.CalcTextSize(link).y), imgui.GetColorU32(imgui.ImVec4(0, 0.5, 1, 1)))
        else
            imgui.TextColored(imgui.ImVec4(0, 0.3, 0.8, 1), link)
        end
        if imgui.IsItemClicked() then os.execute('explorer '..link)
        elseif imgui.IsItemHovered() then
            status_hovered = true else status_hovered = false
        end
    end

    function set_player_skin(id, skin)
        local _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
        local BS = raknetNewBitStream()
        raknetBitStreamWriteInt32(BS, id)
        raknetBitStreamWriteInt32(BS, skin)
        raknetEmulRpcReceiveBitStream(153, BS)
        raknetDeleteBitStream(BS)
    end
    
    function ShowHelpMarker(param)
        imgui.TextDisabled('(?)')
        if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.PushTextWrapPos(imgui.GetFontSize() * 35.0)
        imgui.TextUnformatted(param)
        imgui.PopTextWrapPos()
        imgui.EndTooltip()
        end
    end

    function clearChat()
        for i = 0, 29 do 
        sampAddChatMessage('')
        end
    end

    function startPage()
        imgui.BeginChild("#spacePage", imgui.ImVec2(395,360), true)
        imgui.Text(u8'Перед тем как посмотреть цены, проверьте наличие\nактуальных цен. ')
        imgui.Text(u8'Чтобы это сделать нужно проверить обновление скрипта.')
        imgui.EndChild()

    end 

    function spacePage()
        imgui.BeginChild("#spacePage", imgui.ImVec2(395,360), true)
        imgui.EndChild()

    end 

    function inAFK()
        memory.setuint8(7634870, 1, false)
        memory.setuint8(7635034, 1, false)
        memory.fill(7623723, 144, 8, false)
        memory.fill(5499528, 144, 6, false)
        
    end
    function outAFK()
        memory.setuint8(7634870, 0, false)
        memory.setuint8(7635034, 0, false)
        memory.hex2bin('0F 84 7B 01 00 00', 7623723, 8)
        memory.hex2bin('50 51 FF 15 00 83 85 00', 5499528, 6)
    end

    function deleteTextdraw(tempIP)
        ip =   sampGetCurrentServerAddress()
        phoenix = "185.169.134.3"
        tucson = "185.169.134.4:7777"
        scottdale = "185.169.134.43:7777"
        chandler = "185.169.134.44:7777"
        brainburg = "185.169.134.45"  
        rose = "185.169.134.5:7777"
        mesa = "185.169.134.59:7777"
        redrock = "185.169.134.61:7777" 
        yuma = "185.169.134.107:7777"
        surprise = "185.169.134.109:7777"
        prescott = "185.169.134.166:7777"
        glendale = "185.169.134.171:7777"
        kingman = "185.169.134.172:7777"

        for i = 1, 13 do
        servers = {phoenix, tucson, scottdale, chandler, brainburg, rose, mesa, redrock, yuma, surprise, prescott, glendale, kingman}
            if ip == servers[i] then 
                tempIP = i
                sampTextdrawDelete(548)
                sampTextdrawDelete(549)
                sampTextdrawDelete(550)
                loadServer.serverlist.ips = tempIP
                inicfg.save(loadServer, serverList)
            end
        end
        -------- лого с кактусом 
        -- for i = 508, 518 do         
        --     sampTextdrawDelete(i)
        -- end

    end

    function FPS()
    if fpsind == 1 then 
        lua_thread.create(function()
            wait(1000)
            local testfps =  memory.getfloat(0xB7CB50, 4, false) 
            -- local position1x = 0.0
            -- local position1y = 1.0
            -- local position2x = 300.0
            -- local position2y = 1.0
            -- local position3x = 630.0
            -- local position3y = 0.1
            -- local position4x = 0.1
            -- local position4y = 440.0
            -- local position5x = 300.0
            -- local position5y =  440.0
            -- local position6x = 630.0
            -- local position6y = 440.0
            local globalposx = tonumber(loadOthercfg.other.positionx)
            local globalposy = tonumber(loadOthercfg.other.positiony)
            sampTextdrawCreate(1,math.ceil(testfps), globalposx, globalposy, 0xD7FFFFFF)  
            return true
        end)
    elseif fpsind == 0 then 
            local globalposx = 0.0
            local globalposy = tonumber(loadOthercfg.other.positiony)
            local testfps =  memory.getfloat(0xB7CB50, 4, false) 
            sampTextdrawCreate(1,'', globalposx, globalposy, 0xD7FFFFFF) 
    end 
    end


    function enableLC()
        function sampev.onServerMessage(color, text)
            if string.find(text, "Игроки со статусом") then
                local tempIP = tonumber(loadServer.serverlist.ips)
                startacces = tonumber(loadServer.serverlist.startAC)
                if startacces == 1 then deleteTextdraw(tempIP) end
            end
        end
    
    end

    function offDescr()
        for i=0, 2048 do
            if sampIs3dTextDefined(i) then
            local text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById(i)
                if color == 4291611852 and playerId >= 0 then sampDestroy3dText(i) end

            end
        end
    end


    function enableAFKs()
        startAFK = tonumber(loadOthercfg.other.startAF)
        startFD = tonumber(loadOthercfg.other.startFD)
        startDD = tonumber(loadOthercfg.other.startDD)
        startFPS = tonumber(loadOthercfg.other.showFPS)
        if startAFK == 1 then inAFK() end 
        if startAFK == 0 then outAFK() end 
        if startFD == 1 then offFam() end
        if startFD == 0 then  end
        if startDD == 1 then offDescr() end
        if startDD == 0 then  end
        if startFPS == 1 then FPS() end
        if startFPS == 0 then  end
    end

    boolFPS =   tonumber(loadOthercfg.other.showFPS)
    if boolFPS == 0 then 
        showFPSstatus = imgui.ImBool(false)
    elseif boolFPS == 1 then 
        showFPSstatus = imgui.ImBool(true)
    end


    boolAC =  tonumber(loadServer.serverlist.startAC)
    if boolAC == 0 then 
        deleteStatus = imgui.ImBool(false)
    elseif boolAC == 1 then 
        deleteStatus = imgui.ImBool(true)
    end

    boolAF = tonumber(loadOthercfg.other.startAF)
    if boolAF == 0 then 
        afkStatus = imgui.ImBool(false)
    elseif boolAF == 1 then 
        afkStatus = imgui.ImBool(true)
    end

    boolFD = tonumber(loadOthercfg.other.startFD)
    if boolFD == 0 then 
        famdeleteStatus = imgui.ImBool(false)
    elseif boolFD == 1 then 
        famdeleteStatus = imgui.ImBool(true)
    end

    boolDD = tonumber(loadOthercfg.other.startDD)
    if boolDD == 0 then 
        DescriptionDeleteStatus = imgui.ImBool(false)
    elseif boolDD == 1 then 
        DescriptionDeleteStatus = imgui.ImBool(true)
    end


    function getPlayerInfo()
    local _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)

    local ping = sampGetPlayerPing(id)
    local nick = sampGetPlayerNickname(id)
    local score = sampGetPlayerScore(id)
    local servername = sampGetCurrentServerName()
    local ipinfo, port = sampGetCurrentServerAddress()
    local hp = getCharHealth(PLAYER_PED)
    local armour = getCharArmour(PLAYER_PED)
    local weapon = getCurrentCharWeapon(PLAYER_PED)
    local ammo = getAmmoInCharWeapon(PLAYER_PED, weapon)
    local myskin  = getCharModel(PLAYER_PED)
    getfps = memory.getfloat(0xB7CB50, 4, false) 
    ---
    imgui.Text((u8'Nick[ID]: %s[%s]\t'):format(nick, id))
    imgui.SameLine()
    imgui.Text((u8'Ping: %s\t'):format(ping))
    imgui.SameLine()
    imgui.Text((u8'LVL: %s\t'):format(score))
    imgui.SameLine()
    imgui.Text((u8'Health: %s\t'):format(hp))
    imgui.SameLine()
    imgui.Text((u8'Armour: %s\t'):format(armour))
    imgui.SameLine()
    imgui.Text((u8'Weapon: %s\t'):format(weapon))
    imgui.SameLine()
    imgui.Text((u8'Skin: %s\t'):format(myskin))
    -----
    imgui.Text((u8'IP: %s:%s\t'):format(ipinfo, port))
    imgui.SameLine()
    imgui.Text((u8'Date: %s/%s/%s\t'):format(os.date('%d'), os.date('%m'),os.date('%Y')))
    imgui.SameLine()
    imgui.Text((u8'Time: %s\t'):format(os.date('%X')))
    imgui.SameLine()
    imgui.Text((u8'Server: %s\t'):format(servername))
    imgui.SameLine()
    imgui.Text((u8'FPS: %s\t'):format(math.ceil(getfps)))
    end

    function offFam()
        for i = 1, 2048 do
            if sampIs3dTextDefined(i) then
                local searchFam = sampGet3dTextInfoById(i)
                fams = {"Family", "Dynasty", "Corporation", "Squad", "Crew", "Empire", "Brotherhood"}
                for a = 1, #fams do if searchFam:match(string.format('.+%s', fams[tonumber(a)])) then sampDestroy3dText(i) end end
            end
        end
    end 


    -- function checkUpdate()
    --     downloadUrlToFile(update_url, update_path, function(id, status)
    --         if status == dlstatus.STATUS_ENDDOWNLOADDATA then
    --             local updateIni = inicfg.load(nil, update_path)
    --             if tonumber(updateIni.NewVers.script) > tonumber(scrV.NewVers.script) then
    --                 sampAddChatMessage(string.format('Обнаружена новая версия скрипта: {DC143C}[%s]!{FFFFFF} Текущая версия скрипта: {DC143C}[%s].', updateIni.NewVers.script, scrV.NewVers.script ), -1)
    --             else
    --                 sampAddChatMessage("Обновлений нет.", -1)
    --             end
    --         end
    --     end)
    -- end

function imgui.OnDrawFrame()
    if show_main_window.v then 
        imgui.SetNextWindowSize(imgui.ImVec2(600, 475), imgui.Cond.FirstUseEver)
        imgui.SetNextWindowPos(imgui.ImVec2(x/2, y/2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.Begin('DreamHelper', show_main_window, imgui.WindowFlags.NoResize )
        imgui.BeginChild("#hotbutton", imgui.ImVec2(585, 35), true)
        if imgui.Button(u8'Очистить чат', imgui.ImVec2(91, 20)) then clearChat() end
        imgui.SameLine()
        if imgui.Button(u8'Open Github', imgui.ImVec2(91,20)) then
            local link = "https://github.com/yummyme/DreamHelper"
            os.execute('explorer '..link)    
        end 
        imgui.SameLine()
        imgui.SameLine()
        imgui.EndChild()
        imgui.BeginChild("#body", imgui.ImVec2(170, 400), true)
        if imgui.Selectable(u8'Информация о скрипте\n', imgui.ImBool(false), imgui.ImVec2(40, 20)) then body_script = 1 end
        imgui.Text(u8"")
        if imgui.Selectable(u8'Погода и время суток\n', imgui.ImBool(false), imgui.ImVec2(40, 20)) then body_script = 2 end
        imgui.Text(u8"")
        if imgui.Selectable(u8'FPS Tool\n', imgui.ImBool(false), imgui.ImVec2(40, 20)) then body_script = 4 end
        imgui.Text(u8"")
        if imgui.Selectable(u8'Настройки\n', imgui.ImBool(false), imgui.ImVec2(40, 20)) then body_script = 5 end
        imgui.Text(u8"")
        if imgui.Selectable(u8'Разное\n', imgui.ImBool(false), imgui.ImVec2(40, 20)) then body_script = 6 end
        imgui.Text(u8"")
        if imgui.Selectable(u8'Прайс-лист[ARZ]\n', imgui.ImBool(false), imgui.ImVec2(40, 20)) then body_script = 7 end
        imgui.Text(u8"")
        -- if imgui.Selectable(u8'Настройка чата[ARZ]\n', imgui.ImBool(false), imgui.ImVec2(40, 20)) then body_script = 8 end
        -- imgui.Text(u8"")
        -- if imgui.Selectable(u8'test\n', imgui.ImBool(false), imgui.ImVec2(40, 20)) then body_script = 9 end
        -- imgui.Text(u8"")
        if imgui.Selectable(u8'Mini-Binder\n', imgui.ImBool(false), imgui.ImVec2(40, 20)) then body_script = 10 end
        imgui.Text(u8"")
        -- if imgui.Selectable(u8'Anti-AFK\n', imgui.ImBool(false), imgui.ImVec2(40, 20)) then body_script = 11 end
        -- imgui.Text(u8"")
        imgui.EndChild()
        imgui.SameLine()

        if body_script == 1 then 
            imgui.BeginChild("#title", imgui.ImVec2(410,400), true)
            imgui.Text('\t\t\t\t\t\t\t\t DREAMHepler  '.. thisScript().version ..'\n')
            imgui.Separator()
            imgui.Text(u8"\n")
            imgui.Text(u8"\n")
            imgui.BeginChild("#info", imgui.ImVec2(394,324), true)
            imgui.Text(u8"Скрипт еще в бета-тесте, потому возможны баги и недоработки!\n\n ")
            imgui.Text(u8'Changelog 0.1b:')
            imgui.Text(u8"- script created(13.09.2020)")
            imgui.Text(u8"- добавлена очистка чата")
            imgui.Text(u8"- добавлено удаление лого сервера(Только Arizona-RP) ")
            imgui.Text(u8"- добавлена смена времени суток и погоды ")
            imgui.Text(u8"- добавлена настройка активации ")
            imgui.Text(u8'Changelog 0.2b:')
            imgui.Text(u8"- добавлен прайс-лист(Только Arizona-RP)")
            imgui.Text(u8"- добавлен анти-афк")
            imgui.Text(u8"- добавлен фейкскин")
            imgui.Text(u8"- добавлено удаление семей/описаний(Только Arizona-RP)")
            imgui.Text(u8'Changelog 0.3b:')
            imgui.Text(u8"- добавлен FPS Tool")
            imgui.Text(u8"- добавлен Mini-Binder")
            imgui.Text(u8"- ....")
         
            imgui.EndChild()
            imgui.EndChild()
        end 
        if body_script == 2 then 
            imgui.BeginChild("#wtc", imgui.ImVec2(410,400), true)
            imgui.BeginChild("#wtcone", imgui.ImVec2(395,60), true)
            imgui.Text(u8"Время:    \t")
            imgui.SameLine()
            if imgui.SliderInt(u8' ', time_slider, 0, 23) then 
                for i=0 , 23 do 
                    if(time_slider.v == i ) then 
                        hour  = i
                        minute = 00
                        loadTConfig.wtconfig.hour = hour 
                        inicfg.save(loadTConfig, TConfig)
                    end
                end
            end
            imgui.Text(u8'Погода:   \t')
            imgui.SameLine()
            if imgui.SliderInt(u8'   ', weather_slider, 0, 45) then
                for  i = 0, 45 do 
                    if(weather_slider.v == i) then 
                        weather = i
                        loadTConfig.wtconfig.weather = weather 
                        inicfg.save(loadTConfig, TConfig)
                    end
                end
            end
       
            imgui.EndChild()
            imgui.EndChild()
        end
        if body_script == 3 then 
            imgui.BeginChild("#test", imgui.ImVec2(410,400), true)
         
            imgui.EndChild()

        end 
   
        if body_script == 4 then 
                imgui.BeginChild("#fpstool", imgui.ImVec2(410,400), true)
                imgui.BeginChild("#fskin", imgui.ImVec2(395,35), true)
                if imgui.Checkbox(u8'Показывать FPS(скрипт будет перезагружен)', showFPSstatus) then
                    if showFPSstatus.v then
                        reloadScripts()
                        local enableFPS = 1
                        loadOthercfg.other.showFPS = enableFPS
                        inicfg.save(loadOthercfg, otherCfg)
                        notf.addNotification("Счетчик FPS активирован.",5)
                    else
                        reloadScripts()
                        local enableFPS = 0
                        loadOthercfg.other.showFPS = enableFPS
                        inicfg.save(loadOthercfg, otherCfg)
                        notf.addNotification("Счетчик FPS деактивирован.",5)
                    end 
                end
                imgui.EndChild()
                imgui.Text(u8'Изменить местоположение индикатора FPS:')
              
                imgui.BeginChild("#monitor", imgui.ImVec2(205,140), true)
                imgui.BeginChild("#changeFPSposition1", imgui.ImVec2(60,60), true)
                imgui.Text('\n')
                local test = imgui.ImBool(false)
                imgui.Text('  ') 
                imgui.SameLine()
                if imgui.Button(u8'1', imgui.ImVec2(20, 20)) then
                    globalposx = 0.0
                    globalposy = 1.0
                    loadOthercfg.other.positionx = globalposx
                    loadOthercfg.other.positiony = globalposy
                    inicfg.save(loadOthercfg, otherCfg)       
                end
                imgui.EndChild()
                
                imgui.SameLine()
                imgui.BeginChild("#changeFPSposition2", imgui.ImVec2(60,60), true)
                imgui.Text('    ')
                local test = imgui.ImBool(false)
                imgui.Text('  ') 
                imgui.SameLine()
                if imgui.Button(u8'2', imgui.ImVec2(20, 20)) then
                    globalposx = 300.0
                    globalposy = 1.0
                    loadOthercfg.other.positionx = globalposx
                    loadOthercfg.other.positiony = globalposy
                    inicfg.save(loadOthercfg, otherCfg)         end
                imgui.EndChild()

                imgui.SameLine()
                imgui.BeginChild("#changeFPSposition3", imgui.ImVec2(60,60), true)
                imgui.Text('\t\t')
                local test = imgui.ImBool(false)
                imgui.Text('  ') 
                imgui.SameLine()
                if imgui.Button(u8'3', imgui.ImVec2(20, 20)) then 
                    globalposx = 630.0
                    globalposy = 0.1
                    loadOthercfg.other.positionx = globalposx
                    loadOthercfg.other.positiony = globalposy
                    inicfg.save(loadOthercfg, otherCfg)     
                  end
                imgui.EndChild()
                ---
                imgui.BeginChild("#changeFPSposition4", imgui.ImVec2(60,60), true)
                local test = imgui.ImBool(false)
                imgui.Text('  ') 
                imgui.SameLine()
                if imgui.Button(u8'4', imgui.ImVec2(20, 20)) then 
                    globalposx = 0.1
                    globalposy = 440.0
                    loadOthercfg.other.positionx = globalposx
                    loadOthercfg.other.positiony = globalposy
                    inicfg.save(loadOthercfg, otherCfg) 
                 end
                imgui.Text('\n')
                imgui.SameLine()
                imgui.EndChild()

                imgui.SameLine()
                imgui.BeginChild("#changeFPSposition5", imgui.ImVec2(60,60), true)
                local test = imgui.ImBool(false)
                imgui.Text('  ') 
                imgui.SameLine()
                if imgui.Button(u8'5', imgui.ImVec2(20, 20)) then 
                    globalposx = 300.0
                    globalposy = 440.0
                    loadOthercfg.other.positionx = globalposx
                    loadOthercfg.other.positiony = globalposy
                    inicfg.save(loadOthercfg, otherCfg)  
                end
                imgui.Text('\n    ')
                imgui.SameLine()
                imgui.EndChild()

                imgui.SameLine()
                imgui.BeginChild("#changeFPSposition6", imgui.ImVec2(60,60), true)
                local test = imgui.ImBool(false)
                imgui.Text('  ') 
                imgui.SameLine()
                if imgui.Button(u8'6', imgui.ImVec2(20, 20)) then
                    globalposx = 630.0
                    globalposy = 440.0
                    loadOthercfg.other.positionx = globalposx
                    loadOthercfg.other.positiony = globalposy
                    inicfg.save(loadOthercfg, otherCfg)    end
                imgui.Text('\n\t\t')
                imgui.SameLine()
                imgui.EndChild()
                     
            imgui.EndChild()
            imgui.EndChild()

        end 
        if body_script == 5 then 
            imgui.BeginChild("#settings", imgui.ImVec2(410,400), true)
            imgui.BeginChild("#act", imgui.ImVec2(395,40), true)

            imgui.Text(u8'Изменить активацию: ')
            imgui.SameLine()
            if imgui.HotKey("##one", ActiveMenu, tLastKeys) then
            rkeys.changeHotKey(key1, ActiveMenu.v)
            loadKeys.settings.key1 = encodeJson(ActiveMenu.v)
            inicfg.save(loadKeys, allKeys)
            end
            imgui.EndChild()
            imgui.BeginChild("#theme", imgui.ImVec2(395,40), true)
            imgui.Text(u8"Изменить тему :")
            imgui.SameLine()
            if imgui.Combo('##1', bool_result,u8' \0Красная\0Фиолетовая\0Темная\0Cиняя\0Оранжевая\0Серая\0Зелёная')  then
                for i = 1, 7  do
                    if bool_result.v == i then
                            theme = i
                            loadTheme.theme.themenumber = theme
                            inicfg.save(loadTheme, ThemeConfig)
                    end
                end
            end
            imgui.EndChild()
            imgui.EndChild()
        end 
        if body_script == 6 then 
            imgui.BeginChild("#other", imgui.ImVec2(410,400), true)
                imgui.BeginChild("#logo", imgui.ImVec2(395,40), true)
                if imgui.Checkbox(u8'Удалять логотип при входе', deleteStatus) then 
                        if deleteStatus.v then
                            local enableALC = 1
                            loadServer.serverlist.startAC = enableALC
                            inicfg.save(loadServer, serverList)
                            notf.addNotification("Автоудаление логотипа при входе активировано.",5)
                        else
                            local enableALC = 0
                            loadServer.serverlist.startAC = enableALC
                            inicfg.save(loadServer, serverList)
                            notf.addNotification("Автоудаление логотипа при входе деактивировано.",5)
                        end 
                end
                imgui.SameLine()
                ShowHelpMarker(u8("Удаляет логотип Arizona-RP [Server]"))
                imgui.EndChild()
                    imgui.BeginChild("#fskin", imgui.ImVec2(395,90), true)
                        imgui.Text(u8'Введите ID скина: ')
                        imgui.SameLine()
                        imgui.InputInt('  ', skinID)
                        if imgui.Button(u8'Применить', imgui.ImVec2(71, 20)) then
                            if skinID.v > 0 and  skinID.v <= 311 then
                                 myskin = 1
                                myskin = getCharModel(PLAYER_PED)
                                loadSkinID.skin.id = skinID.v
                               inicfg.save(loadSkinID, skinsID)
                                tempSkin = tonumber(loadSkinID.skin.id)
                                notf.addNotification(string.format('Cкин ID %s изменен на: ID %s ', myskin, tempSkin), 5)
                                set_player_skin(id, tempSkin)
                            else 
                                notf.addNotification(string.format('Запрещенный ID. ', myskin, tempSkin), 5)
                            
                            end 
                        end

                        imgui.Text(u8'ID скинов можно узнать тут:')
                        imgui.SameLine()
                        imgui.Link("https://wiki.sa-mp.com/wiki/Skins:All")
                     imgui.EndChild()
                        imgui.BeginChild("#offFamsandD", imgui.ImVec2(395,40), true)
                        if imgui.Checkbox(u8'Удалять фамы ', famdeleteStatus) then 
                                if famdeleteStatus.v then
                                    local enableAFD = 1
                                    loadOthercfg.other.startFD = enableAFD
                                    inicfg.save(loadOthercfg, otherCfg)
                                    notf.addNotification("Удаление фам активировано.",5)
                                else
                                    local enableAFD = 0
                                    loadOthercfg.other.startFD = enableAFD
                                    inicfg.save(loadOthercfg, otherCfg)
                                    notf.addNotification("Удаление фам деактивировано.",5)
                                end 
                        end
                       imgui.SameLine()
                        if imgui.Checkbox(u8'Удалять описание', DescriptionDeleteStatus) then 
                            if DescriptionDeleteStatus.v then
                                local enableDD = 1
                                loadOthercfg.other.startDD = enableDD
                                inicfg.save(loadOthercfg, otherCfg)
                                notf.addNotification("Удаление описания активировано.",5)
                            else
                                local enableDD = 0
                                loadOthercfg.other.startDD = enableDD
                                inicfg.save(loadOthercfg, otherCfg)
                                notf.addNotification("Удаление описания деактивировано.",5)
                            end 
                         end
                        imgui.EndChild()
                        imgui.BeginChild("#afk1", imgui.ImVec2(395,40), true)
                       if imgui.Checkbox(u8'АнтиАФК', afkStatus) then 
                        if afkStatus.v then
                            local enableAF = 1
                            loadOthercfg.other.startAF = enableAF
                            inicfg.save(loadOthercfg, otherCfg)
                            notf.addNotification("Anti-AFK ON.",5)
                        else
                            local enableAF = 0
                            loadOthercfg.other.startAF = enableAF
                            inicfg.save(loadOthercfg, otherCfg)
                            notf.addNotification("Anti-AFK Off.",5)
                        end 
                    end
                    imgui.EndChild()
            imgui.EndChild()
       
          
        end 
        if body_script == 7 then            
            imgui.BeginChild("#pricelist", imgui.ImVec2(410,400), true)
            
            imgui.Text(u8'Выберите категорию:')
            imgui.SameLine()
            if imgui.Combo('##moto', price_bool,u8' \0Мото\0Аксессуары\0Разное\0Авто\0Вело\0Скины\0nope')  then
                for i = 1, 7  do
                    if price_bool.v == 0 then
                        childNumber = 0
                    elseif  price_bool.v == 1 then
                        childNumber = 1
                    elseif  price_bool.v == 2 then
                        childNumber = 2
                    elseif  price_bool.v == 3 then
                        childNumber = 3
                    elseif  price_bool.v == 4 then
                        childNumber = 4
                    elseif  price_bool.v == 5 then
                        childNumber = 5
                    elseif  price_bool.v == 6 then
                        childNumber = 6 
                    elseif  price_bool.v == 7 then
                        childNumber = 7
                    end

                end
            end
            if childNumber == 0 then startPage() end 
            if childNumber == 1 then motoPrice() end 
            if childNumber == 2 then accessoriesPrice() end 
            if childNumber == 3 then otherPrice() end 
            if childNumber == 4 then carsPrice() end 
            if childNumber == 5 then startPage() end 
            if childNumber == 6 then skinsPrice() end 
            if childNumber == 7 then startPage() end 
            imgui.EndChild()
        
        end 
        if body_script == 8 then 
            imgui.BeginChild("#chatsetting", imgui.ImVec2(410,400), true)
            imgui.EndChild()
        end
        if body_script == 9 then 
            imgui.BeginChild("#autoheal", imgui.ImVec2(410,400), true)
            imgui.EndChild()
        end
        if body_script == 10 then 
            
            imgui.BeginChild("#binder", imgui.ImVec2(410,400), true)
            imgui.BeginChild("#binder1", imgui.ImVec2(388,40), true)
            local BindInput1 = imgui.ImBuffer(256)
            local tempBindText1 = (bindlist.binder.bind1)
            BindInput1.v = tostring((tempBindText1))
            imgui.InputText('1', BindInput1)
            local text1 = BindInput1.v
            bindlist.binder.bind1 = (text1)
            inicfg.save(bindlist, bindpath)
            imgui.SameLine()
            if imgui.HotKey("##binder1",  enterBind1, bindLastKeys) then 
                rkeys.changeHotKey(bindkey1, enterBind1.v) 
               bindlist.binder.bindkey1 = encodeJson(enterBind1.v)
                inicfg.save(bindlist, bindpath) 
            end
            imgui.EndChild()
            imgui.BeginChild("#binder2", imgui.ImVec2(388,40), true)
            local BindInput2 = imgui.ImBuffer(256)
            local tempBindText2 =bindlist.binder.bind2
            BindInput2.v = tostring((tempBindText2))
            imgui.InputText('2', BindInput2)
            local text2 = BindInput2.v
            bindlist.binder.bind2 = (text2)
            inicfg.save(bindlist, bindpath)
            imgui.SameLine()
            imgui.SameLine()
            if imgui.HotKey("##binder2",  enterBind2, bindLastKeys) then 
                rkeys.changeHotKey(bindkey2, enterBind2.v) 
               bindlist.binder.bindkey2 = encodeJson(enterBind2.v)
                inicfg.save(bindlist, bindpath) 
            end
            imgui.EndChild()
            imgui.BeginChild("#binder3", imgui.ImVec2(388,40), true)
            local BindInput3 = imgui.ImBuffer(256)
            local tempBindText3 =bindlist.binder.bind3
            BindInput3.v = tostring(bindlist.binder.bind3)
            imgui.InputText('3', BindInput3)
            local text3 = BindInput3.v
            bindlist.binder.bind3 = (text3)
            inicfg.save(bindlist, bindpath)
            imgui.SameLine()
            if imgui.HotKey("##binder3",  enterBind3, bindLastKeys) then 
                rkeys.changeHotKey(bindkey3, enterBind3.v) 
               bindlist.binder.bindkey3 = encodeJson(enterBind3.v)
                inicfg.save(bindlist, bindpath) 
            end
            imgui.EndChild()
            imgui.BeginChild("#binder4", imgui.ImVec2(388,40), true)
            local BindInput4 = imgui.ImBuffer(256)
            local tempBindText4 =bindlist.binder.bind4
            BindInput4.v = tostring((tempBindText4))
            imgui.InputText('4', BindInput4)
            local text4 = BindInput4.v
            bindlist.binder.bind4 = (text4)
            inicfg.save(bindlist, bindpath)
            imgui.SameLine()
            if imgui.HotKey("##binder4",  enterBind4, bindLastKeys) then 
                rkeys.changeHotKey(bindkey4, enterBind4.v) 
               bindlist.binder.bindkey4 = encodeJson(enterBind4.v)
                inicfg.save(bindlist, bindpath) 
            end
            imgui.EndChild()
            imgui.BeginChild("#binder5", imgui.ImVec2(388,40), true)
            local BindInput5 = imgui.ImBuffer(256)
            local tempBindText5 =bindlist.binder.bind5
            BindInput5.v = tostring((tempBindText5))
            imgui.InputText('5', BindInput5)
            local text5 = BindInput5.v
            bindlist.binder.bind5 = (text5)
            inicfg.save(bindlist, bindpath)
            imgui.SameLine()
            if imgui.HotKey("##binder5",  enterBind5, bindLastKeys) then 
                rkeys.changeHotKey(bindkey5, enterBind5.v) 
               bindlist.binder.bindkey5 = encodeJson(enterBind5.v)
                inicfg.save(bindlist, bindpath) 
            end
            imgui.EndChild()
            imgui.BeginChild("#binder6", imgui.ImVec2(388,40), true)
            local BindInput6 = imgui.ImBuffer(256)
            local tempBindText6 =bindlist.binder.bind6
            BindInput6.v = tostring((tempBindText6))
            imgui.InputText('6', BindInput6)
            local text6 = BindInput6.v
            bindlist.binder.bind6 = (text6)
            inicfg.save(bindlist, bindpath)
            imgui.SameLine()
            if imgui.HotKey("##binder6", enterBind6, bindLastKeys) then
                rkeys.changeHotKey(bindkey6, enterBind6.v) 
               bindlist.binder.bindkey6 = encodeJson(enterBind6.v)
                inicfg.save(bindlist, bindpath) 
            end
            imgui.EndChild()
            imgui.BeginChild("#binder7", imgui.ImVec2(388,40), true)
            local BindInput7 = imgui.ImBuffer(256)
            local tempBindText7 =bindlist.binder.bind7
            BindInput7.v = tempBindText7
            imgui.InputText('7', BindInput7)
            local text7 = (BindInput7.v)
            bindlist.binder.bind7 = text7
            inicfg.save(bindlist, bindpath)
            imgui.SameLine()
            if imgui.HotKey("##binder7", enterBind7, bindLastKeys) then
                rkeys.changeHotKey(bindkey7, enterBind7.v) 
               bindlist.binder.bindkey7 = encodeJson(enterBind7.v)
                inicfg.save(bindlist, bindpath)
            end
            imgui.EndChild()
            imgui.BeginChild("#binder8", imgui.ImVec2(388,40), true)
            local BindInput8 = imgui.ImBuffer(256)
            local tempBindText8 =bindlist.binder.bind8
            BindInput8.v = tostring((tempBindText8))
            imgui.InputText('8', BindInput8)
            local text8 = BindInput8.v
           bindlist.binder.bind8 = (text8)
            inicfg.save(bindlist, bindpath)
            imgui.SameLine()
            if imgui.HotKey("##binder8", enterBind8, bindLastKeys) then
                rkeys.changeHotKey(bindkey8, enterBind8.v) 
               bindlist.binder.bindkey8 = encodeJson(enterBind8.v)
                inicfg.save(bindlist, bindpath) end
            imgui.EndChild()
            imgui.EndChild()
        end
        if body_script == 11 then 
            imgui.BeginChild("#antiAFK", imgui.ImVec2(410,400), true)
            imgui.EndChild()
        end
        -- imgui.BeginChild("#pinfo", imgui.ImVec2(585, 45), true)
        -- getPlayerInfo()
        -- imgui.EndChild()
    end
    imgui.End()
end

function main()
    if not isSampLoaded() then return end
    while not isSampAvailable() do wait(1) end
    theme = tonumber(loadTheme.theme.themenumber)
    hour = tonumber(loadTConfig.wtconfig.hour)
    weather = tonumber(loadTConfig.wtconfig.weather)
    fpsind = tonumber(loadOthercfg.other.showFPS)
    FPS()
    enableLC()
    startmsg()
    key1 = rkeys.registerHotKey(ActiveMenu.v, true, function ()
        show_main_window.v = not show_main_window.v
    end)

    
    bindkey1 = rkeys.registerHotKey(enterBind1.v, true, function ()
        local testpath = inicfg.load(nil, bindpath)
        local bindText1 = testpath.binder.bind1
        sampSendChat(u8:decode(bindText1))   
    end)
    
    bindkey2 = rkeys.registerHotKey(enterBind2.v, true, function ()
        local testpath = inicfg.load(nil, bindpath)
        local bindText2 = testpath.binder.bind2
        sampSendChat(u8:decode(bindText2))   
    end)
    
    bindkey3 = rkeys.registerHotKey(enterBind3.v, true, function ()
        local testpath = inicfg.load(nil, bindpath)
        local bindText3 = testpath.binder.bind3
        sampSendChat(u8:decode(bindText3))   
    end)
    
    bindkey4 = rkeys.registerHotKey(enterBind4.v, true, function ()
        local testpath = inicfg.load(nil, bindpath)
        local bindText4 = testpath.binder.bind4
        sampSendChat(u8:decode(bindText4))   
    end)
    
    bindkey5 = rkeys.registerHotKey(enterBind5.v, true, function ()
        local testpath = inicfg.load(nil, bindpath)
        local bindText5 = testpath.binder.bind5
        sampSendChat(u8:decode(bindText5))   
    end)
    
    bindkey6 = rkeys.registerHotKey(enterBind6.v, true, function ()
        local testpath = inicfg.load(nil, bindpath)
        local bindText6 = testpath.binder.bind6
        sampSendChat(u8:decode(bindText6))   
    end)
    bindkey7 = rkeys.registerHotKey(enterBind7.v, true, function ()
        local testpath = inicfg.load(nil, bindpath)
        local bindText7 = testpath.binder.bind7
        sampSendChat(u8:decode(bindText7))   
    end)
    bindkey8 = rkeys.registerHotKey(enterBind8.v, true, function ()
        local testpath = inicfg.load(nil, bindpath)
        local bindText8 = testpath.binder.bind8
        sampSendChat(u8:decode(bindText8))  
    end) 
    while true do

        wait(0)

        -- moneySeparate()
        enableAFKs()
       writeMemory(12677196, 1, 30, false)
        if theme == 1 then 
           RedTheme()
        elseif theme == 2 then 
            PurpleTheme()
        elseif theme == 3 then 
            BlackTheme()    
        elseif theme == 4 then 
            BlueTheme()    
        elseif theme == 5 then 
            BlackOrange()    
        elseif theme == 6 then 
            GrayTheme()   
        elseif theme == 7 then 
            GreenTheme()  
        end  
        forceWeatherNow(weather)
        setTimeOfDay(hour, 00)
        imgui.Process = show_main_window.v
       
    end
    
    
    
end

function startmsg()
    if theme == 1 then 
        sampAddChatMessage(string.format("{DC143C}[%s]{FFFFFF} Script created special for {DC143C}Dream Dynasty" ,  thisScript().version), -1)
        sampAddChatMessage(string.format("{DC143C}[%s]{FFFFFF} %s sucessfull {DC143C}started!{FFFFFF} Author:{DC143C} yummy ",  thisScript().version, thisScript().name), -1)
        sampAddChatMessage("{DC143C}Активация: {FFFFFF}" .. table.concat(rkeys.getKeysName(ActiveMenu.v), "+"), -1) 
    elseif theme == 2 then 
        sampAddChatMessage(string.format("{8A2BE2}[%s]{FFFFFF} Script created special for {8A2BE2}Dream Dynasty" ,  thisScript().version), -1)
        sampAddChatMessage(string.format("{8A2BE2}[%s]{FFFFFF} %s sucessfull {8A2BE2}started!{FFFFFF} Author:{8A2BE2} yummy ",  thisScript().version, thisScript().name), -1)
        sampAddChatMessage("{8A2BE2}Активация: {FFFFFF}" .. table.concat(rkeys.getKeysName(ActiveMenu.v), "+"), -1) 
    elseif theme == 3 then  
        sampAddChatMessage(string.format("{696969}[%s]{FFFFFF} Script created special for {696969}Dream Dynasty" ,  thisScript().version), -1)
        sampAddChatMessage(string.format("{696969}[%s]{FFFFFF} %s sucessfull {696969}started!{FFFFFF} Author:{696969} yummy ",  thisScript().version, thisScript().name), -1)
        sampAddChatMessage("{696969}Активация: {FFFFFF}" .. table.concat(rkeys.getKeysName(ActiveMenu.v), "+"), -1)    
    elseif theme == 4 then  
        sampAddChatMessage(string.format("{1E90FF}[%s]{FFFFFF} Script created special for {1E90FF}Dream Dynasty" ,  thisScript().version), -1)
        sampAddChatMessage(string.format("{1E90FF}[%s]{FFFFFF} %s sucessfull {1E90FF}started!{FFFFFF} Author:{1E90FF} yummy",  thisScript().version, thisScript().name), -1)
        sampAddChatMessage("{1E90FF}Активация: {FFFFFF}" .. table.concat(rkeys.getKeysName(ActiveMenu.v), "+"), -1)    
    elseif theme == 5 then  
        sampAddChatMessage(string.format("{FFA500}[%s]{FFFFFF} Script created special for {FFA500}Dream Dynasty" ,  thisScript().version), -1)
        sampAddChatMessage(string.format("{FFA500}[%s]{FFFFFF} %s sucessfull {FFA500}started!{FFFFFF} Author:{FFA500} yummy",  thisScript().version, thisScript().name), -1)
        sampAddChatMessage("{FFA500}Активация: {FFFFFF}" .. table.concat(rkeys.getKeysName(ActiveMenu.v), "+"), -1)  
    elseif theme == 6 then  
        sampAddChatMessage(string.format("{808080}[%s]{FFFFFF} Script created special for {808080}Dream Dynasty" ,  thisScript().version), -1)
        sampAddChatMessage(string.format("{808080}[%s]{FFFFFF} %s sucessfull {808080}started!{FFFFFF} Author:{808080} yummy",  thisScript().version, thisScript().name), -1)
        sampAddChatMessage("{808080}Активация: {FFFFFF}" .. table.concat(rkeys.getKeysName(ActiveMenu.v), "+"), -1)     
    elseif theme == 7 then  
        sampAddChatMessage(string.format("{00FF7F}[%s]{FFFFFF} Script created special for {00FF7F}Dream Dynasty" ,  thisScript().version), -1)
        sampAddChatMessage(string.format("{00FF7F}[%s]{FFFFFF} %s sucessfull {00FF7F}started!{FFFFFF} Author:{00FF7F} yummy",  thisScript().version, thisScript().name), -1)
        sampAddChatMessage("{00FF7F}Активация: {FFFFFF}" .. table.concat(rkeys.getKeysName(ActiveMenu.v), "+"), -1)     
    end
end
function RedTheme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
    style.WindowPadding = imgui.ImVec2(8, 8)
    style.WindowRounding = 6
    style.ChildWindowRounding = 5
    style.FramePadding = imgui.ImVec2(5, 3)
    style.FrameRounding = 3.0
    style.ItemSpacing = imgui.ImVec2(5, 4)
    style.ItemInnerSpacing = imgui.ImVec2(4, 4)
    style.IndentSpacing = 21
    style.ScrollbarSize = 10.0
    style.ScrollbarRounding = 13
    style.GrabMinSize = 8
    style.GrabRounding = 1
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
    colors[clr.Text]                   = ImVec4(0.95, 0.96, 0.98, 1.00);
    colors[clr.TextDisabled]           = ImVec4(0.29, 0.29, 0.29, 1.00);
    colors[clr.WindowBg]               = ImVec4(0.14, 0.14, 0.14, 1.00);
    colors[clr.ChildWindowBg]          = ImVec4(0.12, 0.12, 0.12, 1.00);
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94);
    colors[clr.Border]                 = ImVec4(0.14, 0.14, 0.14, 1.00);
    colors[clr.BorderShadow]           = ImVec4(1.00, 1.00, 1.00, 0.10);
    colors[clr.FrameBg]                = ImVec4(0.22, 0.22, 0.22, 1.00);
    colors[clr.FrameBgHovered]         = ImVec4(0.18, 0.18, 0.18, 1.00);
    colors[clr.FrameBgActive]          = ImVec4(0.09, 0.12, 0.14, 1.00);
    colors[clr.TitleBg]                = ImVec4(0.14, 0.14, 0.14, 0.81);
    colors[clr.TitleBgActive]          = ImVec4(0.14, 0.14, 0.14, 1.00);
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51);
    colors[clr.MenuBarBg]              = ImVec4(0.20, 0.20, 0.20, 1.00);
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.39);
    colors[clr.ScrollbarGrab]          = ImVec4(0.36, 0.36, 0.36, 1.00);
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.18, 0.22, 0.25, 1.00);
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.24, 0.24, 0.24, 1.00);
    colors[clr.ComboBg]                = ImVec4(0.24, 0.24, 0.24, 1.00);
    colors[clr.CheckMark]              = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.SliderGrab]             = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.SliderGrabActive]       = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.Button]                 = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.ButtonHovered]          = ImVec4(1.00, 0.39, 0.39, 1.00);
    colors[clr.ButtonActive]           = ImVec4(1.00, 0.21, 0.21, 1.00);
    colors[clr.Header]                 = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.HeaderHovered]          = ImVec4(1.00, 0.39, 0.39, 1.00);
    colors[clr.HeaderActive]           = ImVec4(1.00, 0.21, 0.21, 1.00);
    colors[clr.ResizeGrip]             = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.ResizeGripHovered]      = ImVec4(1.00, 0.39, 0.39, 1.00);
    colors[clr.ResizeGripActive]       = ImVec4(1.00, 0.19, 0.19, 1.00);
    colors[clr.CloseButton]            = ImVec4(0.40, 0.39, 0.38, 0.16);
    colors[clr.CloseButtonHovered]     = ImVec4(0.40, 0.39, 0.38, 0.39);
    colors[clr.CloseButtonActive]      = ImVec4(0.40, 0.39, 0.38, 1.00);
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00);
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00);
    colors[clr.PlotHistogram]          = ImVec4(1.00, 0.21, 0.21, 1.00);
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.18, 0.18, 1.00);
    colors[clr.TextSelectedBg]         = ImVec4(1.00, 0.32, 0.32, 1.00);
    colors[clr.ModalWindowDarkening]   = ImVec4(0.26, 0.26, 0.26, 0.60);
end

function GrayTheme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
    style.WindowPadding = imgui.ImVec2(8, 8)
    style.WindowRounding = 6
    style.ChildWindowRounding = 5
    style.FramePadding = imgui.ImVec2(5, 3)
    style.FrameRounding = 3.0
    style.ItemSpacing = imgui.ImVec2(5, 4)
    style.ItemInnerSpacing = imgui.ImVec2(4, 4)
    style.IndentSpacing = 21
    style.ScrollbarSize = 10.0
    style.ScrollbarRounding = 13
    style.GrabMinSize = 8
    style.GrabRounding = 1
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
    
  colors[clr.Text] = ImVec4(1.00, 1.00, 1.00, 0.95)
  colors[clr.TextDisabled] = ImVec4(0.50, 0.50, 0.50, 1.00)
  colors[clr.WindowBg] = ImVec4(0.13, 0.12, 0.12, 1.00)
  colors[clr.ChildWindowBg] = ImVec4(0.13, 0.12, 0.12, 1.00)
  colors[clr.PopupBg] = ImVec4(0.05, 0.05, 0.05, 0.94)
  colors[clr.Border] = ImVec4(0.53, 0.53, 0.53, 0.46)
  colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
  colors[clr.FrameBg] = ImVec4(0.00, 0.00, 0.00, 0.85)
  colors[clr.FrameBgHovered] = ImVec4(0.22, 0.22, 0.22, 0.40)
  colors[clr.FrameBgActive] = ImVec4(0.16, 0.16, 0.16, 0.53)
  colors[clr.TitleBg] = ImVec4(0.00, 0.00, 0.00, 1.00)
  colors[clr.TitleBgActive] = ImVec4(0.00, 0.00, 0.00, 1.00)
  colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.51)
  colors[clr.MenuBarBg] = ImVec4(0.12, 0.12, 0.12, 1.00)
  colors[clr.ScrollbarBg] = ImVec4(0.02, 0.02, 0.02, 0.53)
  colors[clr.ScrollbarGrab] = ImVec4(0.31, 0.31, 0.31, 1.00)
  colors[clr.ScrollbarGrabHovered] = ImVec4(0.41, 0.41, 0.41, 1.00)
  colors[clr.ScrollbarGrabActive] = ImVec4(0.48, 0.48, 0.48, 1.00)
  colors[clr.ComboBg] = ImVec4(0.24, 0.24, 0.24, 0.99)
  colors[clr.CheckMark] = ImVec4(0.79, 0.79, 0.79, 1.00)
  colors[clr.SliderGrab] = ImVec4(0.48, 0.47, 0.47, 0.91)
  colors[clr.SliderGrabActive] = ImVec4(0.56, 0.55, 0.55, 0.62)
  colors[clr.Button] = ImVec4(0.50, 0.50, 0.50, 0.63)
  colors[clr.ButtonHovered] = ImVec4(0.67, 0.67, 0.68, 0.63)
  colors[clr.ButtonActive] = ImVec4(0.26, 0.26, 0.26, 0.63)
  colors[clr.Header] = ImVec4(0.54, 0.54, 0.54, 0.58)
  colors[clr.HeaderHovered] = ImVec4(0.64, 0.65, 0.65, 0.80)
  colors[clr.HeaderActive] = ImVec4(0.25, 0.25, 0.25, 0.80)
  colors[clr.Separator] = ImVec4(0.58, 0.58, 0.58, 0.50)
  colors[clr.SeparatorHovered] = ImVec4(0.81, 0.81, 0.81, 0.64)
  colors[clr.SeparatorActive] = ImVec4(0.81, 0.81, 0.81, 0.64)
  colors[clr.ResizeGrip] = ImVec4(0.87, 0.87, 0.87, 0.53)
  colors[clr.ResizeGripHovered] = ImVec4(0.87, 0.87, 0.87, 0.74)
  colors[clr.ResizeGripActive] = ImVec4(0.87, 0.87, 0.87, 0.74)
  colors[clr.CloseButton] = ImVec4(0.45, 0.45, 0.45, 0.50)
  colors[clr.CloseButtonHovered] = ImVec4(0.70, 0.70, 0.90, 0.60)
  colors[clr.CloseButtonActive] = ImVec4(0.70, 0.70, 0.70, 1.00)
  colors[clr.PlotLines] = ImVec4(0.68, 0.68, 0.68, 1.00)
  colors[clr.PlotLinesHovered] = ImVec4(0.68, 0.68, 0.68, 1.00)
  colors[clr.PlotHistogram] = ImVec4(0.90, 0.77, 0.33, 1.00)
  colors[clr.PlotHistogramHovered] = ImVec4(0.87, 0.55, 0.08, 1.00)
  colors[clr.TextSelectedBg] = ImVec4(0.47, 0.60, 0.76, 0.47)
  colors[clr.ModalWindowDarkening] = ImVec4(0.88, 0.88, 0.88, 0.35)
end

function BlueTheme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
    style.WindowPadding = imgui.ImVec2(8, 8)
    style.WindowRounding = 6
    style.ChildWindowRounding = 5
    style.FramePadding = imgui.ImVec2(5, 3)
    style.FrameRounding = 3.0
    style.ItemSpacing = imgui.ImVec2(5, 4)
    style.ItemInnerSpacing = imgui.ImVec2(4, 4)
    style.IndentSpacing = 21
    style.ScrollbarSize = 10.0
    style.ScrollbarRounding = 13
    style.GrabMinSize = 8
    style.GrabRounding = 1
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
    colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function BlackOrange()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
    style.WindowPadding = imgui.ImVec2(8, 8)
    style.WindowRounding = 6
    style.ChildWindowRounding = 5
    style.FramePadding = imgui.ImVec2(5, 3)
    style.FrameRounding = 3.0
    style.ItemSpacing = imgui.ImVec2(5, 4)
    style.ItemInnerSpacing = imgui.ImVec2(4, 4)
    style.IndentSpacing = 21
    style.ScrollbarSize = 10.0
    style.ScrollbarRounding = 13
    style.GrabMinSize = 8
    style.GrabRounding = 1
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
    colors[clr.Text] = ImVec4(0.80, 0.80, 0.83, 1.00)
    colors[clr.TextDisabled] = ImVec4(0.24, 0.23, 0.29, 1.00)
    colors[clr.WindowBg] = ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.ChildWindowBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
    colors[clr.PopupBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
    colors[clr.Border] = ImVec4(0.80, 0.80, 0.83, 0.88)
    colors[clr.BorderShadow] = ImVec4(0.92, 0.91, 0.88, 0.00)
    colors[clr.FrameBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.FrameBgHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
    colors[clr.FrameBgActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.TitleBg] = ImVec4(0.76, 0.31, 0.00, 1.00)
    colors[clr.TitleBgCollapsed] = ImVec4(1.00, 0.98, 0.95, 0.75)
    colors[clr.TitleBgActive] = ImVec4(0.80, 0.33, 0.00, 1.00)
    colors[clr.MenuBarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.ScrollbarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.ScrollbarGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
    colors[clr.ScrollbarGrabHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.ScrollbarGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.ComboBg] = ImVec4(0.19, 0.18, 0.21, 1.00)
    colors[clr.CheckMark] = ImVec4(1.00, 0.42, 0.00, 0.53)
    colors[clr.SliderGrab] = ImVec4(1.00, 0.42, 0.00, 0.53)
    colors[clr.SliderGrabActive] = ImVec4(1.00, 0.42, 0.00, 1.00)
    colors[clr.Button] = ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.ButtonHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
    colors[clr.ButtonActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.Header] = ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.HeaderHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.HeaderActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.ResizeGrip] = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.ResizeGripHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
    colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
    colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
    colors[clr.PlotLines] = ImVec4(0.40, 0.39, 0.38, 0.63)
    colors[clr.PlotLinesHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
    colors[clr.PlotHistogram] = ImVec4(0.40, 0.39, 0.38, 0.63)
    colors[clr.PlotHistogramHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
    colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
    colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end

function BlackTheme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
    style.WindowPadding = imgui.ImVec2(8, 8)
    style.WindowRounding = 6
    style.ChildWindowRounding = 5
    style.FramePadding = imgui.ImVec2(5, 3)
    style.FrameRounding = 3.0
    style.ItemSpacing = imgui.ImVec2(5, 4)
    style.ItemInnerSpacing = imgui.ImVec2(4, 4)
    style.IndentSpacing = 21
    style.ScrollbarSize = 10.0
    style.ScrollbarRounding = 13
    style.GrabMinSize = 8
    style.GrabRounding = 1
    style.WindowTitleAlign =                imgui.ImVec2(0.5, 0.5)
    style.ButtonTextAlign =                 imgui.ImVec2(0.5, 0.5)
    colors[clr.Text] =                      ImVec4(0.80, 0.80, 0.83, 1.00)
    colors[clr.TextDisabled] =              ImVec4(0.24, 0.23, 0.29, 1.00)
    colors[clr.WindowBg] =                  ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.ChildWindowBg] =             ImVec4(0.07, 0.07, 0.09, 1.00)
    colors[clr.PopupBg] =                   ImVec4(0.07, 0.07, 0.09, 1.00)
    colors[clr.Border] =                    ImVec4(0.80, 0.80, 0.83, 0.88)
    colors[clr.BorderShadow] =              ImVec4(0.92, 0.91, 0.88, 0.00)
    colors[clr.FrameBg] =                   ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.FrameBgHovered] =            ImVec4(0.24, 0.23, 0.29, 1.00)
    colors[clr.FrameBgActive] =             ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.TitleBg] =                   ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.TitleBgCollapsed] =          ImVec4(1.00, 0.98, 0.95, 0.75)
    colors[clr.TitleBgActive] =             ImVec4(0.07, 0.07, 0.09, 1.00)
    colors[clr.MenuBarBg] =                 ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.ScrollbarBg] =               ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.ScrollbarGrab] =             ImVec4(0.80, 0.80, 0.83, 0.31)
    colors[clr.ScrollbarGrabHovered] =      ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.ScrollbarGrabActive] =       ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.ComboBg] =                   ImVec4(0.19, 0.18, 0.21, 1.00)
    colors[clr.CheckMark] =                 ImVec4(0.80, 0.80, 0.83, 0.31)
    colors[clr.SliderGrab] =                ImVec4(0.80, 0.80, 0.83, 0.31)
    colors[clr.SliderGrabActive] =          ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.Button] =                    ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.ButtonHovered] =             ImVec4(0.24, 0.23, 0.29, 1.00)
    colors[clr.ButtonActive] =              ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.Header] =                    ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.HeaderHovered] =             ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.HeaderActive] =              ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.ResizeGrip] =                ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.ResizeGripHovered] =         ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.ResizeGripActive] =          ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.CloseButton] =               ImVec4(0.40, 0.39, 0.38, 0.16)
    colors[clr.CloseButtonHovered] =        ImVec4(0.40, 0.39, 0.38, 0.39)
    colors[clr.CloseButtonActive] =         ImVec4(0.40, 0.39, 0.38, 1.00)
    colors[clr.PlotLines] =                 ImVec4(0.40, 0.39, 0.38, 0.63)
    colors[clr.PlotLinesHovered] =          ImVec4(0.25, 1.00, 0.00, 1.00)
    colors[clr.PlotHistogram] =             ImVec4(0.40, 0.39, 0.38, 0.63)
    colors[clr.PlotHistogramHovered] =      ImVec4(0.25, 1.00, 0.00, 1.00)
    colors[clr.TextSelectedBg] =            ImVec4(0.25, 1.00, 0.00, 0.43)
    colors[clr.ModalWindowDarkening] =      ImVec4(1.00, 0.98, 0.95, 0.73)
end

function PurpleTheme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
    style.WindowPadding = imgui.ImVec2(8, 8)
    style.WindowRounding = 6
    style.ChildWindowRounding = 5
    style.FramePadding = imgui.ImVec2(5, 3)
    style.FrameRounding = 3.0
    style.ItemSpacing = imgui.ImVec2(5, 4)
    style.ItemInnerSpacing = imgui.ImVec2(4, 4)
    style.IndentSpacing = 21
    style.ScrollbarSize = 10.0
    style.ScrollbarRounding = 13
    style.GrabMinSize = 8
    style.GrabRounding = 1
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
    colors[clr.WindowBg]              = ImVec4(0.14, 0.12, 0.16, 1.00);
    colors[clr.ChildWindowBg]         = ImVec4(0.30, 0.20, 0.39, 0.00);
    colors[clr.PopupBg]               = ImVec4(0.05, 0.05, 0.10, 0.90);
    colors[clr.Border]                = ImVec4(0.89, 0.85, 0.92, 0.30);
    colors[clr.BorderShadow]          = ImVec4(0.00, 0.00, 0.00, 0.00);
    colors[clr.FrameBg]               = ImVec4(0.30, 0.20, 0.39, 1.00);
    colors[clr.FrameBgHovered]        = ImVec4(0.41, 0.19, 0.63, 0.68);
    colors[clr.FrameBgActive]         = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.TitleBg]               = ImVec4(0.41, 0.19, 0.63, 0.45);
    colors[clr.TitleBgCollapsed]      = ImVec4(0.41, 0.19, 0.63, 0.35);
    colors[clr.TitleBgActive]         = ImVec4(0.41, 0.19, 0.63, 0.78);
    colors[clr.MenuBarBg]             = ImVec4(0.30, 0.20, 0.39, 0.57);
    colors[clr.ScrollbarBg]           = ImVec4(0.30, 0.20, 0.39, 1.00);
    colors[clr.ScrollbarGrab]         = ImVec4(0.41, 0.19, 0.63, 0.31);
    colors[clr.ScrollbarGrabHovered]  = ImVec4(0.41, 0.19, 0.63, 0.78);
    colors[clr.ScrollbarGrabActive]   = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.ComboBg]               = ImVec4(0.30, 0.20, 0.39, 1.00);
    colors[clr.CheckMark]             = ImVec4(0.56, 0.61, 1.00, 1.00);
    colors[clr.SliderGrab]            = ImVec4(0.41, 0.19, 0.63, 0.24);
    colors[clr.SliderGrabActive]      = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.Button]                = ImVec4(0.41, 0.19, 0.63, 0.44);
    colors[clr.ButtonHovered]         = ImVec4(0.41, 0.19, 0.63, 0.86);
    colors[clr.ButtonActive]          = ImVec4(0.64, 0.33, 0.94, 1.00);
    colors[clr.Header]                = ImVec4(0.41, 0.19, 0.63, 0.76);
    colors[clr.HeaderHovered]         = ImVec4(0.41, 0.19, 0.63, 0.86);
    colors[clr.HeaderActive]          = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.ResizeGrip]            = ImVec4(0.41, 0.19, 0.63, 0.20);
    colors[clr.ResizeGripHovered]     = ImVec4(0.41, 0.19, 0.63, 0.78);
    colors[clr.ResizeGripActive]      = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.CloseButton]           = ImVec4(1.00, 1.00, 1.00, 0.75);
    colors[clr.CloseButtonHovered]    = ImVec4(0.88, 0.74, 1.00, 0.59);
    colors[clr.CloseButtonActive]     = ImVec4(0.88, 0.85, 0.92, 1.00);
    colors[clr.PlotLines]             = ImVec4(0.89, 0.85, 0.92, 0.63);
    colors[clr.PlotLinesHovered]      = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.PlotHistogram]         = ImVec4(0.89, 0.85, 0.92, 0.63);
    colors[clr.PlotHistogramHovered]  = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.TextSelectedBg]        = ImVec4(0.41, 0.19, 0.63, 0.43);
    colors[clr.ModalWindowDarkening]  = ImVec4(0.20, 0.20, 0.20, 0.35);
end

function GreenTheme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
    style.WindowPadding = imgui.ImVec2(8, 8)
    style.WindowRounding = 6
    style.ChildWindowRounding = 5
    style.FramePadding = imgui.ImVec2(5, 3)
    style.FrameRounding = 3.0
    style.ItemSpacing = imgui.ImVec2(5, 4)
    style.ItemInnerSpacing = imgui.ImVec2(4, 4)
    style.IndentSpacing = 21
    style.ScrollbarSize = 10.0
    style.ScrollbarRounding = 13
    style.GrabMinSize = 8
    style.GrabRounding = 1
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
    style.WindowTitleAlign = ImVec2(0.5, 0.5)
    colors[clr.Text]                   = ImVec4(0.90, 0.90, 0.90, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.60, 0.60, 0.60, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.08, 0.08, 0.08, 1.00)
    colors[clr.ChildWindowBg]          = ImVec4(0.10, 0.10, 0.10, 1.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 1.00)
    colors[clr.Border]                 = ImVec4(0.70, 0.70, 0.70, 0.40)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]                = ImVec4(0.15, 0.15, 0.15, 1.00)
    colors[clr.FrameBgHovered]         = ImVec4(0.19, 0.19, 0.19, 0.71)
    colors[clr.FrameBgActive]          = ImVec4(0.34, 0.34, 0.34, 0.79)
    colors[clr.TitleBg]                = ImVec4(0.00, 0.69, 0.33, 0.80)
    colors[clr.TitleBgActive]          = ImVec4(0.00, 0.74, 0.36, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.69, 0.33, 0.50)
    colors[clr.MenuBarBg]              = ImVec4(0.00, 0.80, 0.38, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.16, 0.16, 0.16, 1.00)
    colors[clr.ScrollbarGrab]          = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.00, 0.82, 0.39, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.00, 1.00, 0.48, 1.00)
    colors[clr.ComboBg]                = ImVec4(0.20, 0.20, 0.20, 0.99)
    colors[clr.CheckMark]              = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.00, 0.77, 0.37, 1.00)
    colors[clr.Button]                 = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.ButtonHovered]          = ImVec4(0.00, 0.82, 0.39, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.00, 0.87, 0.42, 1.00)
    colors[clr.Header]                 = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.HeaderHovered]          = ImVec4(0.00, 0.76, 0.37, 0.57)
    colors[clr.HeaderActive]           = ImVec4(0.00, 0.88, 0.42, 0.89)
    colors[clr.Separator]              = ImVec4(1.00, 1.00, 1.00, 0.40)
    colors[clr.SeparatorHovered]       = ImVec4(1.00, 1.00, 1.00, 0.60)
    colors[clr.SeparatorActive]        = ImVec4(1.00, 1.00, 1.00, 0.80)
    colors[clr.ResizeGrip]             = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.ResizeGripHovered]      = ImVec4(0.00, 0.76, 0.37, 1.00)
    colors[clr.ResizeGripActive]       = ImVec4(0.00, 0.86, 0.41, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.00, 0.82, 0.39, 1.00)
    colors[clr.CloseButtonHovered]     = ImVec4(0.00, 0.88, 0.42, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.00, 1.00, 0.48, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(0.00, 0.74, 0.36, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.00, 0.69, 0.33, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(0.00, 0.80, 0.38, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.00, 0.69, 0.33, 0.72)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.17, 0.17, 0.17, 0.48)
end