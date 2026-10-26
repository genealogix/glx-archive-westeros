# GLX Archive — Westeros

A demonstration [GENEALOGIX](https://genealogix.io) archive covering the families and dynasties of **A Song of Ice and Fire** by George R.R. Martin. This archive demonstrates core features of the [GLX specification](https://genealogix.io/specification/) through the rich genealogical and political world of Westeros.

## Why Westeros?

The ASOIAF universe is an ideal stress-test for a genealogical data format:

- **790+ persons** spanning 73 noble houses, with overlapping names (multiple Aegons, Brandons, Walders), bastard surnames by region, aliases, and competing claims of identity
- **Unreliable narrators** — the books are told through biased POV characters, making evidence chains and competing assertions essential
- **Disputed facts** — is Joffrey a Baratheon or a Lannister? Is Young Griff a Targaryen or a Blackfyre? Is Jon Snow Ned's bastard or Rhaegar's son?
- **Book vs. show canon divergence** — separate evidence tracks for two versions of the same story
- **Complex non-genealogical relationships** — wards, sworn swords, hostages, liege-vassal bonds, kingsguard oaths, betrothals
- **Deep temporal data** — events spanning thousands of years from the Age of Heroes through the War of the Five Kings

## Archive at a glance

| Entity | Count | Description |
|--------|------:|-------------|
| [Persons](https://genealogix.io/specification/4-entity-types/person) | 792 | Characters across 73+ houses and surnames |
| [Events](https://genealogix.io/specification/4-entity-types/event) | 986 | Births, deaths, battles, executions, coronations, rebellions, and more |
| [Relationships](https://genealogix.io/specification/4-entity-types/relationship) | 822 | Parent-child, marriage, betrothal, ward, sworn sword, and political bonds |
| [Assertions](https://genealogix.io/specification/4-entity-types/assertion) | 1,929 | Source-backed conclusions with full evidence chains |
| [Citations](https://genealogix.io/specification/4-entity-types/citation) | 269 | Specific chapter, episode, and appendix references |
| [Places](https://genealogix.io/specification/4-entity-types/place) | 107 | Castles, cities, kingdoms, regions, landmarks, rivers |
| [Sources](https://genealogix.io/specification/4-entity-types/source) | 11 | Novels, companion books, HBO series, author statements |
| [Repositories](https://genealogix.io/specification/4-entity-types/repository) | 4 | ASOIAF novels, HBO series, wiki references, legacy imports |
| [Vocabularies](https://genealogix.io/specification/4-entity-types/vocabularies) | 25 | Controlled type definitions for all entity categories |

### Houses represented

Frey (91), Targaryen (70), Lannister (23), Tyrell (19), Waynwood (18), Stark (16), Hightower (15), Florent (15), Martell (14), Baratheon (12), Rivers (12), Greyjoy (11), Arryn (11), and 60+ more.

## How GLX features are used

### Entity types

The following [GLX entity types](https://genealogix.io/specification/4-entity-types/) are represented (media is described for context):

| Entity type | Spec link | How it's used in this archive |
|-------------|-----------|-------------------------------|
| **Person** | [spec](https://genealogix.io/specification/4-entity-types/person) | Characters with temporal properties — titles that change over time (`Lord of Winterfell` → `King in the North`), multiple name types (birth, alias, married), houses, religions, causes of death |
| **Event** | [spec](https://genealogix.io/specification/4-entity-types/event) | 72 defined event types, including battles, assassinations, coronations, trials by combat, kingsmoots, rebellions, dragon hatchings. Participants with typed roles. |
| **Relationship** | [spec](https://genealogix.io/specification/4-entity-types/relationship) | Standard genealogical (parent-child, marriage, sibling) plus Westeros-specific types: ward, sworn sword, kingsguard, betrothal, secret lover, hostage, regent, hand of the king, and more |
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
            └─ assertion-robb-death-red-wedding
                 └─ event-death-robb-stark (date: "299", participant: person-robb-stark)
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

- **72 event types** — lifecycle events plus `battle`, `rebellion`, `sack`, `assassination`, `trial_by_combat`, `kingsmoot`, `mutiny`, and `dragon_hatching`
- **35 relationship types** — genealogical types plus `ward`, `sworn_sword`, `kingsguard`, `betrothal`, `secret_lover`, `hostage`, and `hand_of_the_king`
- **104 participant roles** — including `perpetrator`, `victim`, `commander`, `defender`, `betrayer`, and `hostage`
- **37 place types** — including `continent`, `kingdom`, `castle`, `city`, `battlefield`, and `ruin`

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

Dates record the fictional AC (After Conquest) calendar using qualifiers like `ABT` (about), `BEF` (before), `BET ... AND ...` (between), `FROM` (from), and `TO` (to).

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
├── persons/          # One .glx file per character (792 files)
├── events/           # Births, deaths, battles, coronations (986 files)
├── relationships/    # Genealogical and political bonds (822 files)
├── assertions/       # Source-backed conclusions, evidence chains (1,929 files)
├── citations/        # Chapter/episode/appendix references (269 files)
├── sources/          # Source records for novels, show, wikis (11 files)
├── repositories/     # Source repositories (4 files)
├── places/           # Hierarchical geography (107 files)
├── vocabularies/     # Controlled type definitions (25 files)
└── metadata.glx      # Archive metadata
```

Each entity lives in its own `.glx` file (YAML format). This is the [multi-file archive layout](https://genealogix.io/specification/3-archive-organization) — ideal for Git version control, where each commit documents a research finding.

## Validation

```bash
glx validate          # validate entire archive
glx validate file.glx # validate a single file
```

The compatibility target is [GLX CLI v0.0.0-beta.12](https://github.com/genealogix/glx/releases/tag/v0.0.0-beta.12), the latest published release as of 2026-10-26. It uses the specification's `schema/v1` family (JSON Schema 2020-12); the CLI beta number is not a separate archive-format field. Archive metadata does not accept a `glx_version` key.

Validation passes with **0 errors and 12 existing date warnings**. These concern Westeros BC dates, negative years, `ABT 0`, and `ABT 114 BEF 1`. They are retained verbatim: BC means Before Conquest here, and converting it to historical BCE or choosing a year-zero convention would change the recorded meaning. Date sorting and chronological analysis of these expressions may be incomplete. The two existing Doom of Valyria dates also remain independent recorded claims.

Current GLX main (`544591068ed1524a7750bf8e2112ea14d22cad2b`) also validates successfully, with 13 date warnings (including its additional warning on the negative-year range). The archive tracks the published release, not unreleased main behavior.

The supported `glx migrate` command found no remaining birth/death/burial, gender, confidence, or source/media-description conversions. Its `--rename-ssn-to-national-id` migration updated one unused property definition and refreshed standard vocabularies. Custom definitions were added afterward because migration rewrites vocabulary files. No entity data or IDs changed. `--strip-event-title-year` was intentionally omitted: hand-written fictional titles can match its import heuristic.

See the [GLX CLI](https://genealogix.io/quickstart) for installation. To reproduce the archive checks, run `GLX=/path/to/glx sh scripts/check-archive.sh`.

**Vocabulary preservation:** beta.12's `glx migrate` and `glx split` rewrite standard vocabulary files. Back up `vocabularies/` before running them and reconcile or restore custom definitions afterward. A plain join/split roundtrip otherwise reintroduces the 698 missing-vocabulary errors. The check script restores these definitions and compares the joined archives byte-for-byte. `glx publish` also succeeds with this archive.

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
