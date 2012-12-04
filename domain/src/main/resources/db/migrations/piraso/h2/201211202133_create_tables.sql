create table account (
  id bigint not null auto_increment,
  created_by varchar(64) not null,
  created_time datetime not null,
  last_updated_by varchar(64) not null,
  last_updated_time datetime not null,
  version int default 0,
  activation_code varchar(50) not null,
  activation_time datetime,
  description text,
  name varchar(50) not null,
  session_id varchar(255) not null,
  status varchar(10) not null,
  UNIQUE KEY uk_account_rule_session_id_and_name (session_id, name),
  primary key (id));