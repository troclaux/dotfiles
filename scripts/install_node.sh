#!/bin/bash

rm -rdf ~/.volta &&
	curl https://get.volta.sh | bash -s -- --skip-setup &&
	~/.volta/bin/volta install node &&
	echo "Finished installing node"
