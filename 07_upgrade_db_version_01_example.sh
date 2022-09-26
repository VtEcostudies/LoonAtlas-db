sudo -u postgres psql -d loonatlas -c "BEGIN TRANSACTION"
sudo -u postgres psql -d loonatlas -f ./upgrade/db.01/01_00_*.sql
sudo -u postgres psql -d loonatlas -c "COMMIT TRANSACTION;"
