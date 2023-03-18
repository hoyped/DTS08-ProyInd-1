from fastapi import FastAPI
import pandas as pd

app = FastAPI(  title='Sistema de información plataformas de streaming',
                description='Bienvenido a tu sistema de consulta. Para una experiencia superior por favor toma en cuenta: Amazon = a; Disney = d; Hulu = h, Netflix = n ¡¡GRACIAS!!')

platforms = pd.read_csv('platforms.csv', sep=';')


#fastapi-env\Scripts\activate.bat
#uvicorn main:app --reload
#http://127.0.0.1:8000

@app.get("/")
def welcome():
    return  "Realiza tu consulta"


@app.get("/may_duración/{year}/{platform}/{duration_type}")
def get_max_duration(year:int, platform:str, duration_type:str):
    film_time = []
    film_name = []
    for k, l in enumerate (platforms['release_year']):
        if l == year:
            if platforms['show_id'][k][0] == platform:
                if platforms['duration_type'][k] == duration_type:
                    film_time.append(int(platforms['duration_int'][k]))
                    film_name.append(k)
                    maximo = max(film_time)
                    film = film_time.index(maximo)
                    nom_sho = platforms['title'][film_name[film]]
    return nom_sho


@app.get("/pel_por_score/{platform}/{scored}/{year}")
def get_score_count(platform:str, scored:float, year:int):
    max_score = 0
    for m, n in enumerate(platforms['release_year']):
        if n == year:
            if platforms['show_id'][m][0] == platform:
                if platforms['score'][m] > scored:
                    max_score += 1
    return (max_score)


@app.get("/pel_por_platf/{platform}")
def get_count_platform(platform:str):
    pltf_films = 0
    for o, p in enumerate(platforms['show_id']):
        if platforms['show_id'][o][0] == platform:
            pltf_films +=1
    return pltf_films


@app.get("/act_por_platf/{platform}/{year}")
def get_actor(platform:str, year:int):
    actors1 = []
    actors2 = []
    conta = 0
    if platform == "h":
        return("No está disponible la información de reparto en el momento. Por favor discúlpenos")
    for q, r in enumerate (platforms['release_year']):
        if r == year:
            if platforms['show_id'][q][0] == platform:
                actors1.append(platforms['cast'][q])
    for s, t in enumerate (actors1):
        if type(t) == str:
            actors1[s] = t.split(", ")
    for t in actors1:
        if type(t) == list:
            actors2.append(t)
    actors3 = [elem for sub in actors2 for elem in sub]
    for u, v in enumerate (actors3):
        if actors3.count(v) > conta:
            conta = actors3.count(v)
            d = actors3[u]
    return d