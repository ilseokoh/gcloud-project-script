#!/bin/bash

FOLDER_ID=551704661037
CUSTOM_ROLE_ID=organizations/696914253542/roles/KevinCustomRole

for project_id in $(gcloud projects list --format 'value(project_id)' --filter=parent.id:${FOLDER_ID})
do
    printf "Project: ${project_id}. --------------\n"
    for user_id in $(gcloud projects get-iam-policy ${project_id} --flatten="bindings[].members" --format='value(bindings.members)' --filter="bindings.role:roles/owner")
    do
        # split with ":"
        IFS=: read -r type id <<< $user_id

        # printf "${id} is ${project_id}'s Owner. Remove Owner role now!\n"  
        # gcloud projects remove-iam-policy-binding ${project_id} --member=${type}:${id} --role='roles/owner' --format=none

        printf "Add 'Viewer' role to ${id} in ${project_id}.\n"
        gcloud projects add-iam-policy-binding ${project_id} --member=${type}:${id} --role='roles/viewer' --format=none

        printf "Add Custom Role ${CUSTOM_ROLE_ID} to ${id} in ${project_id}. \n"
        gcloud projects add-iam-policy-binding ${project_id} --member=${type}:${id} --role=${CUSTOM_ROLE_ID} --format=none    
    done
done
