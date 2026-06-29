# Author Fair Conditions License (AFCL)

## Overview

AFCL (Author Fair Conditions License) is a **licensing framework**, not a software license.

It defines a set of **meta-rules and constraints** that govern how developers or authors may define licensing conditions for their software or creative works.

AFCL does **not replace existing licenses** such as MIT, GPL, LGPL, or others. Instead, it provides a structured layer that ensures that any additional conditions written by a developer remain:

* Clear
* Objectively interpretable
* Measurable when possible
* Non-contradictory with the AFCL framework rules

AFCL itself is licensed under the **MIT License**, allowing free use, modification, and redistribution of the framework.

---

## Core Concept

Traditional licenses define *what users can do with software*.

AFCL defines *how license conditions themselves must be written and interpreted*.

This means developers can still choose any base license (MIT, GPL, LGPL, proprietary, etc.), and optionally attach additional conditions, as long as those conditions comply with AFCL rules.

---

## Key Principles

### 1. Clarity Requirement

All developer-defined conditions must be written in clear, unambiguous language that can be objectively interpreted.

Avoid vague terms such as:

* “reasonable amount”
* “large usage”
* “significant portion”

Prefer measurable expressions such as:

* percentage limits
* file counts
* numeric thresholds
* explicit behavioral constraints

---

### 2. Measurability Requirement

Whenever possible, restrictions or permissions must be defined using measurable criteria.

This ensures that compliance can be evaluated objectively without subjective interpretation.

---

### 3. Interpretation Rule

If a condition can reasonably be interpreted in multiple ways, the interpretation that imposes the **least restriction on the user** shall apply.

---

### 4. Conflict Resolution Rule

If a developer-defined condition conflicts with AFCL framework rules, the AFCL framework takes precedence.

Invalid or ambiguous conditions may be disregarded if they violate AFCL principles.

---

### 5. License Independence

AFCL does not replace or override existing licenses.

Developers may still choose any base license, including but not limited to:

* MIT License
* GNU GPL
* LGPL
* Apache License
* Proprietary licenses

AFCL operates as a **governance layer** over the conditions added on top of those licenses.

---

## How AFCL is Used

A typical project structure using AFCL looks like:

```none
Project License = Base License (e.g., MIT)
                 + Developer Conditions
                 + AFCL Compliance Rules
```

Example:

* Base License: MIT License
* Additional Conditions: Project-specific restrictions or permissions
* AFCL: Ensures conditions are clear, measurable, and non-ambiguous

---

## Important Clarification

AFCL does **not grant software permissions by itself**.

It does not define:

* Copyright ownership
* Open source status
* Distribution rights

These remain governed by the underlying license selected by the developer.

---

## AFCL License

AFCL itself is distributed under the **MIT License**, meaning:

* It can be freely used
* It can be modified
* It can be redistributed
* It can be embedded in other licensing systems

---

## Intended Purpose

AFCL was designed to:

* Improve clarity in custom license conditions
* Reduce ambiguity in developer-defined restrictions
* Provide a consistent interpretation framework
* Support fair and transparent licensing structures

---

## Disclaimer

AFCL is a conceptual and structural framework for licensing conditions. It is not legal advice and does not replace formal legal interpretation of software licenses.
