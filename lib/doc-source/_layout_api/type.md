---
layout: "layout"

title: "type"
description: |
  Renders API documentation for a type construct, including the following sections:

  - interface list
  - ancestor chain (superclasses)
  - inheritance tree (subclasses)
  - field, property, and method signatures

  Some page variables use a _method info_ value, which is an object with the following keys:
  ```yaml
  method_info:
    attributes: [ string ]
    description: string
    name: string
    parameters: [ { default_value: string, name: string, type: string } ]
    type: string
  ```

  Some page variables use a _field info_ value, which is an object with the following keys:
  ```yaml
  field_info:
    attributes: [ string ]
    description: string
    name: string
    type: string
  ```
parent_layout: [ "page", "base", "compress" ]
parameters:
  - { name: "ancestors", type: "[ { module: string, name: string }, ..]", optional: true, description: "chain of ancestors this type inherits from, ordered with parent first, then grandparent, great grandparent, and so on." }
  - { name: "constructor", type: method_info, optional: true, description: "signature of the type constructor method (if it has one)" }
  - { name: "description", type: "string", description: "documentation comments for the type; markdown is supported" }
  - { name: "fields", type: "[ field_info, .. ]", optional: true, description: "list of public and protected fields the type has" }
  - { name: "methods", type: "[ method_info, ..]", optional: true, description: "list of public and protected method signatures the type implements" }
  - { name: "module", type: "string", description: "package the type is a member of" }
  - { name: "name", type: "string", description: "name of the type" }
  - { name: "properties", type: "[ field_info, .. ]", optional: true, description: "list of public and protected properties the type has" }
  - { name: "tags", type: "[ { name: string, value: string }, ..]", optional: true, description: "documentation tags assigned to the type" }
  - { name: "type", type: "string", description: "construct of the type (e.g. `CLASS`, `INTERFACE`, `STRUCT`)" }
  - { name: "type_attributes", type: "[ string, .. ]", description: "list of access modifiers for the type (e.g. `public`, `final`, `native`)" }
---
