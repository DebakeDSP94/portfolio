max_threads = Integer(ENV.fetch("RAILS_MAX_THREADS", 5))
threads max_threads, max_threads

port ENV.fetch("PORT", 3000)
environment ENV.fetch("RAILS_ENV", "development")

workers Integer(ENV.fetch("WEB_CONCURRENCY", 2))

preload_app!

plugin :tmp_restart
