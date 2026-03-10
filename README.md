# GLX Archive — Westeros

A demonstration [GENEALOGIX](https://genealogix.io) archive covering the families and dynasties of **A Song of Ice and Fire** by George R.R. Martin. This archive showcases every feature of the [GLX specification](https://genealogix.io/specification/) through the rich genealogical and political world of Westeros.

## Why Westeros?

The ASOIAF universe is an ideal stress-test for a genealogical data format:

- **790+ persons** spanning 73 noble houses, with overlapping names (multiple Aegons, Brandons, Walders), bastard surnames by region, aliases, and competing claims of identity
- **Unreliable narrators** — the books are told through biased POV characters, making evidence chains and competing assertions essential
- **Disputed facts** — is Joffrey a Baratheon or a Lannister? Is Young Griff a Targaryen or a Blackfyre? Is Jon Snow Ned's bastard or Rhaegar's son?
- **Book vs. show canon divergence** — separate evidence tracks for two versions of the same story
- **Complex non-genealogical relationships** — wards, sworn swords, hostages, liege-vassal bonds, kingsguard oaths, betrothals, regencies
- **Deep temporal data** — events spanning thousands of years from the Age of Heroes through the War of the Five Kings

## Archive at a glance

| Entity | Count | Description |
|--------|------:|-------------|
| [Persons](https://genealogix.io/specification/4-entity-types/person) | 790 | Characters across 73+ houses and surnames |
| [Events](https://genealogix.io/specification/4-entity-types/event) | 961 | Births, deaths, battles, executions, coronations, rebellions, and more |
| [Relationships](https://genealogix.io/specification/4-entity-types/relationship) | 807 | Parent-child, marriage, betrothal, ward, sworn sword, and political bonds |
| [Assertions](https://genealogix.io/specification/4-entity-types/assertion) | 820+ | Source-backed conclusions with full evidence chains |
| [Citations](https://genealogix.io/specification/4-entity-types/citation) | 260+ | Specific chapter, episode, and appendix references |
| [Places](https://genealogix.io/specification/4-entity-types/place) | 108 | Castles, cities, kingdoms, regions, landmarks, rivers |
| [Sources](https://genealogix.io/specification/4-entity-types/source) | 11 | Novels, companion books, HBO series, author statements |
| [Repositories](https://genealogix.io/specification/4-entity-types/repository) | 4 | ASOIAF novels, HBO series, wiki references, legacy imports |
| [Vocabularies](https://genealogix.io/specification/4-entity-types/vocabularies) | 16 | Controlled type definitions for all entity categories |

### Houses represented

Frey (91), Targaryen (70), Lannister (23), Tyrell (19), Waynwood (18), Stark (16), Hightower (15), Florent (15), Martell (14), Baratheon (12), Rivers (12), Greyjoy (11), Arryn (11), and 60+ more.

## How GLX features are used

### Entity types

Every [GLX entity type](https://genealogix.io/specification/4-entity-types/) is exercised:

| Entity type | Spec link | How it's used in this archive |
|-------------|-----------|-------------------------------|
| **Person** | [spec](https://genealogix.io/specification/4-entity-types/person) | Characters with temporal properties — titles that change over time (`Lord of Winterfell` → `King in the North`), multiple name types (birth, alias, married), houses, religions, causes of death |
| **Event** | [spec](https://genealogix.io/specification/4-entity-types/event) | 102 custom event types: battles, assassinations, coronations, trials by combat, kingsmoots, rebellions, dragon hatchings, walks of atonement. Participants with typed roles. |
| **Relationship** | [spec](https://genealogix.io/specification/4-entity-types/relationship) | Standard genealogical (parent-child, marriage, sibling) plus 16 Westeros-specific types: ward, sworn sword, liege-vassal, kingsguard, betrothal, secret lover, hostage, regent, hand of the king, and more |
| **Place** | [spec](https://genealogix.io/specification/4-entity-types/place) | Hierarchical geography — `place-winterfell` (castle) → `place-the-north` (kingdom) → `place-westeros` (continent). Types include continent, kingdom, castle, city, town, region, landmark, battlefield |
| **Source** | [spec](https://genealogix.io/specification/4-entity-types/source) | 5 novels, companion texts, HBO series, AWOIAF wiki, author statement collections |
| **Citation** | [spec](https://genealogix.io/specification/4-entity-types/citation) | Specific chapter references (`ASOS Catelyn VII`), episode references (`S06E10 — The Winds of Winter`), appendix entries, and manuscript annotations with `text_from_source` quotes |
| **Assertion** | [spec](https://genealogix.io/specification/4-entity-types/assertion) | Property assertions, participant assertions, competing claims with `confidence` and `status` levels. See [Competing claims](#competing-claims-and-fan-theories) below. |
| **Repository** | [spec](https://genealogix.io/specification/4-entity-types/repository) | Organizational containers: ASOIAF novel series, HBO broadcast series, wiki reference collection, legacy GEDCOM import |
| **Media** | [spec](https://genealogix.io/specification/4-entity-types/media) | Not used in this archive (no image/document attachments) |

### Evidence chains

The [GLX evidence model](https://genealogix.io/specification/2-core-concepts) traces every fact through a full chain:

```
Repository → Source → Citation → Assertion → Entity Property
```

**Example: Robb Stark's death at the Red Wedding**

```
repository-asoiaf-novels
  └─ source-asos (A Storm of Swords)
       └─ citation-asos-catelyn-vii (Catelyn VII — "The crossbow bolt drove him to his knees.")
            └─ assertion-robb-stark-death-red-wedding
                 └─ person-robb-stark (died_on: "299", cause_of_death: "Homicide")
```

**Example: Joffrey's parentage — competing evidence chains**

```
citation-agot-appendix      → assertion-joffrey-father-official  (Robert, confidence: low, status: disproven)
citation-agot-eddard-xii    → assertion-joffrey-father-actual    (Jaime, confidence: high, status: proven)
```

Event participation uses [participant assertions](https://genealogix.io/specification/4-entity-types/assertion) with typed roles, keeping the evidence chain intact even for who-was-at-what-battle questions.

### Competing claims and fan theories

The assertion system shines when facts are disputed. This archive demonstrates several patterns:

#### Proven vs. disproven claims

Joffrey's parentage shows both states — the official claim (Robert's son) is `status: disproven`, while the actual parentage (Jaime's son) is `status: proven`, each backed by different citations.

#### Book vs. show canon divergence

Jon Snow's parentage (R+L=J) shows parallel evidence tracks:
- **Book evidence** → `confidence: medium, status: supported` (extensive circumstantial evidence, not yet explicitly stated)
- **Show evidence** → `confidence: high, status: proven` (S06E10 and S07E07 directly confirm it)

Both assertions reference the same person and property but cite different source types (novel chapters vs. TV episodes).

#### Author refutations

The "Coldhands = Benjen Stark" theory was definitively disproven by GRRM's handwritten "NO" on the ADWD manuscript, now held at Texas A&M's Cushing Library. This assertion has `confidence: high, status: disproven` — unusual for fan theories, since the refutation comes directly from the author rather than from textual evidence. Meanwhile, the HBO show merged the characters anyway, creating a separate `status: accepted` assertion for show canon.

#### Unresolved speculation

The "Tyrion Targaryen" theory (Tyrion is the son of Aerys II, not Tywin) demonstrates `confidence: low, status: speculative` — textual evidence exists but is heavily debated. A competing assertion maintains the orthodox parentage as `status: accepted`.

The (f)Aegon / Blackfyre theory similarly sits at `confidence: low, status: speculative`, with textual clues from the Golden Company's Blackfyre roots and Illyrio's Valyrian-featured wife Serra.

### Custom vocabularies

This archive extends the [standard GLX vocabularies](https://genealogix.io/specification/5-standard-vocabularies/) with types specific to Westerosi society:

- **102 event types** — standard lifecycle events plus `battle`, `rebellion`, `sack`, `assassination`, `trial_by_combat`, `kingsmoot`, `mutiny`, `dragon_hatching`, `walk_of_atonement`, and more
- **65 relationship types** — standard genealogical types plus `ward`, `sworn_sword`, `liege_vassal`, `kingsguard`, `betrothal`, `secret_lover`, `hostage`, `regent`, `hand_of_the_king`
- **123 participant roles** — `perpetrator`, `victim`, `commander`, `defender`, `betrayer`, `hostage`, `cupbearer`, and domain-specific roles
- **61 place types** — `continent`, `kingdom`, `castle`, `city`, `battlefield`, `ruin`, and more

Vocabulary files live in `vocabularies/` and are validated by `glx validate`.

### Temporal properties

Person properties change over time. GLX handles this through temporal `date` qualifiers ([date formats](https://genealogix.io/specification/2-core-concepts)):

```yaml
# Daenerys Targaryen's titles accumulate across 5 books
title:
  - value: "Princess"
    date: "FROM 284 TO 298"
  - value: "Khaleesi of the Great Grass Sea"
    date: "FROM 298"
  - value: "Queen of Meereen"
    date: "FROM 299"
```

Dates use the AC (After Conquest) calendar, which maps directly to GLX's standard date format with qualifiers like `ABT` (about), `BEF` (before), `BET ... AND ...` (between), `FROM` (from), and `TO` (to).

### Place hierarchy

Places form a tree via `parent` references:

```
place-westeros (continent)
  └─ place-the-north (kingdom)
       └─ place-winterfell (castle)
            └─ place-winterfell-godswood (landmark)
```

## Archive structure

```
├── persons/          # One .glx file per character (790 files)
├── events/           # Births, deaths, battles, coronations (961 files)
├── relationships/    # Genealogical and political bonds (807 files)
├── assertions/       # Source-backed conclusions, evidence chains (820+ files)
├── citations/        # Chapter/episode/appendix references (260+ files)
├── sources/          # Source records for novels, show, wikis (11 files)
├── repositories/     # Source repositories (4 files)
├── places/           # Hierarchical geography (108 files)
├── vocabularies/     # Controlled type definitions (16 files)
└── metadata.glx      # Archive metadata
```

Each entity lives in its own `.glx` file (YAML format). This is the [multi-file archive layout](https://genealogix.io/specification/3-archive-organization) — ideal for Git version control, where each commit documents a research finding.

## Validation

```bash
glx validate          # validate entire archive
glx validate file.glx # validate a single file
```

The archive validates clean (0 errors). See the [GLX CLI](https://genealogix.io/quickstart) for installation.

## Data lineage

The initial seed data was imported from a [Findmypast](https://www.findmypast.com/) sample GEDCOM file (exported via MyHeritage Family Tree Builder 7.0, May 2013) and converted to GLX format. Legacy entities retain their original numeric IDs (e.g., `person-488`) with MyHeritage RINs preserved in `external_ids` properties.

The archive has since been extensively expanded with research from the novels, appendices, companion texts (TWOIAF, Fire & Blood), the HBO adaptation, author statements, and community wikis — each tracked through the full evidence chain.

## Further reading

- [GLX Specification](https://genealogix.io/specification/) — the full format reference
- [Core Concepts](https://genealogix.io/specification/2-core-concepts) — properties, assertions, evidence chains, dates
- [Archive Organization](https://genealogix.io/specification/3-archive-organization) — file layout, validation, IDs
- [Quickstart Guide](https://genealogix.io/quickstart) — get started with GLX
- [Best Practices](https://genealogix.io/guides/best-practices) — recommended patterns
- [Examples](https://genealogix.io/examples/) — other GLX archive examples

## License

The factual genealogical data in this archive is derived from the published works of George R.R. Martin. This structured dataset is provided for research, educational, and fan purposes.
