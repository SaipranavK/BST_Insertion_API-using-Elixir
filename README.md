# Motorola Student Worker Challenge
[![Build Status](https://travis-ci.com/SaipranavK/motorola-student-worker-challenge.svg?token=yuqgzcJWYEqqx9oxnxVc&branch=master)](https://travis-ci.com/github/SaipranavK/motorola-student-worker-challenge)

This repository is the solution for programming test for the role of Student Worker - Software Engineer, Motorola Solutions, Denmark.

The following challenges are addressed in the build:

1. Setting up a repository on Github that automatically runs tests for every time you push
e.g. with Travis-CI
2. Implementing the binary search tree insert operation in the language of your choice (at
Motorola we use the language Elixir a lot)
3. Optional challenge: implement a REST API for the insert operation. If you choose Elixir
as your programming language, use Plug.
4. Optional challenge: dockerize your application, deploy on Kubernetes and set-up
ingress. You can use a free service such as e.g. kubesail.com.

This build is a REST API implementation of Binary Search Tree (BST) insertion opertation using Elixir and Plug dockerized and deployed with kubernetes on KubeSail available at <br> https://binary-search-tree.saipranavk.usw1.kubesail.org/ 

GitHub checks are powered by Travis-CI and the results of the every commit on the repository can be seen at https://travis-ci.com/github/SaipranavK/motorola-student-worker-challenge


##Usage
**The docker image build can be pulled using the command:**
```
docker pull saipranavk/binary-search-tree 
```
available on DockerHub at https://hub.docker.com/r/saipranavk/binary-search-tree or 

**To run the docker image use command:**
```
docker run saipranavk/binary-search-tree 
```

or you can directly access the API at https://binary-search-tree.saipranavk.usw1.kubesail.org/
<br>Following are the Endpoints available in the API

1. **GET: "/"** - Generic test route to check if the server is running
<br>**Response:** "Binary Search Tree REST API" with status code 200

2. **POST: "/insert"** - Route to create tree/ add new node
<br>**Payload:** { tree: tree, n: n } where, n is the value to be added. To create a new tree pass tree: null/nil.
<br>**Response**: tree with status code 200

Sample POSTMAN request are attached below for reference: 

To create a new tree with n as root element

<img src="public/bst-api-response-2.png">

To add a new element to an exisiting tree

<img src="public/bst-api-response.png">

n must be an interger. Invalid key value pair of n will return with response

<img src="public/bst-api-response-retry.png">

<img src="public/bst-api-response-retry-2.png">

Invalid payload will return

<img src="public/bst-api-response-err.png">

---

**Author :** Saipranav Koyyada (ksaipranav@gmail.com)

https://www.linkedin.com/in/saipranavkoyyada/ 

Please feel free to contact for any queries or feedback.



