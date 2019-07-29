import gym
import torch
import unittest


class TestImage(unittest.TestCase):
    def test_can_make_CartPole_env(self):
        gym.make("CartPole-v1")

    def xtest_can_make_LunarLander(self):
        gym.make("LunarLander-v0")


if __name__ == "__main__":
    unittest.main()
