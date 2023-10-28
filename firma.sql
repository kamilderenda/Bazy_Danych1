PGDMP  /    ,            	    {           firma    16.0    16rc1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16403    firma    DATABASE     x   CREATE DATABASE firma WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Polish_Poland.1250';
    DROP DATABASE firma;
                postgres    false                        2615    16404    rozliczenia    SCHEMA        CREATE SCHEMA rozliczenia;
    DROP SCHEMA rozliczenia;
                postgres    false            �            1259    16410    godziny    TABLE     �   CREATE TABLE rozliczenia.godziny (
    id_godziny character(255) NOT NULL,
    data date NOT NULL,
    liczba_godzin integer NOT NULL,
    id_pracownika character(255) NOT NULL
);
     DROP TABLE rozliczenia.godziny;
       rozliczenia         heap    postgres    false    6            �            1259    16415    pensje    TABLE     �   CREATE TABLE rozliczenia.pensje (
    id_pensji character(255) NOT NULL,
    stanowisko character(255) NOT NULL,
    kwota money NOT NULL,
    id_premii character(255)
);
    DROP TABLE rozliczenia.pensje;
       rozliczenia         heap    postgres    false    6            �            1259    16405 
   pracownicy    TABLE     �   CREATE TABLE rozliczenia.pracownicy (
    id_pracownika character(255) NOT NULL,
    imie character(255) NOT NULL,
    nazwisko character(255) NOT NULL,
    adres character(255) NOT NULL,
    telefon character(255) NOT NULL
);
 #   DROP TABLE rozliczenia.pracownicy;
       rozliczenia         heap    postgres    false    6            �            1259    16420    premie    TABLE     �   CREATE TABLE rozliczenia.premie (
    id_premi character(255) NOT NULL,
    rodzaj character(255) NOT NULL,
    kwota money NOT NULL
);
    DROP TABLE rozliczenia.premie;
       rozliczenia         heap    postgres    false    6            �          0    16410    godziny 
   TABLE DATA           V   COPY rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) FROM stdin;
    rozliczenia          postgres    false    217           �          0    16415    pensje 
   TABLE DATA           N   COPY rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii) FROM stdin;
    rozliczenia          postgres    false    218   �       �          0    16405 
   pracownicy 
   TABLE DATA           X   COPY rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) FROM stdin;
    rozliczenia          postgres    false    216   �       �          0    16420    premie 
   TABLE DATA           >   COPY rozliczenia.premie (id_premi, rodzaj, kwota) FROM stdin;
    rozliczenia          postgres    false    219          *           2606    16472    godziny godziny_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY rozliczenia.godziny
    ADD CONSTRAINT godziny_pkey PRIMARY KEY (id_godziny);
 C   ALTER TABLE ONLY rozliczenia.godziny DROP CONSTRAINT godziny_pkey;
       rozliczenia            postgres    false    217            ,           2606    16543    pensje pensje_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY rozliczenia.pensje
    ADD CONSTRAINT pensje_pkey PRIMARY KEY (id_pensji);
 A   ALTER TABLE ONLY rozliczenia.pensje DROP CONSTRAINT pensje_pkey;
       rozliczenia            postgres    false    218            '           2606    16505    pracownicy pracownicy_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY rozliczenia.pracownicy
    ADD CONSTRAINT pracownicy_pkey PRIMARY KEY (id_pracownika);
 I   ALTER TABLE ONLY rozliczenia.pracownicy DROP CONSTRAINT pracownicy_pkey;
       rozliczenia            postgres    false    216            .           2606    16513    premie premie_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY rozliczenia.premie
    ADD CONSTRAINT premie_pkey PRIMARY KEY (id_premi);
 A   ALTER TABLE ONLY rozliczenia.premie DROP CONSTRAINT premie_pkey;
       rozliczenia            postgres    false    219            (           1259    16541    fki_id_pracownika    INDEX     S   CREATE INDEX fki_id_pracownika ON rozliczenia.godziny USING btree (id_pracownika);
 *   DROP INDEX rozliczenia.fki_id_pracownika;
       rozliczenia            postgres    false    217            /           2606    16536    godziny id_pracownika    FK CONSTRAINT     �   ALTER TABLE ONLY rozliczenia.godziny
    ADD CONSTRAINT id_pracownika FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika) NOT VALID;
 D   ALTER TABLE ONLY rozliczenia.godziny DROP CONSTRAINT id_pracownika;
       rozliczenia          postgres    false    4647    217    216            0           2606    16531    pensje id_premii    FK CONSTRAINT     �   ALTER TABLE ONLY rozliczenia.pensje
    ADD CONSTRAINT id_premii FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premi) NOT VALID;
 ?   ALTER TABLE ONLY rozliczenia.pensje DROP CONSTRAINT id_premii;
       rozliczenia          postgres    false    219    4654    218            �   �   x�嗻�0kq�,���8�d�9^ZMpPh�n�5ѳ���92ڵ��B,2?�Ý��B,�K����bѤXjY|���m�R�b����E��8���R7m�R��2̗�6m�R�b�����Ϫ�ag���?�Kz�yw��I�Ꮪ\      �     x��KJ�@E�ﭢ��]H*��vC#���T�`����A����p_���x������*�]�/��=���ڞ�:��)��6���/�h,�+��j΍�c�U��j���n>��Ћ�ܔk�)5���vk�%̐��5V���`�>XX�~������)T,��������n��^C�I�����>XX�~���BySJڨ�.5������s��61�\�U(5D����������ސ�>XX�~ڿw���{@��a>������M��?\0��O�      �     x��Mn�0���S��);�Y�E��.�z! 膖	��L�CZ�Dϑ#��WI;�6@V�:�	>H��<j�d}�K�h�h�F[�<<?-+[�E[�bc��ʺ����T�i����6� ���4�[[�-pЭ�2ο����7��k_"O��R��&h��6�B7&�Bk�����~0%Z}:>�� ̛��T�h��B��	1@`�#`�u\� �ǯ�qh4�|~:�20�4R�R��Fh�ف�71 �:E ��[�`�@h�oaN�7=������M!L�R*˘ޅ	V�ݿ��o��|�Ա�5pP�î�1�N5����P�l�Q�2��l+0�ɷ���	��l# N@n�� By�E�s�b�ֻԈٌ��b����&}�c�1��ue\���	ݬ�����#�·}����RH
�؃GC��a��Y�*4��&�@���Kk���l�=W��RKV;!4I�7�g
m�Ap:�^��z�JC�L����x�η.΀h�F*g�>�����J��1�k      �   �   x��K��0�/�`�h� �s����-d¸��V4^r7�Ef�o�[�NP���u��xm�b��l
��Rj���fÖ�0;�%{�V��}Ia˖�~��9�����m�y�))��2\`����¤g�����`[R��2\0&?Ĥ�n����g�p��Qfg��Xeؕl.�����5[�%�#[��;�J[���pb�p���1M�,Azbm/%�w	�b�PA�u�f��pqlhK
?�MӼ ����     