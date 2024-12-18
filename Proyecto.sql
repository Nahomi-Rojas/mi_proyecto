PGDMP  $    *                |            Poyecto    14.13    16.4 6    '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            *           1262    16394    Poyecto    DATABASE     ~   CREATE DATABASE "Poyecto" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Bolivia.1252';
    DROP DATABASE "Poyecto";
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            +           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    32806    cuestionario    TABLE     �   CREATE TABLE public.cuestionario (
    id_cuestionario integer NOT NULL,
    id_paciente integer,
    fecha_cuestionario date NOT NULL,
    respuesta1 text,
    respuesta2 text,
    respuesta3 text,
    respuesta4 text,
    observaciones_paciente text
);
     DROP TABLE public.cuestionario;
       public         heap    postgres    false    4            �            1259    32805     cuestionario_id_cuestionario_seq    SEQUENCE     �   CREATE SEQUENCE public.cuestionario_id_cuestionario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.cuestionario_id_cuestionario_seq;
       public          postgres    false    4    216            ,           0    0     cuestionario_id_cuestionario_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.cuestionario_id_cuestionario_seq OWNED BY public.cuestionario.id_cuestionario;
          public          postgres    false    215            �            1259    32792    diagnostico    TABLE     �   CREATE TABLE public.diagnostico (
    id_diagnostico integer NOT NULL,
    id_imagen integer,
    diagnostico text NOT NULL,
    grado character varying(50),
    observaciones text,
    fecha_diagnostico date NOT NULL
);
    DROP TABLE public.diagnostico;
       public         heap    postgres    false    4            �            1259    32791    diagnostico_id_diagnostico_seq    SEQUENCE     �   CREATE SEQUENCE public.diagnostico_id_diagnostico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.diagnostico_id_diagnostico_seq;
       public          postgres    false    214    4            -           0    0    diagnostico_id_diagnostico_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.diagnostico_id_diagnostico_seq OWNED BY public.diagnostico.id_diagnostico;
          public          postgres    false    213            �            1259    32778    imagenes    TABLE     �   CREATE TABLE public.imagenes (
    id_imagen integer NOT NULL,
    id_paciente integer,
    imagen_url text NOT NULL,
    tipo_imagen character varying(50),
    fecha_imagen date NOT NULL,
    resultado_analisis text
);
    DROP TABLE public.imagenes;
       public         heap    postgres    false    4            �            1259    32777    imagenes_id_imagen_seq    SEQUENCE     �   CREATE SEQUENCE public.imagenes_id_imagen_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.imagenes_id_imagen_seq;
       public          postgres    false    212    4            .           0    0    imagenes_id_imagen_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.imagenes_id_imagen_seq OWNED BY public.imagenes.id_imagen;
          public          postgres    false    211            �            1259    32769 	   pacientes    TABLE     �   CREATE TABLE public.pacientes (
    id_paciente integer NOT NULL,
    nombre character varying(100) NOT NULL,
    edad integer,
    genero character varying(10),
    fecha_reporte date NOT NULL,
    historial_clinico text
);
    DROP TABLE public.pacientes;
       public         heap    postgres    false    4            �            1259    32768    pacientes_id_paciente_seq    SEQUENCE     �   CREATE SEQUENCE public.pacientes_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pacientes_id_paciente_seq;
       public          postgres    false    210    4            /           0    0    pacientes_id_paciente_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.pacientes_id_paciente_seq OWNED BY public.pacientes.id_paciente;
          public          postgres    false    209            �            1259    32829    sesiones    TABLE     �   CREATE TABLE public.sesiones (
    id_sesion integer NOT NULL,
    id_usuario integer,
    id_paciente integer,
    fecha_sesion date NOT NULL,
    detalles_sesion text
);
    DROP TABLE public.sesiones;
       public         heap    postgres    false    4            �            1259    32828    sesiones_id_sesion_seq    SEQUENCE     �   CREATE SEQUENCE public.sesiones_id_sesion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.sesiones_id_sesion_seq;
       public          postgres    false    220    4            0           0    0    sesiones_id_sesion_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.sesiones_id_sesion_seq OWNED BY public.sesiones.id_sesion;
          public          postgres    false    219            �            1259    32820    usuarios    TABLE       CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre_usuario character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    rol character varying(50) NOT NULL,
    fecha_registro date NOT NULL,
    contrasena character varying(100) NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false    4            �            1259    32819    usuarios_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_id_usuario_seq;
       public          postgres    false    4    218            1           0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;
          public          postgres    false    217            x           2604    32809    cuestionario id_cuestionario    DEFAULT     �   ALTER TABLE ONLY public.cuestionario ALTER COLUMN id_cuestionario SET DEFAULT nextval('public.cuestionario_id_cuestionario_seq'::regclass);
 K   ALTER TABLE public.cuestionario ALTER COLUMN id_cuestionario DROP DEFAULT;
       public          postgres    false    215    216    216            w           2604    32795    diagnostico id_diagnostico    DEFAULT     �   ALTER TABLE ONLY public.diagnostico ALTER COLUMN id_diagnostico SET DEFAULT nextval('public.diagnostico_id_diagnostico_seq'::regclass);
 I   ALTER TABLE public.diagnostico ALTER COLUMN id_diagnostico DROP DEFAULT;
       public          postgres    false    213    214    214            v           2604    32781    imagenes id_imagen    DEFAULT     x   ALTER TABLE ONLY public.imagenes ALTER COLUMN id_imagen SET DEFAULT nextval('public.imagenes_id_imagen_seq'::regclass);
 A   ALTER TABLE public.imagenes ALTER COLUMN id_imagen DROP DEFAULT;
       public          postgres    false    212    211    212            u           2604    32772    pacientes id_paciente    DEFAULT     ~   ALTER TABLE ONLY public.pacientes ALTER COLUMN id_paciente SET DEFAULT nextval('public.pacientes_id_paciente_seq'::regclass);
 D   ALTER TABLE public.pacientes ALTER COLUMN id_paciente DROP DEFAULT;
       public          postgres    false    210    209    210            z           2604    32832    sesiones id_sesion    DEFAULT     x   ALTER TABLE ONLY public.sesiones ALTER COLUMN id_sesion SET DEFAULT nextval('public.sesiones_id_sesion_seq'::regclass);
 A   ALTER TABLE public.sesiones ALTER COLUMN id_sesion DROP DEFAULT;
       public          postgres    false    220    219    220            y           2604    32823    usuarios id_usuario    DEFAULT     z   ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       public          postgres    false    217    218    218                       0    32806    cuestionario 
   TABLE DATA           �   COPY public.cuestionario (id_cuestionario, id_paciente, fecha_cuestionario, respuesta1, respuesta2, respuesta3, respuesta4, observaciones_paciente) FROM stdin;
    public          postgres    false    216   �A                 0    32792    diagnostico 
   TABLE DATA           v   COPY public.diagnostico (id_diagnostico, id_imagen, diagnostico, grado, observaciones, fecha_diagnostico) FROM stdin;
    public          postgres    false    214   �A                 0    32778    imagenes 
   TABLE DATA           u   COPY public.imagenes (id_imagen, id_paciente, imagen_url, tipo_imagen, fecha_imagen, resultado_analisis) FROM stdin;
    public          postgres    false    212   B                 0    32769 	   pacientes 
   TABLE DATA           h   COPY public.pacientes (id_paciente, nombre, edad, genero, fecha_reporte, historial_clinico) FROM stdin;
    public          postgres    false    210   "B       $          0    32829    sesiones 
   TABLE DATA           e   COPY public.sesiones (id_sesion, id_usuario, id_paciente, fecha_sesion, detalles_sesion) FROM stdin;
    public          postgres    false    220   ?B       "          0    32820    usuarios 
   TABLE DATA           f   COPY public.usuarios (id_usuario, nombre_usuario, email, rol, fecha_registro, contrasena) FROM stdin;
    public          postgres    false    218   \B       2           0    0     cuestionario_id_cuestionario_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.cuestionario_id_cuestionario_seq', 1, false);
          public          postgres    false    215            3           0    0    diagnostico_id_diagnostico_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.diagnostico_id_diagnostico_seq', 1, false);
          public          postgres    false    213            4           0    0    imagenes_id_imagen_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.imagenes_id_imagen_seq', 1, false);
          public          postgres    false    211            5           0    0    pacientes_id_paciente_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.pacientes_id_paciente_seq', 1, false);
          public          postgres    false    209            6           0    0    sesiones_id_sesion_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.sesiones_id_sesion_seq', 1, false);
          public          postgres    false    219            7           0    0    usuarios_id_usuario_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 1, false);
          public          postgres    false    217            �           2606    32813    cuestionario cuestionario_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.cuestionario
    ADD CONSTRAINT cuestionario_pkey PRIMARY KEY (id_cuestionario);
 H   ALTER TABLE ONLY public.cuestionario DROP CONSTRAINT cuestionario_pkey;
       public            postgres    false    216            �           2606    32799    diagnostico diagnostico_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_pkey PRIMARY KEY (id_diagnostico);
 F   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT diagnostico_pkey;
       public            postgres    false    214            ~           2606    32785    imagenes imagenes_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id_imagen);
 @   ALTER TABLE ONLY public.imagenes DROP CONSTRAINT imagenes_pkey;
       public            postgres    false    212            |           2606    32776    pacientes pacientes_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id_paciente);
 B   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_pkey;
       public            postgres    false    210            �           2606    32836    sesiones sesiones_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.sesiones
    ADD CONSTRAINT sesiones_pkey PRIMARY KEY (id_sesion);
 @   ALTER TABLE ONLY public.sesiones DROP CONSTRAINT sesiones_pkey;
       public            postgres    false    220            �           2606    32827    usuarios usuarios_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_email_key;
       public            postgres    false    218            �           2606    32825    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    218            �           2606    32814 *   cuestionario cuestionario_id_paciente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuestionario
    ADD CONSTRAINT cuestionario_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.pacientes(id_paciente) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.cuestionario DROP CONSTRAINT cuestionario_id_paciente_fkey;
       public          postgres    false    216    210    3196            �           2606    32800 &   diagnostico diagnostico_id_imagen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.diagnostico
    ADD CONSTRAINT diagnostico_id_imagen_fkey FOREIGN KEY (id_imagen) REFERENCES public.imagenes(id_imagen) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.diagnostico DROP CONSTRAINT diagnostico_id_imagen_fkey;
       public          postgres    false    212    214    3198            �           2606    32786 "   imagenes imagenes_id_paciente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.pacientes(id_paciente) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.imagenes DROP CONSTRAINT imagenes_id_paciente_fkey;
       public          postgres    false    210    3196    212            �           2606    32842 "   sesiones sesiones_id_paciente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sesiones
    ADD CONSTRAINT sesiones_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.pacientes(id_paciente) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.sesiones DROP CONSTRAINT sesiones_id_paciente_fkey;
       public          postgres    false    220    210    3196            �           2606    32837 !   sesiones sesiones_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sesiones
    ADD CONSTRAINT sesiones_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.sesiones DROP CONSTRAINT sesiones_id_usuario_fkey;
       public          postgres    false    218    3206    220                   x������ � �            x������ � �            x������ � �            x������ � �      $      x������ � �      "      x������ � �     