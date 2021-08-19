# DCE Docker Build (Beta)

This project was made as a part of **Google Summer of Code 2021** for the project **Direct Code Execution Modernization**

## Build Steps

```
git clone https://github.com/ParthPratim/dce-docker-beta.git
cd dce-docker-beta
sudo docker-compose up -d
sudo docker run -it ns-3-dce /bin/bash
cd /home/bake 
git init
git remote add origin https://gitlab.com/ParthPratim1/bake.git
git fetch origin
git checkout docker
./bake.py configure -e dce-linux-dev 
./bake.py download
./bake.py build
cd source/ns-3-dce
./test.py
```
For exiting the environment:
```
exit
sudo docker-compose down
```

The same bake branch could be run on native Ubuntu-20.04 as well, with a different bake configure :
```
./bake.py configure -e glibc-2.31 -e dce-linux-dev 
```

The commits which implement this can be found in my bake branch.

Development branches : 
* Bake : https://gitlab.com/ParthPratim1/bake/-/tree/docker
* ns-3-dce : https://github.com/ParthPratim/ns-3-dce/tree/docker
