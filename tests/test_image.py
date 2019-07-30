import gym
import torch
import os
import shutil
import unittest


class TestImage(unittest.TestCase):
    def test_can_make_CartPole_env(self):
        gym.make("CartPole-v1")

    def test_can_make_LunarLander_env(self):
        gym.make("LunarLander-v2")

    def test_can_record_video(self):
        """Test that pyglet has been set up correctly by default"""
        file_path = os.path.join("/tmp/video")
        env_to_wrap = gym.make("CartPole-v1")
        env = gym.wrappers.Monitor(env_to_wrap, file_path)
        env.reset()  # Reset the env
        env.step(0)  # Make one action
        env.close()
        env_to_wrap.close()

        # Clean up
        shutil.rmtree(file_path)


if __name__ == "__main__":
    unittest.main()
