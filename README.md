# GCP Project IAM 변경 스크립트 

## 오류를 줄이기 위한 2가지 장치 

### PARENT_ID 

코드에서 PARETN_ID는 Folder ID 또는 Organization ID가 될 수 있다. ORG_ID 를 넣으면 전체 프로젝트 대상이고 Folder ID를 넣으면 해당 폴더 아래 프로젝트 대상 

### 추가먼저 실행 

코드를 보면 IAM Policy를 추가하는 명령과 삭제(gcloud projects add-iam-policy-binding)하는 명령 (gcloud projects remove-iam-policy-binding) 두가지가 있다. 안전한 실행을 위해서 추가하는 명령먼저 실행하고 마지막에 삭제하는 명령을 실행. 

## 코드 내용 

- Parent 밑에 있는 프로젝트 리스트에서 
- role/owner 에 바인딩 되어 있는 ID를 모두 가져와서
- 추가 또는 삭제 한다. 
