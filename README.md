다음은 GitHub에서 바로 사용할 수 있도록 README.md 파일 내용입니다.
코드를 복사하여 README.md 파일로 저장하면 됩니다.

# 📖 LangChain with Hugging Face (without OpenAI API)

이 저장소는 [랭체인 LangChain 노트](https://wikidocs.net/250954)를 참고하여, **macOS 환경에서 OpenAI API를 사용하지 않고 Hugging Face 모델을 활용하여 LangChain을 학습**한 내용을 기록합니다.

## 🚀 목표
- OpenAI API 없이 **Hugging Face 모델**을 활용하여 LangChain을 실습
- LangChain의 주요 기능을 macOS에서 실행
- 실제 코드 및 예제 공유

## 📌 환경 설정

- OS : MacOS (MacBook-Air M2 8-core 24GB)
- Python : 3.11.9

### 1. 필수 패키지 설치
아래 명령어를 실행하여 필요한 패키지를 설치합니다.

```bash
pip install -r requirements.txt
```

	❗ Mac 환경에서는 torch 설치 시 MPS(GPU)를 활용하려면 PyTorch 공식 가이드를 참고하세요.

<!-- 2. Hugging Face API 키 설정

Hugging Face Hub에서 API 키를 생성한 후 .env 파일에 저장합니다.

```bash
HUGGINGFACEHUB_API_TOKEN=your_huggingface_api_key
```

또는 Python 코드에서 직접 설정할 수도 있습니다.

```python
import os
os.environ["HUGGINGFACEHUB_API_TOKEN"] = "your_huggingface_api_key"
``` -->

<!-- 📚 주요 학습 내용

섹션	내용
1️⃣ LangChain 기본 개념	LangChain의 핵심 개념 정리
2️⃣ 프롬프트 엔지니어링	LangChain에서의 프롬프트 템플릿 활용
3️⃣ LLM 연결 (Hugging Face)	transformers 라이브러리를 이용하여 LLM 실행
4️⃣ 문서 로딩 및 검색	LangChain의 DocumentLoader, VectorStore 활용
5️⃣ 체인(Chain) 사용법	LangChain에서 여러 컴포넌트 연결하기
6️⃣ Hugging Face Embeddings	sentence-transformers를 사용한 임베딩 생성
7️⃣ 질의응답 시스템 구축	RAG(Retrieval-Augmented Generation) 구현 -->

📌 참고 자료 </br>
	•	[LangChain 공식 문서](https://wikidocs.net/250954) </br>
	•	[Hugging Face](https://huggingface.co/) </br>

🪪 라이선스 </br>
	•	원문(위키독스) 내용은 CC BY-NC-SA 2.0 KR 라이선스를 따릅니다(자세한 내용은 [링크](https://wikidocs.net/250954) 참고). </br>
	•	본 저장소 역시 별도의 명시가 없는 한 동일한 라이선스 정책을 따릅니다. </br>

📢 업데이트 내역 </br>
	•	2025-01: 프로젝트 시작 및 초기 실습 코드 추가