#!/usr/bin/bash
npm init -y
sed -i 's/"echo \\"Error: no test specified\\" && exit 1"/"vitest"/' package.json
npm i nodemon ts-node vitest typescript -D
cat << EOF >> vite.config.ts
import { defineConfig } from 'vitest/config'

export default defineConfig({
    test: {}
})
EOF
cat << EOF >> tsconfig.json
{
  "compilerOptions": {
    "module": "commonjs",
    "target": "ES2015",
    "outDir": "dist",
    "sourceMap": false,
    "esModuleInterop": true,
    "inlineSourceMap": false
  },
  "include": ["src/**/*.ts"]
}
EOF
mkdir src
cat << EOF >> src/test.spec.ts
import { describe, it, expect } from 'vitest'

describe('tests', () => {
    it('should work', () => {
        expect(2).toBe(2)
    })
})
EOF
echo 'console.log("hello world")' > src/index.ts
npm run test