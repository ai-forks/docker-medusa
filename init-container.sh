echo "================ init container ======================"

echo "===>install caddy"
dnf install -y 'dnf-command(copr)'
dnf copr -y enable @caddy/caddy
dnf install -y caddy

cd ~/
npm i -g yarn @medusajs/medusa-cli
yum install -y git

echo "===>install server"
cd ~/
git clone https://github.com/ai-forks/medusa-starter-contentful.git backend
cd backend
#cp .env.template .env
node init.env.js
yarn
echo "===>admin user=admin@gm.com, password=123456"
medusa user -e admin@gm.com -p 123456
# cd server && medusa develop -p 80

echo "===>install frontend"
cd ~/
# npx create-next-app -e https://github.com/medusajs/nextjs-starter-medusa frontend
# npx create-next-app -e https://github.com/medusajs/medusa-express-nextjs frontend
npx create-next-app -e https://github.com/ai-forks/medusa-nextjs-starter frontend
# git clone https://github.com/medusajs/medusa-express-nextjs frontend
cd frontend/
cp .env.template .env.local
#yarn
#yarn build
################################################################
