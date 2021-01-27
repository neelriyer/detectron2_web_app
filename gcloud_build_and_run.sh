
# adapted from: https://github.com/npatta01/web-deep-learning-classifier/blob/master/docs/2_b_gcloud.md

GCP_PROJECT=balmy-outcome-273800
APP_NAME=neelsmlapp
REGION="us-central1"
MEMORY=2G

# set project to correct one
gcloud config set project $GCP_PROJECT

# build 
gcloud builds submit --tag gcr.io/$GCP_PROJECT/$APP_NAME \
--timeout=82800

# run
gcloud beta run deploy $APP_NAME \
--image gcr.io/$GCP_PROJECT/$APP_NAME \
--region $REGION --memory $MEMORY --allow-unauthenticated

