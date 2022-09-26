sudo -u postgres psql -c "DROP DATABASE IF EXISTS loonatlas"
sudo -u postgres psql -c "CREATE DATABASE loonatlas"
sudo -u postgres psql -c "CREATE ROLE loonatlas WITH SUPERUSER LOGIN PASSWORD 'EatArugula'"
sudo -u postgres pg_restore --dbname=loonatlas --create --verbose ./restore/loonatlas.backup
