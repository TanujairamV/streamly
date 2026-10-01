from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

from rag import retrieve_policy
from llm import generate_ai_response


app = FastAPI(
    title="SubClarity AI API",
    description="AI powered subscription explanation service using RAG and LLM",
    version="1.0.0"
)


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class ExplainRequest(BaseModel):
    action: str


class ExplainResponse(BaseModel):
    response: str


@app.get("/")
def home():
    return {
        "status": "SubClarity AI running",
        "service": "RAG + LLM Subscription Assistant"
    }


@app.get("/health")
def health():
    return {
        "status": "healthy"
    }


@app.post(
    "/ai/explain",
    response_model=ExplainResponse
)
def explain(request: ExplainRequest):

    try:
        action = request.action.lower()

        if action not in [
            "pause",
            "cancel",
            "renew"
        ]:
            raise HTTPException(
                status_code=400,
                detail="Invalid action. Use pause, cancel, or renew."
            )


        policy = retrieve_policy(action)

        if not policy:
            raise HTTPException(
                status_code=404,
                detail="Policy document not found."
            )


        response = generate_ai_response(
            policy,
            action
        )


        return {
            "response": response
        }


    except HTTPException:
        raise


    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=str(e)
        )