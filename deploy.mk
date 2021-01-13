install:
	helm upgrade rabbitmq charts/rabbitmq --install --namespace drycc --set rabbitmq.org=${IMAGE_PREFIX},rabbitmq.image_tag=${VERSION}

upgrade: 
	helm upgrade rabbitmq charts/rabbitmq --namespace drycc --set rabbitmq.org=${IMAGE_PREFIX},rabbitmq.image_tag=${VERSION}

uninstall:
	helm delete rabbitmq