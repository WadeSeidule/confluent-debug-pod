# /bin/zsh
source local.env
kubectx $KUBE_CTX &&
kubens $KUBE_NAMESPACE &&
envsubst < create_pod.yaml | kubectl apply -f -