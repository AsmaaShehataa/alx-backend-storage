#!/usr/bin/env python3
"""Python function that changes all topics of a school"""


def update_topics(mongo_collection, name, topics):
    """Function that changes all topics of a school"""
    mongo_collection.update_many({"name": name}, {"$set": {"topics": topics}})
