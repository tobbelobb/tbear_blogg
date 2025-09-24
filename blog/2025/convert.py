import pandas as pd
import json

# Read the data from your ODS file (specify the sheet name or index)
df = pd.read_excel("./hangprinter_v5_boms.ods", engine="odf", sheet_name="baseline_v5")
records = df.to_json(orient="records")
parsed_records = json.loads(records)
formatted_records = json.dumps(parsed_records, indent=4, ensure_ascii=False) # ensure_ascii=False for proper handling of non-ASCII characters
with open("./hangprinter_v5_boms_baseline_v5.json", "w", encoding="utf-8") as f: # Specify encoding for writing
    f.write(formatted_records)

print("✅ Conversion complete! ./hangprinter_v5_boms_baseline_v5.json is ready for the web and is human-readable.")

df2 = pd.read_excel("./hangprinter_v5_boms.ods", engine="odf", sheet_name="duet_hcl_nema17")
records2 = df2.to_json(orient="records")
parsed_records2 = json.loads(records2)
formatted_records2 = json.dumps(parsed_records2, indent=4, ensure_ascii=False)
with open("./hangprinter_v5_boms_duet_hcl_nema17.json", "w", encoding="utf-8") as f:
    f.write(formatted_records2)

print("✅ Conversion complete! ./hangprinter_v5_boms_duet_hcl_nema17.json is ready for the web and is human-readable.")

df3 = pd.read_excel("./hangprinter_v5_boms.ods", engine="odf", sheet_name="klipper_nema17_ebb42")
records3 = df3.to_json(orient="records")
parsed_records3 = json.loads(records3)
formatted_records3 = json.dumps(parsed_records3, indent=4, ensure_ascii=False)
with open("./hangprinter_v5_boms_klipper_nema17_ebb42.json", "w", encoding="utf-8") as f:
    f.write(formatted_records3)

print("✅ Conversion complete! ./hangprinter_v5_boms_duet_nema17_ebb42.json is ready for the web and is human-readable.")
