from fastapi import FastAPI
from pydantic import BaseModel
from typing import List

app = FastAPI()

class MissingPerson(BaseModel):
    recid: int
    dateposted: str
    firstname: str
    lastname: str
    currentage: int
    datemissing: int
    missingcity: str
    missingstate: str
    contact: str
    photolink: str

class XmlSchema(BaseModel):
    name: str
    xml: str

class MissingRequest(BaseModel):
    print("Starting to parsedata")
    XmlSchema: XmlSchema
    xmlSchema: str
    Row: List[dict]

def parse_line(line: str) -> dict:
    # Extracting the inner JSON string
    inner_json_str = line.split('{"line": ')[-1].strip('",')

    # Removing unnecessary characters
    cleaned_line = inner_json_str.replace("\\", "").replace("\"", "").strip("{}")

    # Splitting the cleaned data into key-value pairs
    key_value_pairs = [pair.strip() for pair in cleaned_line.split(",")]

    # Creating a dictionary from key-value pairs
    data_dict = {}
    for pair in key_value_pairs:
        key, value = pair.split(":", 1)
        data_dict[key.strip()] = value.strip()

    return data_dict

@app.post("/missing")
async def missing(missing_request: MissingRequest):
    missing_persons = []

    for row in missing_request.Row:
        # Extracting and parsing the "line" field
        data_dict = parse_line(row["line"])
        print("Finished parsing data")


        # Creating a MissingPerson object
        missing_person = MissingPerson(**data_dict)
        missing_persons.append(missing_person)

    return {"missing_persons": missing_persons}
