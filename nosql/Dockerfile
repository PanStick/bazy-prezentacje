FROM influxdb:3-core

USER root

RUN apt-get update -qq \
    && apt-get install -y -qq --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*


#curl - narzędzie wiersza poleceń m.in. służące do przesyłania zapytań HTTP \
    #będzie nam potrzebne do komunikacji z baza influxDB:
        # zapis danych
        # odczyt
        # zarządzanie bazą
