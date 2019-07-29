[![Build Status](https://travis-ci.com/TTitcombe/docker_openai_gym.svg?branch=master)](https://travis-ci.com/TTitcombe/docker_openai_gym)
# OpenAI gym Docker Image

This Docker image comes with openai and pytorch-cpu. This allows users to start working on reinforcement learning in a couple of easy steps.

This image is particularly ideal for Windows users, for whom openai gym is not easily installed.

Current features:
* cpu enabled pytorch
* classic control gym environments

To be developed:
* environment rendering
* box2d environments
* cpu enabled tensorflow

## How to use
1. Clone the repo
2. Navigate to your local copy of the repo and build the image: `docker build --tag=image_name .`
3. Launch the container: `docker run -it -d --name=container_name image_name`
4. Use the container: `docker exec -it container_name /bin/bash`. This should enter the terminal of the container
5. Check that it's working: enter a python interpreter and run
```python
import gym
import torch

env = gym.make("CartPole-v1")
```