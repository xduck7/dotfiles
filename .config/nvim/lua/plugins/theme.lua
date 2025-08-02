return {
  {
    "ilof2/posterpole.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("posterpole").setup({
        transparent = true,      -- Прозрачный фон
        dim_inactive = false,    -- Не затемнять неактивные окна
        brightness = 0,          -- Базовая яркость (0 = оригинал)
        selected_tab_highlight = true, -- Подсвечивать активную вкладку
        
        -- Настройки адаптивной темы
        adaptive_brightness = {
          enabled = true,        -- Автонастройка яркости по времени суток
          max_brightness = 1,    -- Максимальная яркость днём
          min_brightness = -3,   -- Минимальная яркость ночью
          daylight_duration = 12, -- Продолжительность "дня"
          noon_time = 12         -- Полдень в 12:00
        },
        
        -- Кастомные цвета (пример)
        colors = {
          posterpole = {
            mainRed = { hex = "#550000", cterm = 95 }
          }
        },
        
        -- Кастомные группы подсветки
        groups = {
          posterpole = {
            Comment = { fg = { hex = "#FFA500", cterm = 214 } }, -- Оранжевые комментарии
            String = { italic = true }                            -- Курсив для строк
          }
        },
        
        -- Интеграция с Lualine
        lualine = {
          transparent = true      -- Прозрачный фон для Lualine
        }
      })
      
      -- Применить тему
      vim.cmd("colorscheme posterpole")
      
      -- Включить автоадаптацию яркости
      require("posterpole").setup_adaptive()
    end
  }
}
