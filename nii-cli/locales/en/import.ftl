description = Imports translations from various sources into your locales directory
sources     = List of sources to import messages from (path to file, directory, or a URL)
structure   = Directory structure to assume for source directories
path        = Directory to import messages into (default can be overridden via $NII_PATH)
force       = Whether or not to override existing files

example =
  config/locales -s i18n # Imports all messages from config/locales direcotry.
  en.yml de.yml          # Imports messages defined in en.yml and de.yml.
