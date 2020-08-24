# Lambda Docker Container

```bash
docker run --rm -d \
  -e DOCKER_LAMBDA_STAY_OPEN=1 \
  -p 9001:9001 \
  -v $PWD:/var/task:ro,delegated \
  lambci/lambda:go1.x \
  main
```

Run that in the code directory where the binary for the lambda you are executing exists.  This will start up a local webserver in the same manner that AWS will run your lambda in.  The lambda can now be invoked locally using

```bash
aws lambda invoke --endpoint http://localhost:9001 --no-sign-request \
  --function-name myfunction --payload '{}' output.json
```

or

```bash
curl -d '{}' http://localhost:9001/2015-03-31/functions/myfunction/invocations
```

The label of the docker image is lambda runtime that is to be used and the handler is what is set as the handler when createing a lambda.  In the above example they are `go1.x` and `main` respectively.