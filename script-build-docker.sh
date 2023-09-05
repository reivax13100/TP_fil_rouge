#!/bin/bash

# Liste des répertoires contenant les Dockerfiles
directories=("client" "posts" "comments" "query" "moderation" "event-bus")

# Parcourez la liste des répertoires et construisez les images Docker
for dir in "${directories[@]}"
do
  # Assurez-vous que vous êtes dans le répertoire correct
  cd "$dir" || exit

  # Obtenez le nom de l'image à partir du nom du répertoire
  image_name="${dir//-/_}"

  # Construisez l'image Docker en utilisant le nom du répertoire comme tag
  docker build -t "$image_name" .

  echo $image_name

  # Revenez au répertoire parent
  cd ..
done

echo "Toutes les images Docker ont été construites avec succès."
