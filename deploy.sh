docker build -t taylordaw61/multi-k8s-client:latest -t taylordaw61/multi-k8s-client:$SHA -f ./client/Dockerfile ./client
docker build -t taylordaw61/multi-k8s-server:latest -t taylordaw61/multi-k8s-server:$SHA -f ./server/Dockerfile ./server
docker build -t taylordaw61/multi-k8s-worker:latest -t taylordaw61/multi-k8s-worker:$SHA -f ./worker/Dockerfile ./worker

docker push taylordaw61/multi-k8s-client:latest
docker push taylordaw61/multi-k8s-client:$SHA
docker push taylordaw61/multi-k8s-server:latest
docker push taylordaw61/multi-k8s-server:$SHA
docker push taylordaw61/multi-k8s-worker:latest
docker push taylordaw61/multi-k8s-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment api=taylordaw61/multi-k8s-server
kubectl set image deployments/client-deployment client=taylordaw61/multi-k8s-client
kubectl set image deployments/worker-deployment worker=taylordaw61/multi-k8s-worker