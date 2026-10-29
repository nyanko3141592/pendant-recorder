import fs from "node:fs/promises";
import path from "node:path";
import { Workbook, SpreadsheetFile } from "/Users/takahashinaoki/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules/@oai/artifact-tool/dist/artifact_tool.mjs";

const root = "/Users/takahashinaoki/Dev/pendant-recorder";
const sourceCsv = path.join(root, "hardware/xe-minimal/fabrication-review-1d4b19d9e46e/order-candidate-2026-10-28/procurement-plan.csv");
const outDir = path.join(root, "outputs/prototype-v1-order-readiness");
const outPath = path.join(outDir, "prototype-v1-procurement-estimate-2026-10-28.xlsx");

function parseCsv(text) {
  const rows = [];
  let row = [], field = "", quoted = false;
  for (let i = 0; i < text.length; i++) {
    const ch = text[i];
    if (quoted) {
      if (ch === '"' && text[i + 1] === '"') { field += '"'; i++; }
      else if (ch === '"') quoted = false;
      else field += ch;
    } else if (ch === '"') quoted = true;
    else if (ch === ',') { row.push(field); field = ""; }
    else if (ch === '\n') { row.push(field.replace(/\r$/, "")); rows.push(row); row = []; field = ""; }
    else field += ch;
  }
  if (field.length || row.length) { row.push(field); rows.push(row); }
  const headers = rows.shift();
  return rows.filter(r => r.some(v => v !== "")).map(r => Object.fromEntries(headers.map((h, i) => [h, r[i] ?? ""])));
}

const plan = parseCsv(await fs.readFile(sourceCsv, "utf8"));
const wb = Workbook.create();
const summary = wb.worksheets.add("Summary");
const bom = wb.worksheets.add("BOM detail");

summary.showGridLines = false;
summary.getRange("A1:F1").merge();
summary.getRange("A1").values = [["Prototype v1 発注準備・概算（5台）"]];
summary.getRange("A1:F1").format = { fill: "#17365D", font: { color: "#FFFFFF", bold: true, size: 16 }, rowHeight: 30, verticalAlignment: "center" };
summary.getRange("A3:B9").values = [
  ["基準日", new Date("2026-10-28T00:00:00+09:00")],
  ["台数", 5],
  ["実装点/台", 75],
  ["BOM品種", 39],
  ["USD/JPY（編集可）", 155],
  ["消費税率（編集可）", 0.10],
  ["判定", "見積アップロード可能／決済前にDFM・実装プレビュー確認必須"],
];
summary.getRange("B3").setNumberFormat("yyyy-mm-dd");
summary.getRange("B7").setNumberFormat("0.00");
summary.getRange("B8").setNumberFormat("0.0%");
summary.getRange("A3:A9").format = { fill: "#D9EAF7", font: { bold: true } };

summary.getRange("A11:F11").values = [["区分", "通貨", "下限", "上限", "円換算（採用値）", "根拠・注意"]];
summary.getRange("A11:F11").format = { fill: "#2F75B5", font: { color: "#FFFFFF", bold: true }, wrapText: true };
summary.getRange("A12:D18").values = [
  ["部品（既知価格のみ）", "JPY", null, null],
  ["JLC実装費（公開料率モデル）", "USD", 151.54, 163.78],
  ["PCB製造・特殊ビア（ライブ解析）", "USD", 103.81, 103.81],
  ["JLC部品最低数量・不足品手配", "USD", 0, 0],
  ["送料（ライブ表示）", "USD", 9.75, 9.75],
  ["小計（税抜）", "JPY", null, null],
  ["税込総額", "JPY", null, null],
];
summary.getRange("E12").formulas = [["=SUM('BOM detail'!$K$2:$K$200)"]];
summary.getRange("E13").formulas = [["=AVERAGE(C13:D13)*$B$7"]];
summary.getRange("E14").formulas = [["=AVERAGE(C14:D14)*$B$7"]];
summary.getRange("E15").formulas = [["=AVERAGE(C15:D15)*$B$7"]];
summary.getRange("E16").formulas = [["=AVERAGE(C16:D16)*$B$7"]];
summary.getRange("E17").formulas = [["=SUM(E12:E16)"]];
summary.getRange("E18").formulas = [["=E17*(1+$B$8)"]];
summary.getRange("F12:F18").values = [
  ["旧参照価格＋2026-10-28再確認値。未価格行は0円扱い"],
  ["JLC公開料率による151.54–163.78 USD。正式見積ではない"],
  ["Gerber解析済: 6層27×24mm、0.8mm、ENIG、0.15mmビア、エポキシ充填＋銅キャップ、JLC06081H-2116"],
  ["在庫、部品購入最小数、損耗、支給受入費用を見積時に反映"],
  ["UPS Worldwide Express Saver表示。配送先ログイン後に再確認"],
  ["未入力費用を含まない"],
  ["暫定。発注総額ではない"],
];
summary.getRange("C12:E18").setNumberFormat("#,##0.00");
summary.getRange("A17:F18").format = { fill: "#FFF2CC", font: { bold: true }, borders: { preset: "all", style: "thin", color: "#D6B656" } };

