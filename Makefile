CC := gcc
CFLAGS := -std=c11 -Wall -Wextra -Werror -Iinclude -O2
BUILD_DIR := build
TARGET := $(BUILD_DIR)/app

SRC := $(wildcard src/*.c)
OBJ := $(patsubst src/%.c,$(BUILD_DIR)/%.o,$(SRC))

all: $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: src/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@

run: all
	./$(TARGET)

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all run clean
