#!/bin/zsh

# This script will be executed when the Databricks cluster starts.

# Set environment variables from cluster environment or secrets
export DATABRICKS_HOST=$SERVER_HOSTNAME
export DATABRICKS_TOKEN=$ACCESS_TOKEN

# Output the values of the environment variables (for debugging purposes)
echo "DATABRICKS_HOST is set to $DATABRICKS_HOST"
echo "DATABRICKS_TOKEN is set to $DATABRICKS_TOKEN"

# Optionally, you can test the connection to Databricks (for debugging)
curl -X GET "$DATABRICKS_HOST/api/2.0/clusters/list" \
  -H "Authorization: Bearer $DATABRICKS_TOKEN" \
  > /dev/null 2>&1

# Check if the connection to Databricks is successful
if [[ $? -eq 0 ]]; then
  echo "Successfully connected to Databricks!"
else
  echo "Failed to connect to Databricks."
  exit 1
fi
