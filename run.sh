export ASKCOS_REGISTRY=registry.gitlab.com/mlpds_mit/askcosv2
docker build -f Dockerfile_gpu -t ${ASKCOS_REGISTRY}/forward_predictor/augmented_transformer:1.0-gpu .
sh scripts/serve_gpu_in_docker.sh