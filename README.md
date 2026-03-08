# GLX Archive — Westeros

A [GENEALOGIX](https://genealogix.io) archive covering the families and dynasties of **A Song of Ice and Fire** and **Game of Thrones**.

## Contents

| Entity | Count | Description |
|--------|------:|-------------|
| Persons | 790 | Characters across 73+ houses and surnames |
| Relationships | 807 | Parent-child, marriage, betrothal, ward, sworn sword, and political bonds |
| Events | 930 | Births, deaths, marriages, battles, executions, coronations, and more |
| Assertions | 687 | Source-backed conclusions with full evidence chains |
| Citations | 198 | Specific chapter/appendix references to canon sources |
| Places | 106 | Castles, cities, regions, landmarks, rivers, and more |
| Sources | 8 | AGOT, ACOK, ASOS, AFFC, ADWD, TWOIAF, Fire & Blood, MyHeritage import |
| Repositories | 3 | ASOIAF novels, HBO series, MyHeritage import |
| Vocabularies | 16 | Controlled type definitions for all entity categories |

### Houses represented

Frey (91), Targaryen (70), Lannister (23), Tyrell (19), Waynwood (18), Stark (16), Hightower (15), Florent (15), Martell (14), Baratheon (12), Rivers (12), Greyjoy (11), Arryn (11), and 60+ more.

## Archive structure

```
├── persons/          # One file per character
├── events/           # Births, deaths, marriages, battles
├── relationships/    # Parent-child, marriage, political bonds
├── assertions/       # Source-backed conclusions (evidence chain)
├── citations/        # Chapter/appendix references to canon sources
├── sources/          # Novel and companion book source records
├── repositories/     # Source repositories (novel series, HBO, imports)
├── places/           # Castles, cities, regions, landmarks
├── vocabularies/     # Controlled type definitions
└── metadata.glx      # Archive metadata
```

All entity files use the `.glx` YAML format. See the [GLX specification](https://genealogix.io/specification/) for details.

## Evidence model

Every fact in the archive traces back to a canon source through the evidence chain:

```
Repository → Source → Citation → Assertion → Entity Property
```

For example, Robb Stark's death is documented as:
- **Repository**: ASOIAF Novels
- **Source**: A Storm of Swords
- **Citation**: ASOS Catelyn VII (the Red Wedding chapter)
- **Assertion**: Robb's cause of death, with direct text quote
- **Person**: `died_on: "299"` on person-robb-stark

Event participation uses dedicated [participant assertions](https://genealogix.io/specification/4-entity-types/assertion#participant-assertions) linking persons to events/relationships with roles and evidence.

## Attribution

The initial seed data for this archive was imported from a [Findmypast](https://www.findmypast.com/) sample GEDCOM file (exported via MyHeritage Family Tree Builder 7.0, May 2013) and converted to GLX format. The archive has since been extensively expanded with research from the novels and their appendices.

## License

The factual genealogical data in this archive is derived from the published works of George R.R. Martin. This structured dataset is provided for research, educational, and fan purposes.
