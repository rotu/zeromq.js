/**
 * @type {import('mocha').MochaOptions}
 */
const config = {
  require: ["ts-node/register", "rocha"],
  spec: [
    "test/unit/*-test.ts",
    "test/unit/compat/*-test.js",
  ],
  "expose-gc": true,
  "v8-expose-gc": true,
  "experimental-worker": true,
  recursive: true,
  exit: true,
  parallel: true,
}

module.exports = config
