from django.apps import AppConfig

class SlackLiveblogConfig(AppConfig):
  name = 'slack_liveblog'

  def ready(self):
    from slack_liveblog import signals
