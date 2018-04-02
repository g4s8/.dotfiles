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

CP := cp -f
CPR := cp -fr
RM := rm -f
RMR := rm -r
RMRF := rm -fr
MKDIR := mkdir -p
GIT := git
ZSH := zsh
RENAME := rename

build: prepare cpsrc $(OH_MY_ZSH) fun

$(OH_MY_ZSH):
	$(GIT) clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $(OH_MY_ZSH)

fun: prepare $(FUN_ZWC_FILES)

cpsrc:
	$(CPR) $(SRC)/. $(BUILD)

$(FUN_ZWC)/%.sh: $(FUN_SRC)/%.sh
	$(CP) $^ $@

$(FUN_ZWC)/%.zwc: $(FUN_ZWC)/%.sh
	sh -c "$(SCRIPTS)/zcc.sh $@"

prepare:
	$(MKDIR) $(FUN_ZWC)

clean:
	$(RMRF) $(BUILD)

install: build
	$(CPR) $(BUILD)/. $(TARGET)
	$(RMRF) $(BUILD)

install_fun: fun
	$(CPR) $(BUILD)/.zsh/fun $(TARGET)/.zsh/fun

.PHONY: fun clean prepare build install
