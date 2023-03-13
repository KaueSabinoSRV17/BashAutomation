#!/usr/bin/env bash
executable=$1
finalName=${executable//.sh/}
publicPath="/home/kaue/estudo/linux/bash/public/${finalName}"

cp $executable $publicPath
chmod ugo+x $publicPath

echo "Versão Gerada com Sucesso!"
exec bash