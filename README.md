# Confluent Dev Pod
This project is to automate the tedious confluent pod set up.
This project creates a container that, on startup, will:
- Authenticate to Confluent Cloud
- Change the Confluent environment
- Set the Kafka cluster
- Set an API key

## To Run Pod
- Fill in all ENV variables in `local.env.empty`
- Rename `local.env.empty` to `local.env`
- Make script executable `chmod +x ./apply_pod.sh`
- Run `./apply_pod.sh`

>Note: gettext is a dependancy for reading env variables. If you don't have it installed run `brew install gettext`

## Shell into Pod
- Run `make k8s_shell`
- Or go through k9s