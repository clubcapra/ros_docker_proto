# ROS Docker
Fichier Dockerfile et scripts servant à faciliter l'utilisation de Docker.

## Installation

### Installation de Docker
Pour installer Docker, suivez les instructions d'installation sur
[le site officiel](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/).

### Compiler l'image
Commandes:

```
cd /chemin/vers/dossier/du/Dockerfile
./build.sh
```

Le nom de l'image est `capra/ros`. Ne pas rouler avec `sudo`, le script utilisera `sudo` si nécessaire.

### Installation des scripts
Vous pouvez installer les scripts `capra-create` et `capra-bash` sur votre
machine afin qu'ils soient accessibles depuis n'importe quel dossier. Pour ce
faire, utilisez la commande suivante:

```
sudo ./install.sh
```

## Utilisation

### capra-create
Pour créer un conteneur avec l'image `capra/ros`:

```
cd /chemin/vers/fichiers/source
capra-create # crée un conteneur nommé 'capra'
capra-create mon_conteneur # crée un conteneur nommé 'mon_conteneur'
```

Ce script crée un lien `/capra` dans le conteneur vers votre dossier actuel. Pour
avoir la workspace de Capra dans le conteneur:

```
cd /chemin/vers/workspace
capra-create
```

La workspace se trouvera dans `/capra` dans le conteneur.

### capra-bash
Une fois le conteneur créé, pour ouvrir une autre instance de bash:

```
capra-bash [--root] [nom_conteneur]
```

Par exemple:

```
capra-bash # ouvre une console dans le conteneur 'capra'
capra-bash mon_conteneur # ouvre bash dans le conteneur 'mon_conteneur'
capra-bash --root mon_conteneur # ouvre bash en tant que root dans le conteneur 'mon_conteneur'
```

ATTENTION: n'utiliser root que pour rouler des commandes telles que
`apt` dans le conteneur. Sinon, tous les fichiers que vous crééerez dans

## Docker
Les scripts sont simples et ne sont là que pour simplifier l'utilisation de Docker.
Pour en apprendre plus sur Docker, veuillez consulter [la documentation officielle](https://docs.docker.com/).