summary.getRange("A21:F21").merge();
summary.getRange("A21").values = [["発注前ゲート"]];
summary.getRange("A21:F21").format = { fill: "#7030A0", font: { color: "#FFFFFF", bold: true } };
summary.getRange("A22:F25").values = [
  ["1", "JLC CAM/DFM", "指定14ビア（うちパッド重複13）の充填・平坦化・銅キャップを製造確認", "未完", "", ""],
  ["2", "BOM/CPL", "75実装点、Bottom反転、回転、Pin 1をプレビューで確認", "未完", "", ""],
  ["3", "部品", "支給・事前購入対象の受入可否と余剰数量を確定", "未完", "", ""],
  ["4", "実機", "初回ケース印刷、USB-C干渉、極性、吊下げ荷重を確認", "未完", "", ""],
];
summary.getRange("A22:F25").format = { borders: { preset: "all", style: "thin", color: "#D9D9D9" }, wrapText: true };
summary.getRange("D22:D25").format = { fill: "#F4CCCC", font: { color: "#9C0006", bold: true }, horizontalAlignment: "center" };

const headers = ["Route", "MPN", "JLC/LCSC", "References", "Footprint", "Qty/device", "Qty/5", "Buy qty", "Unit price", "Currency", "Line total JPY", "Source", "Status"];
bom.getRange("A1:M1").values = [headers];
bom.getRange("A1:M1").format = { fill: "#1F4E78", font: { color: "#FFFFFF", bold: true }, wrapText: true, rowHeight: 30 };
const values = plan.map(r => [
  r.route, r.mpn, r.jlc_part, r.references, r.footprint,
  Number(r.qty_per_device || 0), Number(r.installed_qty_5 || 0), r.procurement_qty === "JLC quote" ? r.procurement_qty : Number(r.procurement_qty || 0),
  r.unit_price_reference === "" ? null : Number(r.unit_price_reference), r.currency,
  r.line_total_reference === "" ? null : Number(r.line_total_reference), r.source_url, r.status,
]);
bom.getRangeByIndexes(1, 0, values.length, headers.length).values = values;
bom.getRange(`F2:K${values.length + 1}`).setNumberFormat("#,##0.00");
bom.getRange(`A1:M${values.length + 1}`).format.borders = { preset: "all", style: "thin", color: "#D9D9D9" };
bom.getRange(`A2:M${values.length + 1}`).format.wrapText = true;
bom.freezePanes.freezeRows(1);
summary.freezePanes.freezeRows(1);

for (const range of [summary.getRange("A1:F25"), bom.getRange(`A1:M${values.length + 1}`)]) range.format.autofitRows();
summary.getRange("A:A").format.columnWidth = 24;
summary.getRange("B:B").format.columnWidth = 22;
summary.getRange("C:E").format.columnWidth = 16;
summary.getRange("F:F").format.columnWidth = 52;
bom.getRange("A:A").format.columnWidth = 27;
bom.getRange("B:B").format.columnWidth = 25;
bom.getRange("C:C").format.columnWidth = 14;
bom.getRange("D:D").format.columnWidth = 30;
bom.getRange("E:E").format.columnWidth = 48;
bom.getRange("F:K").format.columnWidth = 13;
bom.getRange("L:L").format.columnWidth = 48;
bom.getRange("M:M").format.columnWidth = 38;

wb.recalculate();
const inspect = await wb.inspect({ kind: "region", sheetId: "Summary", range: "A1:F25", maxChars: 5000 });
console.log(inspect.ndjson);
const preview = await wb.render({ sheetName: "Summary", autoCrop: "all", scale: 1, format: "png" });
await fs.mkdir(outDir, { recursive: true });
await fs.writeFile(path.join(outDir, "prototype-v1-procurement-estimate-preview.png"), new Uint8Array(await preview.arrayBuffer()));
const xlsx = await SpreadsheetFile.exportXlsx(wb);
await xlsx.save(outPath);
console.log(JSON.stringify({ outPath, rows: values.length }));
