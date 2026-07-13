#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <site-slug> <target-directory>" >&2
  exit 64
fi

slug="$1"
target="$2"

if [[ ! "$slug" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
  echo "site-slug must be lowercase kebab-case" >&2
  exit 64
fi

if [[ -e "$target" ]]; then
  echo "target already exists: $target" >&2
  exit 73
fi

command -v node >/dev/null || { echo "node is required" >&2; exit 69; }
command -v npm >/dev/null || { echo "npm is required" >&2; exit 69; }

# Some managed environments reserve ~/.npm as a file. Always select a
# dedicated writable cache unless the caller supplied one explicitly.
export npm_config_cache="${npm_config_cache:-${NPM_CONFIG_CACHE:-$HOME/.cache/npm}}"
mkdir -p "$npm_config_cache"

npx create-next-app@latest "$target" \
  --typescript \
  --eslint \
  --app \
  --src-dir \
  --import-alias '@/*' \
  --use-npm \
  --yes

cd "$target"
npm install zod
npm install --save-dev \
  vitest \
  jsdom \
  @vitejs/plugin-react \
  @testing-library/react \
  @testing-library/jest-dom \
  @testing-library/user-event \
  @playwright/test

node <<'NODE'
const fs = require('node:fs');
const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
pkg.scripts = {
  ...pkg.scripts,
  typecheck: 'tsc --noEmit',
  test: 'vitest',
  'test:e2e': 'playwright test'
};
fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n');
NODE

mkdir -p docs src/app/__tests__ src/components src/lib e2e public/brand public/previews

cat > docs/START-HERE.md <<'EOF'
# Company website

1. Copy the company-website-factory `templates/website-spec.md` to `docs/website-spec.md`.
2. Complete discovery and select a visual direction before page implementation.
3. Build a canonical `src/lib/site.ts` data model.
4. Follow TDD and the factory release checklist.
EOF

cat > vitest.config.ts <<'EOF'
import { defineConfig } from "vitest/config";

export default defineConfig({
  test: {
    environment: "jsdom",
    exclude: ["e2e/**", "node_modules/**"],
  },
});
EOF

cat > src/app/__tests__/harness.test.ts <<'EOF'
import { describe, expect, it } from "vitest";

describe("website test harness", () => {
  it("runs independently from Playwright tests", () => {
    expect(document).toBeDefined();
  });
});
EOF

printf '\nScaffold ready: %s\n' "$target"
printf 'Next: write docs/website-spec.md, create failing tests, then implement.\n'
