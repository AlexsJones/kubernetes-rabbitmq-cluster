echo "Building for environment $1"

rm -rf deployment || true

for d in ./templates/**/*; do
    filename=$(dirname $d)
    foldername=`echo $(basename $filename)`
    folderaltered=$(echo $foldername | sed 's/templates/deployment/g')
    mkdir -p deployment/$folderaltered

   newpath=$(echo $d | sed 's/templates/deployment/g')
   echo "Creating $newpath"
   vortex --template $d --output $newpath -varpath ./environments/$1.yaml
done
