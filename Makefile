UNAME := $(shell uname)
DOTFILE_PATH := $(shell pwd)

$(HOME)/.%: %
	ln -sf $(DOTFILE_PATH)/$^ $@

git: $(HOME)/.gitconfig $(HOME)/.githelpers $(HOME)/.gitignore
zsh: $(HOME)/.zshrc $(HOME)/.zsh.d

$(HOME)/bin/tmux-sessionizer:
	mkdir -p $(HOME)/bin
	ln -sf $(DOTFILE_PATH)/bin/tmux-sessionizer $(HOME)/bin/tmux-sessionizer
	chmod +x $(HOME)/bin/tmux-sessionizer

tmux: $(HOME)/.tmux.conf $(HOME)/bin/tmux-sessionizer

wezterm: $(HOME)/.wezterm.lua

kitty:
	mkdir -p $(HOME)/.config/kitty
	ln -sf $(DOTFILE_PATH)/kitty.conf $(HOME)/.config/kitty/kitty.conf
	ln -sf $(DOTFILE_PATH)/kitty_colors_lucius_light_high_contrast.conf $(HOME)/.config/kitty/theme.conf
ifeq ($(UNAME), Linux)
	ln -sf $(DOTFILE_PATH)/kitty.linux.conf $(HOME)/.config/kitty/kitty.linux.conf
endif

$(HOME)/.config/ghostty/config:
	mkdir -p $(HOME)/.config/ghostty
	ln -sf $(DOTFILE_PATH)/ghostty_config $(HOME)/.config/ghostty/config

ghostty: $(HOME)/.config/ghostty/config

$(HOME)/.config/atuin/config.toml:
	mkdir -p $(HOME)/.config/atuin
	ln -sf $(DOTFILE_PATH)/atuin_config.toml $(HOME)/.config/atuin/config.toml

atuin: $(HOME)/.config/atuin/config.toml

$(HOME)/.config/zed/settings.json:
	mkdir -p $(HOME)/.config/zed
	ln -sf $(DOTFILE_PATH)/zed_settings.json $(HOME)/.config/zed/settings.json

$(HOME)/.config/zed/keymap.json:
	mkdir -p $(HOME)/.config/zed
	ln -sf $(DOTFILE_PATH)/zed_keymap.json $(HOME)/.config/zed/keymap.json

zed: $(HOME)/.config/zed/keymap.json $(HOME)/.config/zed/settings.json

imwheel: $(HOME)/.imwheelrc

all: git zsh tmux kitty imwheel wezterm ghostty atuin zed
