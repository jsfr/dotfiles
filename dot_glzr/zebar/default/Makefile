BUILD_DIR = build

$(BUILD_DIR)/index.js: node_modules/.install index.html index.tsx normalize.css styles.css tsconfig.json
	bun build index.tsx --outdir $(BUILD_DIR)

node_modules/.install: package.json bun.lock
	bun install
	@echo > $@

.PHONY: clean
clean:
	rm -rf node_modules
	rm -rf $(BUILD_DIR)
