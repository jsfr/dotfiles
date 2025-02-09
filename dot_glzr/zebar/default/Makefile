build/index.js: node_modules index.html index.tsx *.css tsconfig.json
	bun build index.tsx --outdir build

node_modules: package.json bun.lock
	bun install
