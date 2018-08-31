drone-auth-ecr is a docker image that lives in your docker registry that can be pulled to auth against ECR from within drone, 
enabling drone to pull from ECR

The image is about 500M+ size;
## this is copy from [Scott Lackey](https://github.com/scottlackey), and edit on it

### reference:[drone-create-plugins](http://docs.drone.io/creating-custom-plugins-bash/)
This image acts as a liazon between your [drone](http://readme.drone.io/0.5/) instance and [Amazon ECR](https://aws.amazon.com/ecr/). 
It has the AWS ECR client and the docker daemon installed so that it can pull an image from ECR. Since drone shares it's volumes the 
ECR image is available for all build steps.

To build
---------

- Ensure your drone CI node in AWS is configured with an IAM role with permissions to interact with ECR/ECS
- Ensure the config/config file has the correct AWS region.
- build the image with docker build, tag and push

example usage in Drone v.5 pipeline
-------------
```bash
pipeline:
  auth:
    image: drone-auth-ecr
    access_id: ACCESS_ID
    secret_key: SECRET_KEY
    region: ap-northeast-1
    ecr_image: 376045331903.dkr.ecr.ap-northeast-1.amazonaws.com/nginx:alpine-1.15.2
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    # the image will pull on drone-agent and we can use it to build. 
```
