CREATE TABLE IF NOT EXISTS sync_ts(
 terminalid VARCHAR PRIMARY KEY,
 datemodified TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
 sync_ts BIGINT NOT NULL,
 reboot VARCHAR NOT NULL,
 splash_screen VARCHAR NOT NULL,
 clean_cache VARCHAR NOT NULL,
 block_run VARCHAR NOT NULL,
 extra_options VARCHAR,
 terminal_type VARCHAR NOT NULL,
 platform VARCHAR NOT NULL
);

Alter TABLE sync_ts owner to testuser;

CREATE TABLE IF NOT EXISTS dbversion(
majorversion INTEGER NOT NULL,
minorversion INTEGER NOT NULL,
datemodified TIMESTAMP WITH TIME ZONE NOT NULL,
description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS connection_logs (
  terminalid VARCHAR NOT NULL,
  env VARCHAR,
  update_stage VARCHAR,
  on_boot VARCHAR,
  glue_version VARCHAR,
  config_version VARCHAR,
  block_run VARCHAR,
  run_success BIGINT,
  last_run BIGINT,
  last_run_status VARCHAR,
  failures VARCHAR,
  puppet_ran VARCHAR,
  puppet_exit VARCHAR,
  reboot VARCHAR,
  run_time_seconds INTEGER,
  terminal_type VARCHAR NOT NULL,
  platform VARCHAR NOT NULL,
  datemodified TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);
Alter TABLE connection_logs owner to testuser;

CREATE TABLE IF NOT EXISTS settings (
  concurrency BIGINT NOT NULL,
  concurrency_backoff VARCHAR,
  reboot VARCHAR NOT NULL DEFAULT 'true',
  splash_screen VARCHAR NOT NULL DEFAULT 'true',
  clean_cache VARCHAR NOT NULL DEFAULT 'false',
  block_run VARCHAR NOT NULL DEFAULT 'false'
);
Alter TABLE settings owner to testuser;

CREATE TABLE IF NOT EXISTS  download_status (
  terminalid VARCHAR PRIMARY KEY,
  datemodified TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  ip VARCHAR NOT NULL ,
  status VARCHAR NOT NULL
);
Alter TABLE download_status owner to testuser;

CREATE TABLE IF NOT EXISTS terminal_type_map (
  abrazo_type VARCHAR PRIMARY KEY,
  platform VARCHAR NOT NULL,
  terminal_type VARCHAR NOT NULL
);
Alter TABLE terminal_type_map owner to testuser;

INSERT INTO terminal_type_map (abrazo_type,platform,terminal_type)
  VALUES ('Breeze Performance', 'td_breeze', 'abrazo_terminal'),
  ('Xion Rev 2.0', 'nixdorf_xion', 'abrazo_terminal'),
  ('TD Pulse Ultra', 'td_pulse', 'abrazo_terminal'),
  ('Generic Backoffice', 'debian_backoffice', 'abrazo_backoffice'),
  ('EeeBox EB1012 Backoffice', 'debian_backoffice', 'abrazo_backoffice'),
  ('TD Saturn Backoffice', 'debian_backoffice', 'abrazo_backoffice'),
  ('TD Breeze PGD','td_breeze_pgd','vlt_pgd');

INSERT INTO dbversion (majorversion,minorversion,datemodified,description)
	VALUES (1,0,now(),'Initial database version 1.0');


