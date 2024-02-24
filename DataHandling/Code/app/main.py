from typing import Union
import json
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class Item(BaseModel):
    recid: str
    dateposted: str
    firstname: str
    lastname: str
    currentage: str
    datemissing: str
    missingcity: str
    missingstate: str
    contact: str
    photolink: str


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}

@app.post("/addData/")
async def addData(item: Item):
    # Save the data to a file
    with open('DataHandling/Code/app', 'w') as file:
        json.dump(item.model_dump(), file)
        file.write('\n')
    
    return item