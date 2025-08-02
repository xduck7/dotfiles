.PHONY: new_plug

PLUGIN_DIR ?= .config/sketchybar/plugins

new_plug:
	@if [ -z "$(NAME)" ]; then \
		echo "Error: NAME variable not set. Usage: make new_plug NAME=plugin_name [PLUGIN_DIR=custom/path]"; \
		exit 1; \
	fi
	
	# Создаем директории
	mkdir -p ~/.config/sketchybar/items/ ~/$(PLUGIN_DIR)/
	
	# Item-файл (конфигурация)
	echo '#!/bin/bash\n\nsketchybar --add item $(NAME) \\\n\t\t   --set $(NAME) \\\n\t\t\t script="~/$(PLUGIN_DIR)/$(NAME).sh" \\\n\t\t\t update_freq=60' > ~/.config/sketchybar/items/$(NAME).sh
	
	# Plugin-файл (логика)
	echo '#!/bin/bash\n\n# Ваш код плагина\nsketchybar --set $(NAME) label="Пример: $(NAME)"' > ~/$(PLUGIN_DIR)/$(NAME).sh
	
	# Права на выполнение
	chmod +x ~/.config/sketchybar/items/$(NAME).sh
	chmod +x ~/$(PLUGIN_DIR)/$(NAME).sh
	
	@echo "Плагин создан:"
	@echo "  • Конфиг: ~/.config/sketchybar/items/$(NAME).sh"
	@echo "  • Логика: ~/$(PLUGIN_DIR)/$(NAME).sh"