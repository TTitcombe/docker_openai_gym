[![Build Status](https://travis-ci.com/TTitcombe/docker_openai_gym.svg?branch=master)](https://travis-ci.com/TTitcombe/docker_openai_gym)
# OpenAI gym Docker Image

This Docker image comes with openai and pytorch-cpu. This allows users to start working on reinforcement learning in a couple of easy steps.

This image is particularly ideal for Windows users, for whom openai gym is not easily installed.

Current features:
* cpu enabled pytorch
* classic control gym environments
* box2d environments
* Recording of environments

To be developed:
* Automated environment recording (no manual command entry)
* environment rendering
* Atari environments
* cpu enabled tensorflow

## How to use
1. Clone the repo
2. Navigate to your local copy of the repo and build the image: `docker build --tag=image_name .`
3. Launch the container: `docker run -it --name=container_name image_name python`. This should enter the python interpreter.
4. Before entering the python interpreter, a script to attach the graphical display should have been run. To test this, try recording an environment:
```python
import gym
import torch

env_to_wrap = gym.make("CartPole-v1")
env = gym.wrappers.Monitor(env_to_wrap, "someDir")
frame = env.reset()
``` 
If this doesn't throw an error, then congratulations, you can record OpenAI gym!

If you want to re-enter the container and record, you can run `/usr/local/bin/startup_script.py`, as the `CMD`, 
e.g. `docker exec -it container_name /usr/local/bin/startup_script.py`. This should enter a bash script.  
Alternatively, you can open a bash script and run it from there. 

If you want to re-enter the container, record, AND run something, try
`/usr/local/bin/startup_script.py "python /path/to/my/file.py"` as your `CMD`.

If you don't care about recording, use `/bin/bash` to enter bash or `python` to enter the python interpreter.