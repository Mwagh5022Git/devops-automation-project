#!/bin/bash

echo "========== Start Destroy Tools  =========="
chmod +x destroy.sh && ./destroy.sh
echo "========== Start Cleanup Tools =========="
chmod +x cleanup.sh && ./cleanup.sh
echo "========== Start AWS-Auto-Cleanup Tools =========="
chmod +x aws-auto-cleanup.sh && ./aws-auto-cleanup.sh
echo "================== All Done ================="
