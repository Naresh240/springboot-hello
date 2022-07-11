# spring-boot-hello
## Pre-requisites:
  - Github Account
  - CircleCI Account
  - ECR Account under AWS
## Integrate Github account with Circle CI and project

![image](https://user-images.githubusercontent.com/58024415/178236237-6a4342d3-ec48-4c2d-b2e8-f2429d55b395.png)

## Create Context and Environment Variables under CircleCI at below path
```Create Context```
    
```bash
Organization Settings --> contexts --> create context
```

![image](https://user-images.githubusercontent.com/58024415/178236774-ba75aaf7-79a9-4f10-86ac-b8f688efdf79.png)
    
```Create Environment Variable```

![image](https://user-images.githubusercontent.com/58024415/178237268-7a315f4d-a257-4477-8fe0-a34fb57babf2.png)


## Written circleci pipeline with file name as ```.circleci/config.yml```

## Check pipeline under repo

![image](https://user-images.githubusercontent.com/58024415/178237419-9b5f9da7-c2eb-4554-a6d1-bdd9f40dd72e.png)

## Check Image under ECR

![image](https://user-images.githubusercontent.com/58024415/178237478-ba986ef8-6c35-4b82-b9cd-4d17753c1683.png)
