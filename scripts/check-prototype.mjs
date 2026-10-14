import assert from "node:assert/strict";
import fs from "node:fs";
import vm from "node:vm";

const htmlFiles = ["index.html", "jogar.html"];
for (const file of htmlFiles) {
  const html = fs.readFileSync(file, "utf8");
  const scripts = [...html.matchAll(/<script(?:\s[^>]*)?>([\s\S]*?)<\/script>/gi)]
    .map((match) => match[1])
    .filter((script) => script.trim().length > 0);

  assert.ok(scripts.length > 0, `${file} should contain an inline script`);
  for (let i = 0; i < scripts.length; i += 1) {
    assert.doesNotThrow(
      () => new vm.Script(scripts[i], { filename: `${file}:script-${i + 1}` }),
      `${file} inline script ${i + 1} must parse`,
    );
  }
  console.log(`PASS JavaScript syntax: ${file}`);
}

const menu = fs.readFileSync("index.html", "utf8");
const requiredMenuFeatures = [
  'id="playButton"',
  'id="languageButton"',
  'id="aboutButton"',
  'id="aboutView"',
  "function renderAbout()",
  'id="historyButton"',
  'id="historyView"',
  "function renderHistory()",
  'id="exitButton"',
  'id="exitView"',
  'url("assets/kingdom-menu.webp")',
  'id="slotsView"',
  'id="creatorView"',
  'id="languageView"',
  "const SLOT_COUNT=3",
  "function renderSlots()",
  "function deleteSlot(slot)",
  "function confirmCreator()",
  "function drawPreview()",
  'data-gender="masculino"',
  'data-gender="feminino"',
  "data-outfit=",
  "data-cloak=",
  "data-outfit-color=",
  "data-outfit-color=",
  "data-gender=",
  "hairStyleItems=",
  "headwearItems=",
  "accessoryItems=",
  "weaponItems=",
  "ranger:",
  "royal:",
  "function drawPreview()",
  "reinos_ruina_slot_",
  "reinos_ruina_legacy_checked",
];
for (const feature of requiredMenuFeatures) {
  assert.ok(menu.includes(feature), `missing menu feature: ${feature}`);
}
console.log("PASS menu, three save slots, language picker, and character creator");

const background = fs.statSync("assets/kingdom-menu.webp");
assert.ok(background.size > 10000, "uploaded kingdom background should be present as a full-resolution image");
console.log("PASS exact kingdom menu background and About screen");

const game = fs.readFileSync("jogar.html", "utf8");
const contract = fs.readFileSync("contracts/ReinosChronicle.sol", "utf8");
const requiredGameFeatures = [
  "const SLOT_PREFIX='reinos_ruina_slot_'",
  "const activeSlotNumber=",
  "function readActiveSlot()",
  "function writeActiveSlot(record)",
  "function drawPlayer(x,y,rawAppearance)",
  "character:normalizeAppearance(g.character)",
  "hairstyle:['short','medium','long','ponytail','braids','mohawk']",
  "headwear:['none','hood','crown','wizardHat','helmet','circlet']",
  "accessory:['none','glasses','eyepatch','earrings','necklace']",
  "weapon:['sword','staff','bow','none']",
  "outfitColor:['default','crimson','emerald','sapphire','violet','charcoal']",
  "function drawPlayer(x,y,rawAppearance)",
  "return writeActiveSlot(current)",
  "function openCouncil()",
  "function talkMara()",
  "function normalizeSave(d)",
  "function persistProgress()",
  "ledgerFound:g.ledgerFound",
  "if(!g.ledgerFound)",
  "if(g.questStep<4)",
  "g.questStep=5",
  "function chooseEconomy(choice)",
  "chooseEconomy(1)",
  "chooseEconomy(2)",
  "chooseEconomy(3)",
  "id=\"economyTreasury\"",
  "id=\"economyDebt\"",
  "id=\"economyTrust\"",
  "id=\"economyPrice\"",
  "function recordArcChapter()",
  "recordChapter(uint8 chapterId,uint8 policyId)",
  "const CHRONICLE_CONTRACT_ADDRESS=''",
];
for (const feature of requiredGameFeatures) {
  assert.ok(game.includes(feature), `missing game feature: ${feature}`);
}
assert.ok(game.includes("if(!CHRONICLE_CONTRACT_ADDRESS)"), "wallet flow must remain gated until a contract address is configured");
assert.ok(game.includes("Prova ENCONTRADA") || game.includes("PROVA ENCONTRADA"), "opening quest should require a found ledger proof");
assert.ok(game.includes("A Moeda Partida"), "opening chapter title should appear in the quest UI");

const requiredContractFeatures = [
  "contract ReinosChronicle",
  "function recordChapter(uint8 chapterId, uint8 policyId)",
  "if (chapterId != 1) revert InvalidChapter();",
  "if (policyId < 1 || policyId > 3) revert InvalidPolicy();",
  "ChapterAlreadyRecorded",
  "keccak256(",
  "event ChapterRecorded",
  "treasury = 85;",
  "treasury = 170;",
  "treasury = 120;",
  "foodDays = 7;",
  "foodDays = 6;",
  "foodDays = 2;",
];
for (const feature of requiredContractFeatures) {
  assert.ok(contract.includes(feature), `missing contract feature: ${feature}`);
}
assert.ok(!contract.includes("transfer("), "contract must not transfer funds");
assert.ok(!contract.includes("payable"), "contract must not accept native funds");

console.log("PASS economy policy, frontend/contract interface, Arc safety gate, and contract-source assertions");
