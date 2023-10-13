# DCE Docker Build (Beta)

This project was forked from Parth Pratim Chatterjee's **Google Summer of Code 2021** for the project **Direct Code Execution Modernization**.

The image is designed to work with the
[Linux TCP Prague kernel (5.10.47](https://github.com/L4STeam/linux) kernel.

## Build Steps

```
git clone https://github.com/tomhenderson/dce-docker-beta.git
cd dce-docker-beta
sudo docker-compose up -d
sudo docker exec -it ns-3-dce /bin/bash
cd /home/bake 
git init
git remote add origin https://gitlab.com/tomhenderson/bake.git
git fetch origin
git checkout dce-docker-beta
./bake.py configure -e dce-linux-docker-prague 
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
./bake.py configure -e glibc-2.31 -e dce-linux-docker-prague
```

