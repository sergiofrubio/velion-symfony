PGDMP  8        
            |            app    16.3    16.3 P    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384    app    DATABASE     n   CREATE DATABASE app WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE app;
                app    false            �            1259    16444    appointment    TABLE     U  CREATE TABLE public.appointment (
    id integer NOT NULL,
    date date NOT NULL,
    "time" time(0) without time zone NOT NULL,
    duration integer NOT NULL,
    patient_id character varying(9) NOT NULL,
    therapist_id character varying(9) NOT NULL,
    specialization_id integer NOT NULL,
    status character varying(255) NOT NULL
);
    DROP TABLE public.appointment;
       public         heap    app    false            �            1259    16442    appointment_id_seq    SEQUENCE     {   CREATE SEQUENCE public.appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.appointment_id_seq;
       public          app    false            �            1259    16408    category    TABLE     �   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);
    DROP TABLE public.category;
       public         heap    app    false            �            1259    16404    category_id_seq    SEQUENCE     x   CREATE SEQUENCE public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          app    false            �            1259    16385    doctrine_migration_versions    TABLE     �   CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);
 /   DROP TABLE public.doctrine_migration_versions;
       public         heap    app    false            �            1259    16415    invoice    TABLE     �   CREATE TABLE public.invoice (
    id integer NOT NULL,
    issue_date date NOT NULL,
    status character varying(255) NOT NULL,
    customer_id character varying(9) NOT NULL
);
    DROP TABLE public.invoice;
       public         heap    app    false            �            1259    16405    invoice_id_seq    SEQUENCE     w   CREATE SEQUENCE public.invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.invoice_id_seq;
       public          app    false            �            1259    16536    invoice_product    TABLE     j   CREATE TABLE public.invoice_product (
    invoice_id integer NOT NULL,
    product_id integer NOT NULL
);
 #   DROP TABLE public.invoice_product;
       public         heap    app    false            �            1259    16470    medical_report    TABLE     '  CREATE TABLE public.medical_report (
    id integer NOT NULL,
    diagnosis character varying(255) NOT NULL,
    treatment character varying(255) NOT NULL,
    notes character varying(255) NOT NULL,
    patient_id character varying(9) NOT NULL,
    therapist_id character varying(9) NOT NULL
);
 "   DROP TABLE public.medical_report;
       public         heap    app    false            �            1259    16469    medical_report_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.medical_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.medical_report_id_seq;
       public          app    false            �            1259    16420    product    TABLE     �   CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    price integer NOT NULL,
    category_id integer
);
    DROP TABLE public.product;
       public         heap    app    false            �            1259    16406    product_id_seq    SEQUENCE     w   CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          app    false            �            1259    16454    reset_password_request    TABLE     D  CREATE TABLE public.reset_password_request (
    id integer NOT NULL,
    user_id character varying(9) NOT NULL,
    selector character varying(20) NOT NULL,
    hashed_token character varying(100) NOT NULL,
    requested_at timestamp(0) without time zone NOT NULL,
    expires_at timestamp(0) without time zone NOT NULL
);
 *   DROP TABLE public.reset_password_request;
       public         heap    app    false            �           0    0 *   COLUMN reset_password_request.requested_at    COMMENT     `   COMMENT ON COLUMN public.reset_password_request.requested_at IS '(DC2Type:datetime_immutable)';
          public          app    false    229            �           0    0 (   COLUMN reset_password_request.expires_at    COMMENT     ^   COMMENT ON COLUMN public.reset_password_request.expires_at IS '(DC2Type:datetime_immutable)';
          public          app    false    229            �            1259    16443    reset_password_request_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reset_password_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.reset_password_request_id_seq;
       public          app    false            �            1259    16427    specialization    TABLE     q   CREATE TABLE public.specialization (
    id integer NOT NULL,
    description character varying(255) NOT NULL
);
 "   DROP TABLE public.specialization;
       public         heap    app    false            �            1259    16407    specialization_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.specialization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.specialization_id_seq;
       public          app    false            �            1259    16392    user    TABLE     �  CREATE TABLE public."user" (
    id character varying(9) NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    surname character varying(255) DEFAULT NULL::character varying,
    birth_date date,
    address character varying(255) DEFAULT NULL::character varying,
    city character varying(255) DEFAULT NULL::character varying,
    province character varying(255) DEFAULT NULL::character varying,
    zip integer,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    roles json NOT NULL,
    genre character varying(255) NOT NULL,
    phone integer,
    is_verified boolean NOT NULL
);
    DROP TABLE public."user";
       public         heap    app    false            �            1259    16391    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          app    false            �            1259    16495    user_specialization    TABLE        CREATE TABLE public.user_specialization (
    user_id character varying(9) NOT NULL,
    specialization_id integer NOT NULL
);
 '   DROP TABLE public.user_specialization;
       public         heap    app    false            �          0    16444    appointment 
   TABLE DATA           v   COPY public.appointment (id, date, "time", duration, patient_id, therapist_id, specialization_id, status) FROM stdin;
    public          app    false    228   �_       �          0    16408    category 
   TABLE DATA           9   COPY public.category (id, name, description) FROM stdin;
    public          app    false    222   �_       �          0    16385    doctrine_migration_versions 
   TABLE DATA           [   COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
    public          app    false    215   *a       �          0    16415    invoice 
   TABLE DATA           F   COPY public.invoice (id, issue_date, status, customer_id) FROM stdin;
    public          app    false    223   &b       �          0    16536    invoice_product 
   TABLE DATA           A   COPY public.invoice_product (invoice_id, product_id) FROM stdin;
    public          app    false    233   Cb       �          0    16470    medical_report 
   TABLE DATA           c   COPY public.medical_report (id, diagnosis, treatment, notes, patient_id, therapist_id) FROM stdin;
    public          app    false    231   `b       �          0    16420    product 
   TABLE DATA           L   COPY public.product (id, name, description, price, category_id) FROM stdin;
    public          app    false    224   }b       �          0    16454    reset_password_request 
   TABLE DATA           o   COPY public.reset_password_request (id, user_id, selector, hashed_token, requested_at, expires_at) FROM stdin;
    public          app    false    229   �d       �          0    16427    specialization 
   TABLE DATA           9   COPY public.specialization (id, description) FROM stdin;
    public          app    false    225   e       �          0    16392    user 
   TABLE DATA           �   COPY public."user" (id, name, surname, birth_date, address, city, province, zip, email, password, roles, genre, phone, is_verified) FROM stdin;
    public          app    false    217   �e       �          0    16495    user_specialization 
   TABLE DATA           I   COPY public.user_specialization (user_id, specialization_id) FROM stdin;
    public          app    false    232   �f       �           0    0    appointment_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.appointment_id_seq', 1, false);
          public          app    false    226            �           0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 1, false);
          public          app    false    218            �           0    0    invoice_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.invoice_id_seq', 1, false);
          public          app    false    219            �           0    0    medical_report_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.medical_report_id_seq', 1, false);
          public          app    false    230            �           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 1, false);
          public          app    false    220            �           0    0    reset_password_request_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.reset_password_request_id_seq', 1, false);
          public          app    false    227            �           0    0    specialization_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.specialization_id_seq', 1, false);
          public          app    false    221            �           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 1, true);
          public          app    false    216            �           2606    16453    appointment appointment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT appointment_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.appointment DROP CONSTRAINT appointment_pkey;
       public            app    false    228            �           2606    16414    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            app    false    222            �           2606    16390 <   doctrine_migration_versions doctrine_migration_versions_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);
 f   ALTER TABLE ONLY public.doctrine_migration_versions DROP CONSTRAINT doctrine_migration_versions_pkey;
       public            app    false    215            �           2606    16419    invoice invoice_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.invoice DROP CONSTRAINT invoice_pkey;
       public            app    false    223                       2606    16540 $   invoice_product invoice_product_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.invoice_product
    ADD CONSTRAINT invoice_product_pkey PRIMARY KEY (invoice_id, product_id);
 N   ALTER TABLE ONLY public.invoice_product DROP CONSTRAINT invoice_product_pkey;
       public            app    false    233    233            �           2606    16476 "   medical_report medical_report_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.medical_report
    ADD CONSTRAINT medical_report_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.medical_report DROP CONSTRAINT medical_report_pkey;
       public            app    false    231            �           2606    16426    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            app    false    224            �           2606    16458 2   reset_password_request reset_password_request_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.reset_password_request
    ADD CONSTRAINT reset_password_request_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.reset_password_request DROP CONSTRAINT reset_password_request_pkey;
       public            app    false    229            �           2606    16431 "   specialization specialization_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.specialization
    ADD CONSTRAINT specialization_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.specialization DROP CONSTRAINT specialization_pkey;
       public            app    false    225            �           2606    16434    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            app    false    217                       2606    16499 ,   user_specialization user_specialization_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_specialization
    ADD CONSTRAINT user_specialization_pkey PRIMARY KEY (user_id, specialization_id);
 V   ALTER TABLE ONLY public.user_specialization DROP CONSTRAINT user_specialization_pkey;
       public            app    false    232    232                       1259    16541    idx_2193327e2989f1fd    INDEX     V   CREATE INDEX idx_2193327e2989f1fd ON public.invoice_product USING btree (invoice_id);
 (   DROP INDEX public.idx_2193327e2989f1fd;
       public            app    false    233                       1259    16542    idx_2193327e4584665a    INDEX     V   CREATE INDEX idx_2193327e4584665a ON public.invoice_product USING btree (product_id);
 (   DROP INDEX public.idx_2193327e4584665a;
       public            app    false    233            �           1259    16459    idx_7ce748aa76ed395    INDEX     Y   CREATE INDEX idx_7ce748aa76ed395 ON public.reset_password_request USING btree (user_id);
 '   DROP INDEX public.idx_7ce748aa76ed395;
       public            app    false    229            �           1259    16523    idx_906517449395c3f3    INDEX     O   CREATE INDEX idx_906517449395c3f3 ON public.invoice USING btree (customer_id);
 (   DROP INDEX public.idx_906517449395c3f3;
       public            app    false    223            �           1259    16535    idx_af71c02b43e8b094    INDEX     W   CREATE INDEX idx_af71c02b43e8b094 ON public.medical_report USING btree (therapist_id);
 (   DROP INDEX public.idx_af71c02b43e8b094;
       public            app    false    231            �           1259    16534    idx_af71c02b6b899279    INDEX     U   CREATE INDEX idx_af71c02b6b899279 ON public.medical_report USING btree (patient_id);
 (   DROP INDEX public.idx_af71c02b6b899279;
       public            app    false    231            �           1259    16488    idx_d34a04ad12469de2    INDEX     O   CREATE INDEX idx_d34a04ad12469de2 ON public.product USING btree (category_id);
 (   DROP INDEX public.idx_d34a04ad12469de2;
       public            app    false    224            �           1259    16500    idx_f55c2d33a76ed395    INDEX     W   CREATE INDEX idx_f55c2d33a76ed395 ON public.user_specialization USING btree (user_id);
 (   DROP INDEX public.idx_f55c2d33a76ed395;
       public            app    false    232            �           1259    16501    idx_f55c2d33fa846217    INDEX     a   CREATE INDEX idx_f55c2d33fa846217 ON public.user_specialization USING btree (specialization_id);
 (   DROP INDEX public.idx_f55c2d33fa846217;
       public            app    false    232            �           1259    16494    idx_fe38f84443e8b094    INDEX     T   CREATE INDEX idx_fe38f84443e8b094 ON public.appointment USING btree (therapist_id);
 (   DROP INDEX public.idx_fe38f84443e8b094;
       public            app    false    228            �           1259    16482    idx_fe38f8446b899279    INDEX     R   CREATE INDEX idx_fe38f8446b899279 ON public.appointment USING btree (patient_id);
 (   DROP INDEX public.idx_fe38f8446b899279;
       public            app    false    228            �           1259    16517    idx_fe38f844fa846217    INDEX     Y   CREATE INDEX idx_fe38f844fa846217 ON public.appointment USING btree (specialization_id);
 (   DROP INDEX public.idx_fe38f844fa846217;
       public            app    false    228            �           1259    16432    uniq_8d93d649e7927c74    INDEX     P   CREATE UNIQUE INDEX uniq_8d93d649e7927c74 ON public."user" USING btree (email);
 )   DROP INDEX public.uniq_8d93d649e7927c74;
       public            app    false    217                       2606    16543 #   invoice_product fk_2193327e2989f1fd    FK CONSTRAINT     �   ALTER TABLE ONLY public.invoice_product
    ADD CONSTRAINT fk_2193327e2989f1fd FOREIGN KEY (invoice_id) REFERENCES public.invoice(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.invoice_product DROP CONSTRAINT fk_2193327e2989f1fd;
       public          app    false    3308    233    223                       2606    16548 #   invoice_product fk_2193327e4584665a    FK CONSTRAINT     �   ALTER TABLE ONLY public.invoice_product
    ADD CONSTRAINT fk_2193327e4584665a FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.invoice_product DROP CONSTRAINT fk_2193327e4584665a;
       public          app    false    233    3311    224                       2606    16460 )   reset_password_request fk_7ce748aa76ed395    FK CONSTRAINT     �   ALTER TABLE ONLY public.reset_password_request
    ADD CONSTRAINT fk_7ce748aa76ed395 FOREIGN KEY (user_id) REFERENCES public."user"(id);
 S   ALTER TABLE ONLY public.reset_password_request DROP CONSTRAINT fk_7ce748aa76ed395;
       public          app    false    217    3303    229                       2606    16518    invoice fk_906517449395c3f3    FK CONSTRAINT        ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT fk_906517449395c3f3 FOREIGN KEY (customer_id) REFERENCES public."user"(id);
 E   ALTER TABLE ONLY public.invoice DROP CONSTRAINT fk_906517449395c3f3;
       public          app    false    217    3303    223                       2606    16529 "   medical_report fk_af71c02b43e8b094    FK CONSTRAINT     �   ALTER TABLE ONLY public.medical_report
    ADD CONSTRAINT fk_af71c02b43e8b094 FOREIGN KEY (therapist_id) REFERENCES public."user"(id);
 L   ALTER TABLE ONLY public.medical_report DROP CONSTRAINT fk_af71c02b43e8b094;
       public          app    false    3303    217    231                       2606    16524 "   medical_report fk_af71c02b6b899279    FK CONSTRAINT     �   ALTER TABLE ONLY public.medical_report
    ADD CONSTRAINT fk_af71c02b6b899279 FOREIGN KEY (patient_id) REFERENCES public."user"(id);
 L   ALTER TABLE ONLY public.medical_report DROP CONSTRAINT fk_af71c02b6b899279;
       public          app    false    3303    231    217                       2606    16483    product fk_d34a04ad12469de2    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_d34a04ad12469de2 FOREIGN KEY (category_id) REFERENCES public.category(id);
 E   ALTER TABLE ONLY public.product DROP CONSTRAINT fk_d34a04ad12469de2;
       public          app    false    222    224    3305                       2606    16502 '   user_specialization fk_f55c2d33a76ed395    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_specialization
    ADD CONSTRAINT fk_f55c2d33a76ed395 FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.user_specialization DROP CONSTRAINT fk_f55c2d33a76ed395;
       public          app    false    3303    217    232                       2606    16507 '   user_specialization fk_f55c2d33fa846217    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_specialization
    ADD CONSTRAINT fk_f55c2d33fa846217 FOREIGN KEY (specialization_id) REFERENCES public.specialization(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.user_specialization DROP CONSTRAINT fk_f55c2d33fa846217;
       public          app    false    3313    232    225                       2606    16489    appointment fk_fe38f84443e8b094    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fk_fe38f84443e8b094 FOREIGN KEY (therapist_id) REFERENCES public."user"(id);
 I   ALTER TABLE ONLY public.appointment DROP CONSTRAINT fk_fe38f84443e8b094;
       public          app    false    217    228    3303            	           2606    16477    appointment fk_fe38f8446b899279    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fk_fe38f8446b899279 FOREIGN KEY (patient_id) REFERENCES public."user"(id);
 I   ALTER TABLE ONLY public.appointment DROP CONSTRAINT fk_fe38f8446b899279;
       public          app    false    217    228    3303            
           2606    16512    appointment fk_fe38f844fa846217    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT fk_fe38f844fa846217 FOREIGN KEY (specialization_id) REFERENCES public.specialization(id);
 I   ALTER TABLE ONLY public.appointment DROP CONSTRAINT fk_fe38f844fa846217;
       public          app    false    228    3313    225            �      x������ � �      �   S  x�eR�N�0<;_��"�EB�"B�l�m��c�k�R��~B�uB*N{�3���R�}"��P��d(BK瓝JG�Q@�rLQ8��	D�h�|���@�C]]��]��XL>����fV��z`��q��w�[�;-�KW-c�p�^m��zq,&��4NqQ;�2C���?O=qx���춌����Ʃ�[���NY���i��y����Є�9Š��L>�O�o�wuuw�S�N��rp�",��h+=e�v���W�f+�W+�,	�.E�N��م��8c����H�'�?���li��q]��}�2�2��of$�e�Q��.����������      �   �   x����n�0�g�)�)��#�n�ڵ���
/	���Q�,d��� y<^~n�r>}.���m�����uZ����J�%#-��=�(M���!��>K�5y��l�} ��h�@!��x0�7y��E��� (S��~ �:���D)�a��Τ.�	�'�P��t���4�	Z���7�Lf�"����*�ǫ>m�ΫF��/��@�2M@�U���f��YH��q� �M      �      x������ � �      �      x������ � �      �      x������ � �      �   h  x��S;r�0�����%Q�K۲=�g���4+ �� ��mR�p��x�,@If�I���}�}�
��*7��"I<�+-����P��Q�G�%Ira����(����T���F��3�~�@�"�-w�td]d�'T��Z�Mdg�3�Qgp)5q�y?a�G=*�ah���%j�-a����.`Z����ťE��CV�+�߷INg��g�B9��XM�05,�b����{��m�����b�i�����f����B�E��6����enGe���lV3�|u��a�ⳏ��U��pXd
*7���� ��¤�8��5̋s��=��=w�O�Hc}\>&��L2��J�&�x�+�^q�JN���Ǚ-mX��|N�&�ɠ�NHӿX��UA]T��K�j�ZFd���%����p�	^Z�]�HJX$�
��%;�9�3|��wy%�#�ca,��<E5�[�p<�v�|�iY�ZB��>(
n嵐]:�D�B|=F2f�:�+g��k�p�)��?.���N1�"��֣.�.�fK�_u�T��Lନ�'�j�&n�'M2ʻ�]�TZ�DÇz���W��9��c)qm�y%,��'�oeQ� Id��      �      x������ � �      �   �   x�e���0D��*\"��  �\{9����G�)!��H(��:oF3SWz��-'�<N
^�Mu��>�``T��x;-k�M�_If�-�P,��0®dS���̱}u������%Y*�%"�"�l���N��$�S��(�}�Qg���g��˷�.Y��t`��_��l����%r�{��M�T      �   �   x�E�K�@������H�3�"vF�Q� D�Ȕ�4�$SUz�r�^�cc�}���PA(��?�p��4�?g`LK�^�&t�Y(~Bn�ȸ���j/�<."��"V�R{��
�>�/�"��;�n�uB��#'��X�7��q��.m�%�l�2a�[u1!A'me�Ѿ^�l�����0��-��Ψ����|%�fRRm`\���.k��zD�      �      x������ � �     