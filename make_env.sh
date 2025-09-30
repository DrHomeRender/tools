#!/bin/bash
# 가상환경 생성 및 기본 패키지 설치 스크립트
# 사용법: ./create_env.sh myenv python3.10

# 첫 번째 인자: 가상환경 이름
ENV_NAME=$1
# 두 번째 인자: 사용할 파이썬 버전 (기본값 python3)
PYTHON_BIN=${2:-python3}

if [ -z "$ENV_NAME" ]; then
  echo "사용법: $0 <env_name> [python_version]"
  exit 1
fi

# 가상환경 생성
$PYTHON_BIN -m venv $ENV_NAME

# 활성화 안내
echo "가상환경이 생성되었습니다: $ENV_NAME"
echo "활성화하려면 다음 명령어를 실행하세요:"
echo "source $ENV_NAME/bin/activate"

# 기본 패키지 업그레이드
source $ENV_NAME/bin/activate
pip install --upgrade pip setuptools wheel

# 필수 패키지 예시 (필요 시 수정)
pip install numpy opencv-python torch torchvision

echo "기본 패키지 설치 완료!"
