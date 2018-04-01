TARGET := ${HOME}

ZSHDIR := $(TARGET)/.zsh
SRC := src
SCRIPTS := scripts
BUILD := target
FUN_SRC := fun
FUN_ZWC := $(BUILD)/.zsh/fun
FUN_SRC_FILES := $(wildcard $(FUN_SRC)/*.sh)
FUN_ZWC_FILES := $(patsubst $(FUN_SRC)/%.sh,$(FUN_ZWC)/%.zwc,$(FUN_SRC_FILES))
OH_MY_ZSH := $(BUILD)/.oh-my-zsh

CP := cp -v
CPR := cp -rv
RMR := rm -rv
RMRF := rm -vfr
MKDIR := mkdir -pv
GIT := git

build: prepare cpsrc $(OH_MY_ZSH) fun

$(OH_MY_ZSH):
	$(GIT) clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $(OH_MY_ZSH)

fun: $(FUN_ZWC_FILES)
	$(RMR) $(FUN_ZWC)/*.sh

cpsrc:
	$(CPR) $(SRC)/. $(BUILD)

$(FUN_ZWC)/%.sh: $(FUN_SRC)/%.sh
	$(CP) $^ $@

$(FUN_ZWC)/%.zwc: $(FUN_ZWC)/%.sh
	zsh -c "zcompile $^"

prepare:
	$(MKDIR) $(FUN_ZWC)

clean:
	$(RMRF) $(BUILD)

install: build
	$(CPR) $(BUILD)/. $(TARGET)
	$(RMRF) $(BUILD)

.PHONY: fun clean prepare build install
