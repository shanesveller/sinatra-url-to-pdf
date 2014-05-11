# Usage

```shell
docker run -d -p $PUBLIC_PORT:4567 shanesveller/url-to-pdf
curl http://localhost:$PUBLIC_PORT/pdf?url=$ESCAPED_URL
```
