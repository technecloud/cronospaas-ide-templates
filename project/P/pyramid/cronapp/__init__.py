from pyramid.config import Configurator
from wsgiref.simple_server import make_server
from pyramid.response import Response


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    config = Configurator(settings=settings)
    config.include('pyramid_jinja2')
    config.add_static_view('static', 'static', cache_max_age=3600)
    config.add_route('home', '/')
    config.scan()
    app = config.make_wsgi_app()
    server = make_server('0.0.0.0', 8180, app)
    server.serve_forever()
    return config.make_wsgi_app()
