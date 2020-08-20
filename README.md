# Binary Search Tree
[![Build Status](https://travis-ci.com/SaipranavK/motorola-student-worker-challenge.svg?token=yuqgzcJWYEqqx9oxnxVc&branch=bst-rest)](https://travis-ci.com/github/SaipranavK/motorola-student-worker-challenge)

<b>IMPORTANT: THIS IS NOT THE FINAL SUBMISSION</b>

This repository is the solution for test to be completed as part of the first stage of the recruitment process for the role - Student Worker - Software Engineer, Motorola Solutions, Denmark.

## Usage

```
# clone the repo
<path> git clone https://github.com/SaipranavK/motorola-student-worker-challenge.git

# get dependencies
<path>/motorola-student-worker-challenge>mix deps.get

# code interaction with iex shell
<path>/motorola-student-worker-challenge>iex -S mix

# send request
tree = nil
n = 3
url = "localhost:8080/insert"
body = Poison.encode!(%{"value" => n, "tree" => tree})
headers = [{"content-type", "application/json"}]
{:ok, resp} = HTTPoison.post(url, body, headers, [])

```

## Run Tests

```
<path>/motorola-student-worker-challenge>mix test test/bst_test.exs
```

### Todo
- [ ] REST API for the insert operation using Plug.
- [ ] Dockerize and Deploy.
