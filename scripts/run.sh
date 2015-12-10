#!/bin/bash
#
# Wrapper to generate the RPM repository and start nginx

set -e

# If $REPOS wasn't set, assume /var/repo to the repository
if [ -z "$REPOS" ]; then
	createrepo /var/repo
else
	for r in $(echo ${REPOS} | tr ',' "\n"); do
		echo "==> creating repository for ${r}"
		createrepo /var/repo/${r}
	done
fi

echo "==> Handing off to nginx"
nginx -g "daemon off;"
