BUILD_DIR = build

$(BUILD_DIR)/index.js: node_modules/.install index.html index.tsx normalize.css styles.css tsconfig.json
	bun build $@ --outdir $(BUILD_DIR)

node_modules/.install: package.json bun.lock
	bun install
	@echo > $@
