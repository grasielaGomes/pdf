import os
from langfuse import Langfuse

langfuse = Langfuse(
  secret_key=os.environ["LANGFUSE_SECRET_KEY"],
  public_key=os.environ["LANGFUSE_PUBLIC_KEY"],
  host="https://cloud.langfuse.com"
)