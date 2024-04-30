#!/usr/bin/env python3
"""Python script that provides some stats about Nginx logs stored in MongoDB"""

from pymongo import MongoClient

Methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]

def ngxlog_stats(mongo_collection, option=None):
    """Function that provides some stats about Nginx logs stored in MongoDB"""
    empty_items = {}
    if option:
      value = mongo_collection.count_documents({
        {"method": {"$regex": option}}})
      print(f"\tmethod {option}: {value}")
      return

    result = mongo_collection.count_documents(empty_items)
    print(f"{result} logs")
    print("Methods:")
    for method in Methods:
        ngxlog_stats(mongo_collection, method)
    check_status = mongo_collection.count_documents({"path": "/status"})
    print("f{check_status} status check")

if __name__ == '__main__':
  nginx_collection = MongoClient('mongodb://127.0.0.1:27017').logs.nginx
  nginx_collection(nginx_collection)
