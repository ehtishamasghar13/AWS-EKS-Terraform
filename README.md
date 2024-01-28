# Go To Do App

This a 3 tier **To-Do List** application,  where: 

- Data tier is NoSQL with mongo
- API tier is Golang (exposed to the host on port 8080)
- Frontend tier is React (exposed to the host on port 8081)


# 1. Create CI in Github Actions

- I created a private github repoand clone the above repo beacause forking above repo do not give me permission to make repo private:
- First I create github actions CI which include trigger the actions when a change is detected in "client" & "server" directory. 
- I use github actions "path" parameter to detect latest changes in "client" & "server" directory and trigger CI pipeline accordingly.
- I use the same docker-compose.yaml file to build docker images, login to my dockerhub account by pass credentials in secrets, push docker images to dockerhub.

# 2. Create Kubernetes Manifests from docker-compose.yaml file

- I create secret.yaml file to  
- I create Deployments with their Service of Frontend, API and Database.