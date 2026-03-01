# power-shell

Возможность запуска свёрнутых навыков в виде PowerShell скриптов.

Тулы находятся в каталоге [tools](../tools/tools.md) в следующем формате:

* tool-name - базовый каталог тула
* tool-name/tool-name.md - поясняющая документация для тула
* tool-name/powershell/*.ps1 -  файлы реализации тула для PowerShell

Например:

```
tools/detect-opeartion-system-type/
tools/detect-opeartion-system-type/detect-operation-system-type.md
tools/detect-opeartion-system-type/powershell/detect-operation-system-type.ps1
```
