# GLX Archive — Westeros

A [GENEALOGIX](https://genealogix.io) archive covering the families and dynasties of **A Song of Ice and Fire** and **Game of Thrones**.

## Contents

| Entity | Count | Description |
|--------|------:|-------------|
| Persons | 501 | Characters across 73 houses and surnames |
| Relationships | 750 | Parent-child, marriage, and other bonds |
| Events | 780 | Births, deaths, marriages, wars, and more |
| Places | 6 | Key locations (King's Landing, Winterfell, Braavos, etc.) |
| Vocabularies | 16 | Controlled type definitions for all entity categories |

### Houses represented

Frey (91), Targaryen (68), Lannister (23), Tyrell (19), Waynwood (18), Hightower (15), Florent (15), Stark (14), Martell (12), Rivers (12), Baratheon (12), Arryn (11), and 60+ more.

## Archive structure

```
├── persons/          # One file per character
├── events/           # Births, deaths, marriages, battles
├── relationships/    # Parent-child, marriage, political bonds
├── places/           # Castles, cities, landmarks
├── vocabularies/     # Controlled type definitions
└── metadata.glx      # Archive metadata
```

All entity files use the `.glx` YAML format. See the [GLX specification](https://genealogix.io/specification/) for details.

## Attribution

The initial seed data for this archive was imported from a [Findmypast](https://www.findmypast.com/) sample GEDCOM file (exported via MyHeritage Family Tree Builder 7.0, May 2013) and converted to GLX format.

## License

The factual genealogical data in this archive is derived from the published works of George R.R. Martin. This structured dataset is provided for research, educational, and fan purposes.
