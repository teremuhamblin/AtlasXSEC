#!/usr/bin/env node
const fs = require("fs");
const path = require("path");
const crypto = require("crypto");

const root = path.resolve(__dirname, "..");
const manifestPath = path.join(root, "manifest", "manifest.json");
const dist = path.join(root, "dist");

if (!fs.existsSync(manifestPath)) {
  console.error("Manifeste introuvable");
  process.exit(1);
}

const manifest = JSON.parse(fs.readFileSync(manifestPath, "utf8"));

console.log("Modules déclarés:");
for (const m of manifest.modules) {
  console.log(`- ${m.id} (v${m.version})`);
}

console.log("\nVérification des ZIP:");
for (const m of manifest.modules) {
  const zipPath = path.join(dist, `${m.id}.zip`);
  console.log(fs.existsSync(zipPath) ? `OK: ${m.id}` : `Manquant: ${m.id}`);
}

console.log("\nVérification des hash:");
for (const m of manifest.modules) {
  const zipPath = path.join(dist, `${m.id}.zip`);
  if (!fs.existsSync(zipPath)) continue;
  const data = fs.readFileSync(zipPath);
  const sha = crypto.createHash("sha256").update(data).digest("hex");
  const expected = (m.hash || "").replace("sha256:", "");
  console.log(sha === expected ? `OK: ${m.id}` : `ERREUR: ${m.id} (${sha} != ${expected})`);
}

console.log("\nDiagnostic terminé.");
