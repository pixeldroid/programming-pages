require 'fileutils'

# define these three constants before loading the programming-pages rake tasks
PROJECT_ROOT = File.dirname(__FILE__)
DOC_TEMPLATE_DIR = File.join(PROJECT_ROOT, '<your-doc-template>')
DOC_SOURCE_DIR = File.join(PROJECT_ROOT, '<your-doc-source>')
# load the programming pages rake tasks
load File.join(File.join(DOC_TEMPLATE_DIR, '_tasks'), 'programming-pages.rake')
