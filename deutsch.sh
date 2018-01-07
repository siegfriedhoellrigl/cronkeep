
if test ! -d src.bak; then
 cp -r src src.bak
fi

rm -r src
cp -r src.bak src
#cd src

cd src/application/views

find . -type f -exec sed -i 's/Add Job/Aufgabe Hinzufügen/g' {} +
find . -type f -exec sed -i 's/Edit Job/Aufgabe Editieren/g' {} +
find . -type f -exec sed -i 's/Edit</Editieren</g' {} +
find . -type f -exec sed -i 's/Run/Start/g' {} +
find . -type f -exec sed -i 's/Pause Schedule/Aufgabe stilllegen/g' {} +
find . -type f -exec sed -i 's/Resume Schedule/Aufgabe reaktivieren/g' {} +
find . -type f -exec sed -i 's/Delete/Löschen/g' {} +
find . -type f -exec sed -i 's/Simple</Einfach</g' {} +
find . -type f -exec sed -i 's/Advanced</Erweitert</g' {} +
find . -type f -exec sed -i 's/Specific time in the day/Zu einer bestimmten Zeit am Tag/g' {} +
find . -type f -exec sed -i 's/Every/Jede/g' {} +
find . -type f -exec sed -i 's/hours at minute/Stunde zu dieser Minute/g' {} +
find . -type f -exec sed -i 's/minutes/Minuten/g' {} +


cd ..
find . -type f -exec sed -i 's/Repeat/Wiederholen/g' {} +
find . -type f -exec sed -i 's/Daily/Täglich/g' {} +
find . -type f -exec sed -i 's/Weekly/Wöchentlich/g' {} +
find . -type f -exec sed -i 's/Monthly/Monatlich/g' {} +
find . -type f -exec sed -i 's/Yearly/Jährlich/g' {} +
find . -type f -exec sed -i 's/Pick day of week/Tage der Woche aussuchen/g' {} +
find . -type f -exec sed -i 's/Pick days/Kalendertage aussuchen/g' {} +
find . -type f -exec sed -i 's/Pick date/Datum aussuchen/g' {} +

find . -type f -exec sed -i 's/Sun/Son/g' {} +
find . -type f -exec sed -i 's/Tue/Die/g' {} +
find . -type f -exec sed -i 's/Wed/Mit/g' {} +
find . -type f -exec sed -i 's/Thu/Don/g' {} +
find . -type f -exec sed -i 's/Fri/Fre/g' {} +
find . -type f -exec sed -i 's/Sat/Sam/g' {} +

find . -type f -exec sed -i 's/January/Jänner/g' {} +
find . -type f -exec sed -i 's/February/Februar/g' {} +
find . -type f -exec sed -i 's/March/März/g' {} +
find . -type f -exec sed -i 's/May/Mai/g' {} +
find . -type f -exec sed -i 's/June/Juni/g' {} +
find . -type f -exec sed -i 's/July/Juli/g' {} +
find . -type f -exec sed -i 's/October/Oktober/g' {} +
find . -type f -exec sed -i 's/December/Dezember/g' {} +

find . -type f -exec sed -i 's/Job Name/Name der Aufgabe/g' {} +
find . -type f -exec sed -i 's/Time</Zeit</g' {} +


# Geht ned :
#find . -type f -exec sed -i 's/>Command</>Kommando</g' {} +

service apache2 restart


