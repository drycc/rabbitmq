install:
	helm upgrade rabbitmq charts/rabbitmq --install --namespace drycc --set rabbitmq.org=${IMAGE_PREFIX},rabbitmq.imageTag=${VERSION}

upgrade: 
	helm upgrade rabbitmq charts/rabbitmq --namespace drycc --set rabbitmq.org=${IMAGE_PREFIX},rabbitmq.imageTag=${VERSION}

uninstall:
	helm delete rabbitmq
