#!/bin/bash

echo "========================================="
echo "🚀 Uruchamiam automatyczny import danych"
echo "========================================="

# Czekaj na pełne uruchomienie InfluxDB
sleep 5

# Sprawdź czy katalog z danymi istnieje
if [ ! -d "/import-data" ]; then
    echo "❌ Błąd: Katalog /import-data nie istnieje!"
    exit 1
fi

# Importuj wszystkie pliki .txt
IMPORT_COUNT=0
for file in /import-data/*.txt; do
    if [ -f "$file" ]; then
        echo "📄 Importuję: $(basename "$file")"
        
        # Usuwamy komentarze i puste linie
        # UWAGA: Używamy --precision s (SEKUNDY), bo timestampy mają 10 cyfr
        grep -v '^#' "$file" | grep -v '^$' | influx write \
            --bucket exercises \
            --org university \
            --token my-super-secret-token-2024 \
            --precision ns
        
        if [ $? -eq 0 ]; then
            echo "   ✅ Sukces"
            IMPORT_COUNT=$((IMPORT_COUNT + 1))
        else
            echo "   ❌ Błąd podczas importu"
        fi
    fi
done

echo "========================================="
echo "✅ Import zakończony. Zaimportowano plików: $IMPORT_COUNT"
echo "========================================="
