#!/bin/bash

# Usage:
#     ALGOLIA_ADMIN_API_KEY=<Algolia admin key for prod account> OBJ_ACCESS_KEY=<OBJ access key for production bucket> OBJ_SECRET_KEY=<OBJ for production bucket> ./deploy_to_production.sh
#
# This scripts calls the `deploy_to_object_storage.sh` script, which will build
# Hugo and sync the rendered site to the production `linodedocs-latestrelease`
# object storage bucket.
#
# Afterwards, it updates the indices on the production Algolia account.

cd scripts
./deploy_to_object_storage.sh
cd update_linode_docs_search_indices
ALGOLIA_ADMIN_API_KEY=$ALGOLIA_ADMIN_API_KEY go run ./main.go --sourcedir ../../public