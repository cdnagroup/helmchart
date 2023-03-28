# python -m venv ./venv
# ./venv/bin/activate
# pip install -r ./requirements.txt;
# fastapi uvicorn jinja2 pydantic[dotenv] fastapi_sso fastapi_sessions  easy-auth[server]
python pip --version
pip install -r requirements.txt

# ls;
if [ -f "installedPip" ]; then
    echo "requirements has installed"
else
    echo "requirements has installed"
fi;
python main.py
