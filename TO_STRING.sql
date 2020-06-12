create or replace function TO_STRING( I_STRING in varchar2 ) return varchar2 is

/* **************************************************************************************************

    The TO_STRING creates a "string" expression

    sample:
    -------
    select to_string( q'@this is two line string
    second line@' ) from dual


    result:
    -------
    'this is two line string' || chr( 10 ) || 'second line'

    History of changes
    yyyy.mm.dd | Version | Author         | Changes
    -----------+---------+----------------+-------------------------
    2020.06.12 |  1.0    | Ferenc Toth    | Created 

**************************************************************************************************** */

    V_STRING varchar2(32000) := I_STRING;
begin
    for I in 1..31 loop
        V_STRING := replace( V_STRING, chr( I ), ''' || chr( ' || to_char( I ) || ' ) || ''' );
    end loop;
    V_STRING := replace( V_STRING, '''', '''''' );
    V_STRING := '''' || V_STRING || '''';
    return V_STRING;
end;
/
