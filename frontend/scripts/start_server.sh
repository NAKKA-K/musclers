touch .env
echo "FACEBOOK_APP=$FACEBOOK_APP" >> .env
echo "FACEBOOK_SECRET=$FACEBOOK_SECRET" >> .env
npm run build
npm run start