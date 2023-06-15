terraform init -input=false
terraform workspace create ${WORKSPACE} || echo "Workspace ${WORKSPACE} already exists or cannot be created"
export TF_WORKSPACE=$WORKSPACE


ICON=$(grep -m1 '^destroy' destroy.txt | cut -d= -f2- | tr -d ' ') 


if [ "$ICON" = "true" ]; then
  echo "executando terraform destroy"
  terraform destroy
elif [ "$ICON" = "false" ]; then
  echo "criando ambiente"
  terraform workspace select dev
  terraform plan -var-file="./dev/terraform.tfvars" -out plano
  terraform apply "plano" -auto-approve
else
  echo "opção especificada no arquivo destroy está inválida"
fi