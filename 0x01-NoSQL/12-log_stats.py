#!/usr/bin/env python3
"""Python script that provides some stats about Nginx logs stored in MongoDB"""

from pymongo import MongoClient

Methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]

def ngxlog_stats(mongo_collection, option=None):
    """Function that provides some stats about Nginx logs stored in MongoDB"""
    if option is None:
        return mongo_collection.count_documents({})
    if option == "method":
        return {method: mongo_collection.count_documents({"method": method}) for method in Methods}
    return None
