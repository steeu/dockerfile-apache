### Proxy (Apache)

### Docker Befehle
```
# image erstellen
docker build -t="steeu/proxy:1.0.0" .

# container erzeugen
docker run -d -it --name myproxy -p 80:80 -p 443:443 steeu/proxy:1.0.0

# mit container verbinden
docker exec -it myproxy bash
```
