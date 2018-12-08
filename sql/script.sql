create database db_agendaVraptor;


CREATE TABLE tb_agenda
(
 
 id_agenda         INT AUTO_INCREMENT PRIMARY KEY,
 ds_nome           VARCHAR(100) NOT NULL,
 fl_whatsapp      CHAR(1)        NOT NULL,  
 fl_tipoTelefone  CHAR(1)        NOT NULL,  
 nr_telefone      BIGINT         NOT NULL,  
 ds_email          VARCHAR(100) NOT NULL,
 fl_tipoContato   CHAR(1)        NOT NULL  
 

);
