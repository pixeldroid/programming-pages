---
layout: "layout"

title: "package"
description: |
  Renders a summary page for a code package. Groups package members by type and notes the declaring file, if provided.

  For programming languages that support namespaces, a package (or module), is a collection of files that belong to the same namespace.

  This template supports many common language constructs (`enum`, `struct`, `class`, etc.), and auto-links to the corresponding type summary page. If a type summary page cannot be located, no link will be generated.

  Construct meta data should be provided in the following format:

  ```yaml
  [ { declaration: string, description: string, name: string } ]
  ```
parent_layout: [ "page", "base", "compress" ]
parameters:
  - { name: "module", type: "string", description: "name of the package" }
  - { name: "submodules", type: "[ string, .. ]", optional: true, description: "list of child packages" }
  - { name: "delegates", type: "[ { declaration: string, description: string, name: string }, .. ]", optional: true, description: "list of delegates that belong to the package" }
  - { name: "interfaces", type: "[ { declaration: string, description: string, name: string }, .. ]", optional: true, description: "list of interfaces that belong to the package" }
  - { name: "enums", type: "[ { declaration: string, description: string, name: string }, .. ]", optional: true, description: "list of enums that belong to the package" }
  - { name: "structs", type: "[ { declaration: string, description: string, name: string }, .. ]", optional: true, description: "list of structs that belong to the package" }
  - { name: "classes", type: "[ { declaration: string, description: string, name: string }, .. ]", optional: true, description: "list of classes that belong to the package" }
---
