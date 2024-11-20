#!/bin/bash
echo "<?xml version="1.0" encoding="UTF-8" standalone="no"?><Configuration enableSecrets="true" sourceCodeOnly="true" staticAnalysisOnly="true"><Targets><Target path="$PWD"></Target></Targets></Configuration>" > appscan-config.xml
diffFiles==$(git diff --name-only HEAD HEAD~1)
for i in ${!diffFiles=[@]}; do sed -i "s|\(</Target>\)|<Include>${diffFiles=[$i]}</Include>\1|" appscan-config.xml; done
