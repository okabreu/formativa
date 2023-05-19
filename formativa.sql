create database hogwartsschool;
use hogwartsschool;

create table ocupacoes(
	id bigint not null auto_increment,
    nomeOcupacao varchar(100) not null,
    primary key(id)
);

create table usuario(
	id bigint not null auto_increment,
    nomeUsuario varchar(100) not null,
    email varchar(100) not null,
    cpf varchar(13) not null,
    dataNasc datetime not null,
    ocupacao bigint not null,
    status enum ("ativo", "não ativo") not null,
    foreign key(ocupacao) references ocupacoes(id),
    primary key(id)
);

create table gestor(
	id bigint not null auto_increment,
    nomeGestor varchar(100) not null,
    email varchar(100) not null,
    cpf varchar(13) unique not null,
    dataNasc datetime not null,
    ocupacao bigint not null,
    foreign key(ocupacao) references ocupacoes(id),
    primary key(id)
);

create table admin(
	id bigint not null auto_increment,
    nomeAdmin varchar(50) not null,
    email varchar(100) not null,
    cpf varchar(13) unique not null,
    dataNasc date not null,
    ocupacao bigint not null,
    primary key(id)
);

create table locais(
	id bigint not null auto_increment,
    nomeLocal varchar(100) not null,
    bloco varchar(1) not null,
    qtdPessoas numeric(10) not null,
    descricao text not null,
    primary key(id)
);

create table eventos(
	id bigint not null auto_increment,
    nomeEvento varchar(150) not null,
    dataEvento datetime not null,
    localEvento bigint not null,
    foreign key(localEvento) references locais(id),
    nomeResponsavel varchar(100) not null,
    respUsuario bigint,
    respGestor bigint,
    respAdmin bigint,
    foreign key(respUsuario) references usuario(id),
    foreign key(respGestor) references gestor(id),
    foreign key(respAdmin) references admin(id),
    primary key(id)
);

create table visistante(
	id bigint not null auto_increment,
    nomeVisistante varchar(100) not null,
    email varchar(100) not null,
    cpf varchar(13) not null,
    eventoInscrito bigint not null,
    foreign key(eventoInscrito) references eventos(id),
    primary key(id)
);

create table checkin(
	ticket bigint not null auto_increment,
    usuario bigint not null,
    foreign key(usuario) references usuario(id),
    evento bigint not null,
    foreign key(evento) references eventos(id),
    primary key(ticket)
);

insert into ocupacoes(nomeOcupacao) values("secretária"),("diretor"),("coordenador"),("professor"),("gerente");
select * from ocupacoes;

insert into usuario(nomeUsuario,email,cpf,dataNasc,ocupacao)values("Alexandre Costa","alexandre123@gamil.com","109786456-12","1990-03-17",4),
																  ("Vitor Pereira","vitor123@gamil.com","456786987-14","1990-08-9",4),
                                                                  ("Paula Lovato","paula123@gmail.com","297487012-67","1997-11-11",1),
                                                                  ("Hugo Idagawa","hugo123@gmail.com","087456198-10","1989-04-30",5),
                                                                  ("Daniel Oliveira","daniel123@gmail.com","710492334-12","1995-02-28",2);
select * from usuario;                                                                  



