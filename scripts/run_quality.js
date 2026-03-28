#!/usr/bin/env node
const { execSync } = require("child_process");

function run(cmd, optional = false) {
  try {
    console.log(`[QA] ${cmd}`);
    execSync(cmd, { stdio: "inherit" });
  } catch (e) {
    if (!optional) {
      console.error("Erreur:", cmd);
      process.exit(1);
    }
  }
}

console.log("[AtlasXSEC] Lancement QA");

// Detekt (si présent)
if (execSync("./gradlew tasks").toString().includes("detekt")) {
  run("./gradlew detekt", true);
}

// Ktlint (si présent)
if (execSync("./gradlew tasks").toString().includes("ktlintCheck")) {
  run("./gradlew ktlintCheck", true);
}

run("./gradlew lint");
run("./gradlew test");

console.log("[AtlasXSEC] QA terminée.");
