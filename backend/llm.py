import os
from dotenv import load_dotenv
from groq import Groq


load_dotenv()


client = Groq(
    api_key=os.getenv("GROQ_API_KEY")
)


def generate_ai_response(policy, action):

    prompt = f"""

You are SubClarity AI.

You explain subscription actions before users confirm them.

Never perform actions.
Only explain.

User subscription:

Plan: Premium
Price: ₹499/month
Status: Active
Next billing: 15 October 2026


Requested action:

{action}


Relevant company policy:

{policy}


Generate a short clear explanation.

Mention:
- What will happen
- Billing impact
- Difference between pause and cancel if relevant

End with:
Source: Subscription Policy v2.1

"""


    response = client.chat.completions.create(

        model="openai/gpt-oss-20b",
        messages=[
            {
                "role": "user",
                "content": prompt
            }
        ],

        temperature=0.3
    )


    return response.choices[0].message.content