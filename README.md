# GCP Project IAM 변경 스크립트 

## 오류를 줄이기 위한 2가지 장치 

### FOLDER_ID 

코드에서 Folder ID 를 지정할 수 있다. 해당 폴더 아래 프로젝트 대상으로 실행. 

### 추가먼저 실행 

코드를 보면 IAM Policy를 추가하는 명령과 삭제(gcloud projects add-iam-policy-binding)하는 명령 (gcloud projects remove-iam-policy-binding) 두가지가 있다. 안전한 실행을 위해서 추가하는 명령먼저 실행하고 마지막에 삭제하는 명령을 실행. 

## 코드 내용 

- Parent 밑에 있는 프로젝트 리스트에서 
- role/owner 에 바인딩 되어 있는 ID를 모두 가져와서
- 추가 또는 삭제 한다. 

## 실행방법 (Cloud Shell 에서) 

### 준비
```bash
git clone https://github.com/ilseokoh/gcloud-project-script.git
cd gcloud-project-script
chmod 777 gcp-set-iam.sh
./gcp-set-iam.sh 
```
### 실행 
[Cloud Shell의 에디터](https://cloud.google.com/shell/docs/launching-cloud-shell-editor?hl=ko)를 이용해서 gcp-set-iam.sh 수정 
Bash 에서 코멘트는 # 

```bash
./gcp-set-iam.sh 
```
### 실행결과 

```bash
kevin@cloudshell:~ (cloud-code-123)$ ./gcp-set-iam.sh 
Project: agent-builder-003. --------------
admin@iloh.altostrat.com is agent-builder-033's Owner. Remove Owner role now!
Updated IAM policy for project [agent-builder-033].
Add 'Viewer' role to admin@iloh.altostrat.com in agent-builder-003.
Updated IAM policy for project [agent-builder-033].
Add Custom Role organizations/696914253542/roles/KevinCustomRole to admin@iloh.altostrat.com in agent-builder-003. 
Updated IAM policy for project [agent-builder-033].
Project: gen-ai-99911. --------------
Project: cloud-code-4087. --------------
admin@iloh.altostrat.com is cloud-code-123's Owner. Remove Owner role now!
Updated IAM policy for project [cloud-code-123].
Add 'Viewer' role to admin@iloh.altostrat.com in cloud-code-4087.
Updated IAM policy for project [cloud-code-123].
Add Custom Role organizations/696914253542/roles/KevinCustomRole to admin@iloh.altostrat.com in cloud-code-4087. 
Updated IAM policy for project [cloud-code-123].
```
