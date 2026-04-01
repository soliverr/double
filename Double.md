---
double-state: [null, state-0, null]
---

# Double

>
> **The program that does not exist… *yet* !**
> 


## General Considerations

This document outlines the core ideas treated as shared rules and community-endorsed concepts for the **Double** project.

If you do not agree with the ideas and concepts below, you have two options:

1. Do not participate in the **Double** project and try to implement your ideas as a separate project.
2. Present your ideas as described in section [#ideas] and, together with other contributors, help the project evolve by merging individual knowledge and concepts into the **Double** knowledge space.


## Grand Idea

The central paradigm of the project is to create a personal digital twin - **Double** - of one’s knowledge, skills, and capabilities for interacting with the digital world and computing ecosystems.

A personal digital twin is initially a bundle of skills for interacting with information systems in the broadest sense—interactions through computing devices (computers, smartphones, gadgets) and interactions directed at you from the digital world.

The digital twin is created as a personal and a community copy of skills and should continually evolve and improve.

By choice and consent of project participants, local personal digital twins can be merged to create a shared, universal community agent validated by all **Double** contributors, aggregating the best personal skills from participants.

The universal community **Double** agent can act as a mentor for the local digital twins of new participants or customers of the **Double** project.

This establishes the project’s foundational principle:

 **Build an open system for accumulating and exchanging knowledge among all *Double* project participants.**

*The accumulated knowledge and skills may be **open**, available to any participant or external user, or **restricted**, available individually or under paywall.*


## Ideas

Despite of many project files in the project's directory, ***at the very beginning***, there is nothing except ideas. So, it is required an agreement how to live with them.

### Double layout naming convention

* create any directory
* create a directory's markdown file into the directory with the same name as the created directory name
* use [kebab case](https://en.wikipedia.org/wiki/Letter_case#Kebab_case) for naming

Example:

```
any-directory-name\
any-directory-name\any-directory-name.md
```

So, keep all ideas into the [ideas](ideas/ideas.md) directory.



## Participants

As mentioned in [Grand Idea](#grand-idea), it is highly desired to spread the Double project into community of enthusiasts. So one more thing is required ***at the very beginning***: a place or a directory to keep personal contributions into the project.

The [people](people/people.md) directory is the such kind of place.

# At the Very Beginning

Here we are to start any other Double based project.

There are only these core concepts:

1. [General Considerations](#general-considerations)
1. [Grand Idea](#grand-idea)
1. [Double Layout Naming Convention](#double-layout-naming-convention)
1. [Ideas' Catalog](#ideas)
1. [Supposed Community Catalog](#participants)
1. Main project language is English

## State of the Double project

Looks like there is a need for one more core concept. It is a **"State of the Double project"**. The state concept defines something like control point or check point for the Double project to traverse into project's historical retrospective and fork from any state a new one.

So as the main project developed further, anyone can jump back and invents his own concept of developing, but there will be common ancestor (*'state-N'*) and then may be a common descendant when a fork will be joined with mainstream. So, think about ***states*** like a divergence and convergence points of the life time of the project.

State is traced by keeping special tags both in-file metadata (markdown properties) and git annotated tags in sync:

- there is a property named `double-state` that keeps a bi-directional list: [`prev`, `current`, `next`] - *array of pointers*,
- if pointer is not defined, then keep `null` or `none` value for that pointer,
- project states are published as git annotated tags: `state-0`, `state-1`, etc,
- ***states*** can be traversed easily after clone using a tag name.

Example commands:

- `git tag -a state-0 -m "State 0: initial baseline"`
- `git tag -a state-1 -m "State 1: added state tracing section"`
- `git push origin --tags`
- `git fetch --tags`
- `git tag --list "state-*"`
- `git checkout state-0`

Update policy:

- when moving forward, set `prev` to old `current`, `current` to new value, and optionally `next` to the anticipated successor,
- keep past state tags immutable; add new annotated tags for each new state


# What to do next

To go into the next "state-1" it is required to clarify the follow things:

* how to maintain ideas in the [ideas](./ideas/ideas.md) folder and outline the direction of the project's development
* how to maintain participants in the [people](./people/people.md) folder