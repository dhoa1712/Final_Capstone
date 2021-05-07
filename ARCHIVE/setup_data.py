import pandas as pd
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine
from config import username, password

##connect to mysql database:
engine = create_engine(f'mysql+pymysql://{username}:{password}@localhost/world_vaccinations')

#reading csv files:
df = pd.read_csv('country_vaccinations.csv')

#loading dataframe to mysql database:
df.to_sql('country_vaccinations',engine,if_exists='append',index=False)