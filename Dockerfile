FROM google/cloud-sdk:295.0.0-alpine

COPY --from=docker:18 /usr/local/bin/docker* /usr/local/bin/

ENV KUSTOMIZE_VERSION v3.6.1
ENV SKAFFOLD_VERSION v1.10.1
ENV KUBECTL_VERSION v1.18.0

RUN curl -Lo skaffold "https://storage.googleapis.com/skaffold/releases/${SKAFFOLD_VERSION}/skaffold-linux-amd64" \
 && install skaffold /usr/local/bin/ \
 && curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/kustomize/${KUSTOMIZE_VERSION}/hack/install_kustomize.sh" | bash \
 && install kustomize /usr/local/bin/ \
 && curl -LO "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
 && install kubectl /usr/local/bin/ \
 && rm kustomize skaffold kubectl