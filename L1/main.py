from fastapi import FastAPI, Request, status
from pydantic import BaseModel
from typing import Optional
import pyjokes

app = FastAPI()
class Joke(BaseModel):
    friend: str
    joke: str

class JokeInput(BaseModel):
    friend: str

@app.post("/", response_model=Joke)
def create_joke(joke_input: JokeInput):
    """Создание шутки"""
    return Joke(friend=joke_input.friend, joke=pyjokes.get_joke())

# Роут для получения шутки от друга
@app.get("/{friend}")
def friends_joke(friend: str):
    return friend + " tells his joke: " + pyjokes.get_joke()

# Роут для получения нескольких шуток от друга
@app.get("/multi/{friend}")
def multi_friends_joke(friend: str, jokes_number: int):
    result = ""
    for i in range(jokes_number):
        result += friend + f" tells his joke #{i + 1}: " + pyjokes.get_joke() + " "
    return result

class Article(BaseModel):
    title: str


@app.get("/from_path/{equation}")
def search_by_path(request: Request, equation: str):
    
    for equation in equation.split():
        if equation != "":
            try:
                equation = equation.replace(':', '/')
                data = eval(equation)
            except:
                data = "ошибка в математическом выражении!"
                return data, status.HTTP_400_BAD_REQUEST
            return data, status.HTTP_200_OK

    return status.HTTP_500_INTERNAL_SERVER_ERROR

if __name__ == '__main__':
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port="8001")