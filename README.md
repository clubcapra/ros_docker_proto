# ROS Docker
Fichier Dockerfile et scripts servant à faciliter l'utilisation de Docker.

## Installation

### Installation de Docker
Pour installer Docker, suivez les instructions d'installation sur
[le site officiel](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/).

### Script build.sh
Script servant à compiler l'image. Une fois compilée, l'image peut être utilisée
par plusieurs conteneurs Docker. Le nom de l'image est _capra/ros_. Ne pas rouler
avec `sudo`, le script utilisera `sudo` si nécessaire.

Commandes:

```
cd /chemin/vers/dossier/du/Dockerfile
./build.sh
```

### Installation des scripts
Vous pouvez installer les scripts `capra-create` et `capra-bash` sur votre
machine afin qu'ils soient accessibles depuis n'importe quel dossier. Pour ce
faire, utilisez la commande suivante:

```
sudo ./install.sh
```

## Utilisation

### capra-create
Script servant à créer un conteneur Docker avec l'image _capra/ros_. Le nom du
conteneur est _capra_ par défaut, mais il est possible de passer un argument
au script pour le changer.

```
cd /chemin/vers/fichiers/source
capra-create # crée un conteneur nommé 'capra'
capra-create mon_conteneur # crée un conteneur nommé 'mon_conteneur'
```

Ce script crée un lien `/capra` dans le conteneur vers votre dossier actuel. Il
est donc important de le lancer depuis l'endroit où se trouvent les fichiers
source du projet. Par exemple, si les fichiers source sont dans
`/home/capra/source`, les commandes à effectuer sont les suivantes:

```
cd /home/capra/source
capra-create
```

On trouvera ainsi un dossier `/capra` dans le conteneur qui sera un lien vers
le dossier `/home/capra/source` sur la machine hôte.

Une fois la création du conteneur terminée, vous vous trouverez dans une ligne de
commande `bash` à l'intérieur de celui-ci.

### capra-bash
Une fois le conteneur créé, il est possible d'ouvrir plus d'instances de bash en
roulant le script `capra-bash`. La syntaxe à utiliser est la suivante:

```
capra-bash [--root] [nom_conteneur]
```

Par exemple:

```
capra-bash # ouvre une console dans le conteneur 'capra'
capra-bash mon_conteneur # ouvre bash dans le conteneur 'mon_conteneur'
capra-bash --root mon_conteneur # ouvre bash en tant que root dans le conteneur 'mon_conteneur'
```

Il est important de noter que si vous créez un fichier en tant que root dans le
dossier `/capra`, alors il appartiendra aussi à root sur votre machine hôte. Il
est donc recommandé de n'utiliser root que pour rouler des commandes telles que
`apt` dans le conteneur.

## Docker
Les scripts sont simples et ne sont là que pour simplifier l'utilisation de Docker.
Pour en apprendre plus sur Docker, veuillez consulter [la documentation officielle](https://docs.docker.com/).
