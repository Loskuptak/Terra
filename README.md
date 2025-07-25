# Terra
1) vytvořil všechny .tf soubory (variables pro oba, oba mainy s malým index.html, output s ID a IP)
2) přes AWS web vytvořil S3 bucket a DynamoDB
3) otevřel git bash ve složce s main.tf etc. 
4) terraform init (jen zapnul)
5) terraform plan (ukázal co všechno chystá)
6) terrafrom apply (aplikoval plan)
7) terraform output (protože output neměl IP, zapoměl dát do main outputu IP(bylo jen v modulu) upravil znova dal terraform apply)
8) získal IP v mém případě 
(  + instance_public_ips = [
      + "3.73.116.142",
      + "63.178.238.65",
    ]
)
9) vyzkoušel jestli html funguje
10) vyzkoušel jestli ssh klíč funguje
11) ssh -i C:/Users/START/.ssh/terra-key ec2-user@3.73.116.142 
12) fungovalo
13) terraform destroy
14) S3 a DB jsem ponechal