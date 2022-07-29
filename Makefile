push:
	docker push esharesinc/confluent-debug-pod:latest

build:
	chmod +x ./scripts/build.sh && ./scripts/build.sh

run_local:
	chmod +x ./scripts/run.sh && ./scripts/run.sh

k8s_shell:
	set -a && source local.env && set +a
	kubectx ${KUBE_CTX}
	kubens ${KUBE_NAMESPACE}
	kubectl exec ${POD_NAME} -i -t -- zsh
