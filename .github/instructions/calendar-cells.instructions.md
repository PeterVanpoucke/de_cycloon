---
applyTo: "**/20??.htm"
---

# Updating yearly calendar date cells

Use this rule for yearly availability calendars such as `2026.htm`. These are
Microsoft Word-generated HTML tables. Change only the requested date cells;
preserve the calendar structure, dates, merged cells, borders, and month layout.

## Status and appearance

| Status | Appearance | Word macro |
| --- | --- | --- |
| BEZET | Red background; white, bold date number | `MaakBezet` |
| OPTIE | Light-orange background; white, bold date number | `MaakOptie` |
| VRIJ | Bright-green background (exported HTML commonly uses `lime`); automatic/black, regular date number | `MaakVrij` |

These macros are defined in `__tools__/MacroVoorKalender.txt`. Use them as the
source of truth for the formatting, especially for OPTIE; do not guess or
substitute an orange HTML color value.

## Steps

1. Confirm the target year file and the exact date or date range from the
   request. Make a backup before editing.
2. Locate each date in the correct month table. Confirm the cell contains the
   requested day number; do not select weekday headings, blank padding cells,
   or a neighboring month's cells.
3. Prefer opening the calendar in Microsoft Word, selecting the exact date
   cell(s), and running the matching macro from the table above. For a range,
   ensure every intended date cell is selected and no other cells are included.
4. Save the document back to the same `.htm` file as a webpage, preserving its
   associated `*_files` assets.
5. If editing the HTML directly instead, update only the target date cell's
   inline background and its date-number font formatting. Use a matching cell
   in that same file as the template; preserve all other style declarations
   and the date text. The usual exported backgrounds are `red` for BEZET and
   `lime` for VRIJ. For OPTIE, use formatting produced by `MaakOptie` rather
   than inventing a color value.
6. Update the displayed document date and time at the bottom right whenever
   the calendar file changes. Keep its existing `d/MM/yyyy H:mm` format.
7. Preview the saved file and verify the requested dates, status colors, and
   number contrast. Review the diff to confirm that only the intended date
   cells, the bottom-right timestamp, and unavoidable Word-generated changes
   were saved.
