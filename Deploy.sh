# Configuration
IMAGE_NAME="vinod"
IMAGE_TAG="v5"
DOCKER_REGISTRY="vinoddocker2811/docker20_04"
SERVER_USER="ubuntu"
SERVER_DNS="ec2-54-205-121-158.compute-1.amazonaws.com"
SERVER_PATH="/home/ubuntu/docker"
SSH_KEY_PATH="/home/vinod/capstone/devops-build/build/Deploy_key.pem" # Path to your SSH private key

# Build Docker image
#echo "Building Docker image..."
#docker build -t $DOCKER_REGISTRY/$IMAGE_NAME  .

# Push Docker image to registry
echo "Pushing Docker image to registry..."
docker tag  $IMAGE_NAME  $DOCKER_REGISTRY:$IMAGE_TAG
docker push $DOCKER_REGISTRY:$IMAGE_TAG

# Deploy Docker image to the server
echo "Deploying Docker image to server..."

# SSH commands to execute on the server
ssh -i $SSH_KEY_PATH $SERVER_USER@$SERVER_DNS <<EOF
  # Pull the latest Docker image
  echo "Pulling Docker image from registry..."
  docker pull $DOCKER_REGISTRY:$IMAGE_TAG

  # Run the new Docker container
  echo "Running the new Docker container..."
  docker run -d --name $IMAGE_NAME --restart always $DOCKER_REGISTRY:$IMAGE_TAG
  
  echo "Deployment completed successfully!"
EOF

echo "Deployment script completed!"

