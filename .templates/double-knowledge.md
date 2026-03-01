---
id: <% tp.user.uuid() %>
title: <% tp.file.title.replaceAll('.', ' ') %>
desc: ""
created: <% tp.file.creation_date("X") %>
updated: <% tp.file.last_modified_date("X") %>
author: <% tp.file.author %>
tags: [<%tp.file.tags %> <% tp.file.title.replaceAll('.', ',') %>, <% tp.file.title.replaceAll('.', '/') %>]
double-type: knowledge
---
