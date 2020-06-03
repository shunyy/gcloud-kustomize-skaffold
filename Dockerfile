FROM google/cloud-sdk:295.0.0-alpine

COPY --from=docker:18 /usr/local/bin/docker* /usr/local/bin/

ENV KUSTOMIZE_VERSION v3.6.1
ENV SKAFFOLD_VERSION v1.10.1

RUN curl -Lo skaffold "https://storage.googleapis.com/skaffold/releases/${SKAFFOLD_VERSION}/skaffold-linux-amd64" \
 && install skaffold /usr/local/bin/ \
 && curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/kustomize/${KUSTOMIZE_VERSION}/hack/install_kustomize.sh" | bash \
 && install kustomize /usr/local/bin/ \
 && gcloud components install kubectl -q --no-user-output-enabled
