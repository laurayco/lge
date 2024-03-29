# Makefile
BUILD_FOLDER = ./bin
OBJ_FOLDER = ./obj
SRC_FOLDER = ./src
INC_FOLDER = ./include

PROJECT_NAME = LGE
BINARY_NAME = $(BUILD_FOLDER)/$(PROJECT_NAME)

OPENGL_LIBS = glfw3 glew32 gdi32 opengl32

SRC_ITEMS := $(wildcard $(SRC_FOLDER)/**)
OBJ_ITEMS := $(patsubst $(SRC_FOLDER)/%.cpp,$(OBJ_FOLDER)/%.o, $(SRC_ITEMS))

COMPILE_FLAGS = -c $(addprefix -I,$(INC_FOLDER))
LINK_FLAGS = $(addprefix -l,$(OPENGL_LIBS))

DEBUG ?= false

ifeq ($(DEBUG),true)
	COMPILE_FLAGS += -g -DDEBUG
	LINK_FLAGS += -g
else
	COMPILE_FLAGS += -O
	LINK_FLAGS += -O -mwindows
endif

all : $(BINARY_NAME)

clean:
	@echo Cleaning
	@rm -f obj/**
	@rm -f bin/**

rebuild: clean all

$(BINARY_NAME) : $(OBJ_ITEMS)
	@mkdir -p $(BUILD_FOLDER)
	$(CXX) $^ -o $@ $(LINK_FLAGS)

$(OBJ_FOLDER)/%.o : $(SRC_FOLDER)/%.cpp
	@mkdir -p $(OBJ_FOLDER)
	$(CXX) $^ -o $@ $(COMPILE_FLAGS)