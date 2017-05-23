--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account (
    createdon bigint,
    creatorid bigint,
    ownerid bigint,
    accountname character varying(100),
    account_type character varying(200),
    industry character varying(200),
    rating character varying(200),
    phone character varying(30),
    email1 character varying(100),
    email2 character varying(100),
    website character varying(100),
    emailoptout character varying(3),
    city character varying(30),
    country character varying(30),
    state character varying(30),
    zipcode character varying(30),
    crmid bigint,
    memberof bigint,
    version integer,
    date_from date,
    date_to date,
    street character varying(250),
    idaccount bigint NOT NULL,
    nifcif character varying(50),
    formapago character varying(255),
    accountno character varying(100)
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: account_idaccount_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_idaccount_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.account_idaccount_seq OWNER TO postgres;

--
-- Name: campaign_idcampaign_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE campaign_idcampaign_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.campaign_idcampaign_seq OWNER TO postgres;

--
-- Name: campaign; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE campaign (
    idcampaign bigint DEFAULT nextval('campaign_idcampaign_seq'::regclass) NOT NULL,
    createdon bigint,
    creatorid bigint,
    ownerid bigint,
    campaignname character varying(255),
    campaigntype character varying(200),
    expectedresponse character varying(200),
    sponsor character varying(255),
    active integer,
    activedate bigint,
    inactive integer,
    inactivedate bigint,
    planning integer,
    planningdate bigint,
    cancelled integer,
    cancelleddate bigint,
    completed integer,
    completeddate bigint,
    elapsedtime numeric(10,0),
    crmid bigint,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    campaignstatus character varying(200),
    product_id bigint,
    targetaudience character varying(255),
    targetsize integer,
    expectedresponsecount integer,
    expectedsalescount integer,
    expectedroi numeric(25,3),
    actualresponsecount integer,
    actualsalescount integer,
    actualroi numeric(25,3),
    closingdate timestamp without time zone,
    expectedrevenue numeric(25,3),
    budgetcost numeric(25,3),
    actualcost numeric(25,3),
    numsent bigint,
    campaignno character varying(100)
);


ALTER TABLE public.campaign OWNER TO postgres;

--
-- Name: contact_idcontact_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contact_idcontact_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contact_idcontact_seq OWNER TO postgres;

--
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contact (
    idcontact bigint DEFAULT nextval('contact_idcontact_seq'::regclass) NOT NULL,
    vendorid bigint,
    accountid bigint,
    firstname character varying(80),
    lastname character varying(80),
    email character varying(100),
    phone character varying(80),
    mobile character varying(80),
    department character varying(80),
    donotcall character varying(3),
    emailoptout character varying(3),
    creatorid bigint,
    ownerid bigint,
    createdon bigint,
    city character varying(40),
    state character varying(30),
    country character varying(40),
    zipcode character varying(30),
    crmid bigint,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    salutation character varying(200),
    fax character varying(50),
    contacttype character varying(50),
    otheremail character varying(100),
    yahooid character varying(100),
    street character varying(250),
    homephone character varying(50),
    otherphone character varying(50),
    birthday bigint,
    reportsto bigint,
    fullname character varying(200),
    contactno character varying(100)
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE currency (
    idcurrency bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    currencyid bigint,
    currency_name character varying(100),
    currency_code character varying(100),
    currency_symbol character varying(30),
    conversion_rate numeric(10,3),
    currency_status character varying(25),
    defaultid character varying(10)
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- Name: currency_idcurrency_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE currency_idcurrency_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.currency_idcurrency_seq OWNER TO postgres;

--
-- Name: daytime; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE daytime (
    iddaytime integer NOT NULL,
    fecha date,
    year smallint,
    month smallint,
    day_of_year smallint,
    day_of_month smallint,
    day_of_week smallint,
    week_of_year smallint,
    day_of_week_desc character varying(30),
    day_of_week_short_desc character varying(3),
    month_desc character varying(30),
    month_short_desc character varying(3),
    quarter smallint,
    bimonthly smallint,
    cuatrimestre smallint,
    semester smallint
);


ALTER TABLE public.daytime OWNER TO postgres;

--
-- Name: daytime_iddaytime_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE daytime_iddaytime_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.daytime_iddaytime_seq OWNER TO postgres;

--
-- Name: daytimedom; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW daytimedom AS
    SELECT DISTINCT daytime.day_of_month FROM daytime ORDER BY daytime.day_of_month;


ALTER TABLE public.daytimedom OWNER TO postgres;

--
-- Name: VIEW daytimedom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON VIEW daytimedom IS 'Distinct day of month view';


--
-- Name: daytimedow; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW daytimedow AS
    SELECT DISTINCT daytime.day_of_week, daytime.day_of_week_desc, daytime.day_of_week_short_desc FROM daytime ORDER BY daytime.day_of_week, daytime.day_of_week_desc, daytime.day_of_week_short_desc;


ALTER TABLE public.daytimedow OWNER TO postgres;

--
-- Name: VIEW daytimedow; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON VIEW daytimedow IS 'Distinct day_of_week view';


--
-- Name: daytimedoy; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW daytimedoy AS
    SELECT DISTINCT daytime.day_of_year FROM daytime ORDER BY daytime.day_of_year;


ALTER TABLE public.daytimedoy OWNER TO postgres;

--
-- Name: VIEW daytimedoy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON VIEW daytimedoy IS 'Distinct day of the year view';


--
-- Name: daytimemonth; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW daytimemonth AS
    SELECT DISTINCT daytime.month, daytime.month_short_desc, daytime.month_desc FROM daytime ORDER BY daytime.month, daytime.month_short_desc, daytime.month_desc;


ALTER TABLE public.daytimemonth OWNER TO postgres;

--
-- Name: VIEW daytimemonth; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON VIEW daytimemonth IS 'Distinct month view';


--
-- Name: daytimewoy; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW daytimewoy AS
    SELECT DISTINCT daytime.week_of_year FROM daytime ORDER BY daytime.week_of_year;


ALTER TABLE public.daytimewoy OWNER TO postgres;

--
-- Name: VIEW daytimewoy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON VIEW daytimewoy IS 'Distinct week_of_year view';


--
-- Name: daytimeyear; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW daytimeyear AS
    SELECT DISTINCT daytime.year FROM daytime ORDER BY daytime.year;


ALTER TABLE public.daytimeyear OWNER TO postgres;

--
-- Name: VIEW daytimeyear; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON VIEW daytimeyear IS 'Distinct year view';


--
-- Name: event_idevent_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE event_idevent_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.event_idevent_seq OWNER TO postgres;

--
-- Name: event; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event (
    idevent bigint DEFAULT nextval('event_idevent_seq'::regclass) NOT NULL,
    createdon bigint,
    creatorid bigint,
    ownerid bigint,
    crmid bigint,
    subject character varying(100),
    activitytype character varying(200),
    visibility character varying(50),
    priority character varying(200),
    location character varying(150),
    recurringtype character varying(200),
    status character varying(200),
    closedon bigint,
    elapsedtime integer,
    entitytype character varying(35),
    entityid bigint,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    semodule character varying(20),
    time_start character varying(50),
    time_end character varying(50),
    sendnotification character varying(3),
    duration_hours character varying(2),
    duration_minutes character varying(200),
    eventstatus character varying(200),
    contactid bigint,
    date_due bigint,
    date_start bigint
);


ALTER TABLE public.event OWNER TO postgres;

--
-- Name: faq_idfaq_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE faq_idfaq_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.faq_idfaq_seq OWNER TO postgres;

--
-- Name: faq; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE faq (
    idfaq bigint DEFAULT nextval('faq_idfaq_seq'::regclass) NOT NULL,
    product_id bigint,
    createdon bigint,
    creatorid bigint,
    ownerid bigint,
    crmid bigint,
    category character varying(200),
    question character varying(300),
    st_draft integer,
    st_draft_date bigint,
    st_reviewed integer,
    st_reviewed_date bigint,
    st_published integer,
    st_published_date bigint,
    st_obsolete integer,
    st_obsolete_date bigint,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    status character varying(200),
    faqno character varying(100)
);


ALTER TABLE public.faq OWNER TO postgres;

--
-- Name: helpdesk; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE helpdesk (
    idhelpdesk bigint NOT NULL,
    productid bigint,
    vendorid bigint,
    title character varying(255),
    priority character varying(200),
    severity character varying(200),
    category character varying(200),
    status character varying(200),
    creatorid bigint,
    ownerid bigint,
    createdon bigint,
    crmid bigint,
    contactid bigint,
    accountid bigint,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    ticketno character varying(100),
    hours integer,
    days integer,
    fechamaxima bigint
);


ALTER TABLE public.helpdesk OWNER TO postgres;

--
-- Name: helpdesk_idhelpdesk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE helpdesk_idhelpdesk_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.helpdesk_idhelpdesk_seq OWNER TO postgres;

--
-- Name: invoice_idinvoice_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE invoice_idinvoice_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.invoice_idinvoice_seq OWNER TO postgres;

--
-- Name: invoice; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE invoice (
    idinvoice bigint DEFAULT nextval('invoice_idinvoice_seq'::regclass) NOT NULL,
    salesorderid bigint,
    accountid bigint,
    customerno character varying(100),
    subject character varying(100),
    invoice_no character varying(100),
    invoicedate bigint,
    duedate bigint,
    creatorid bigint,
    ownerid bigint,
    createdon bigint,
    taxtype character varying(25),
    crmid bigint,
    contactid bigint,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    type character varying(100),
    shipping character varying(100),
    invoicestatus character varying(200),
    bill_city character varying(30),
    bill_code character varying(30),
    bill_country character varying(30),
    bill_state character varying(30),
    bill_street character varying(250),
    bill_pobox character varying(30),
    ship_city character varying(30),
    ship_code character varying(30),
    ship_country character varying(30),
    ship_state character varying(30),
    ship_street character varying(250),
    ship_pobox character varying(30),
    adjustment numeric(25,3),
    salescommission numeric(25,3),
    exciseduty numeric(25,3),
    subtotal numeric(25,3),
    total numeric(25,3),
    discount_percent numeric(25,3),
    discount_amount numeric(25,3),
    shipping_amount numeric(25,3),
    tax_amount double precision
);


ALTER TABLE public.invoice OWNER TO postgres;

--
-- Name: invoicefact_idinvoicefact_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE invoicefact_idinvoicefact_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.invoicefact_idinvoicefact_seq OWNER TO postgres;

--
-- Name: invoicefact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE invoicefact (
    idinvoicefact bigint DEFAULT nextval('invoicefact_idinvoicefact_seq'::regclass) NOT NULL,
    invoiceid bigint,
    contactid bigint,
    salesorderid bigint,
    accountid bigint,
    subject character varying(100),
    invoice_no character varying(100),
    invoicedate bigint,
    duedate bigint,
    creatorid bigint,
    ownerid bigint,
    createdon bigint,
    closedon bigint,
    elapsedtime integer,
    invoicestatus character varying(200),
    st_created integer,
    st_created_date bigint,
    st_approved integer,
    st_approved_date bigint,
    st_sent integer,
    st_sent_date bigint,
    st_credit integer,
    st_credit_date bigint,
    st_paid integer,
    st_paid_date bigint,
    taxtype character varying(25),
    adjustment numeric(25,3),
    salescommission numeric(25,3),
    exciseduty numeric(25,3),
    subtotal numeric(25,3),
    total numeric(25,3),
    discount_percent numeric(25,3),
    discount_amount numeric(25,3),
    shipping_amount numeric(25,3),
    tax_amount double precision
);


ALTER TABLE public.invoicefact OWNER TO postgres;

--
-- Name: invoiceline_idinvoiceline_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE invoiceline_idinvoiceline_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.invoiceline_idinvoiceline_seq OWNER TO postgres;

--
-- Name: invoiceline; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE invoiceline (
    idinvoiceline bigint DEFAULT nextval('invoiceline_idinvoiceline_seq'::regclass) NOT NULL,
    invoiceid bigint,
    productid bigint,
    creatorid bigint,
    ownerid bigint,
    accountid bigint,
    vendorid bigint,
    createdon bigint,
    closedon bigint,
    sequence_no integer,
    tax1percent numeric(7,3),
    tax2percent numeric(7,3),
    tax3percent numeric(7,3),
    quantity numeric(25,3),
    unitprice numeric(25,3),
    extendedallowance numeric(25,3),
    extendedcost numeric(25,3),
    extendeddiscountpercent numeric(16,2),
    extendeddiscount numeric(16,2),
    extendedgross numeric(25,3),
    extendednet numeric(25,3),
    contribution numeric(25,3),
    taxtotal numeric(25,3),
    tax1amount numeric(25,3),
    tax2amount numeric(25,3),
    tax3amount numeric(25,3),
    contactid bigint
);


ALTER TABLE public.invoiceline OWNER TO postgres;

--
-- Name: lead_idlead_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lead_idlead_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lead_idlead_seq OWNER TO postgres;

--
-- Name: lead; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lead (
    idlead bigint DEFAULT nextval('lead_idlead_seq'::regclass) NOT NULL,
    firstname character varying(80),
    lastname character varying(80),
    phone character varying(80),
    mobile character varying(80),
    company character varying(100),
    creatorid bigint,
    ownerid bigint,
    createdon bigint,
    city character varying(40),
    state character varying(30),
    country character varying(40),
    interest character varying(50),
    industry character varying(200),
    rating character varying(200),
    crmid bigint,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    salutation character varying(200),
    annualrevenue integer,
    campaign character varying(30),
    leadstatus character varying(50),
    leadsource character varying(200),
    converted integer,
    designation character varying(50),
    licencekeystatus character varying(50),
    space character varying(250),
    priority character varying(50),
    demorequest character varying(50),
    partnercontact character varying(50),
    productversion character varying(20),
    product character varying(50),
    maildate bigint,
    nextstepdate bigint,
    fundingsituation character varying(50),
    purpose character varying(50),
    evaluationstatus character varying(50),
    transferdate bigint,
    revenuetype character varying(50),
    noofemployees integer,
    yahooid character varying(100),
    assignleadchk integer,
    website character varying(255),
    callornot integer,
    readornot integer,
    empct integer,
    code character varying(30),
    pobox character varying(30),
    fax character varying(50),
    lane character varying(250),
    leadaddresstype character varying(30),
    email character varying(100),
    fullname character varying(200),
    leadno character varying(100)
);


ALTER TABLE public.lead OWNER TO postgres;

--
-- Name: marketing_idcmarketing_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE marketing_idcmarketing_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.marketing_idcmarketing_seq OWNER TO postgres;

--
-- Name: marketing; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE marketing (
    idmarketing bigint DEFAULT nextval('marketing_idcmarketing_seq'::regclass) NOT NULL,
    productid bigint,
    potentialid bigint,
    invoiceid bigint,
    campaignid bigint,
    leadid bigint,
    vendorid bigint,
    contactid bigint,
    senton bigint,
    quoteid bigint,
    salesorderid bigint
);


ALTER TABLE public.marketing OWNER TO postgres;

--
-- Name: oportunity_idoportunity_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oportunity_idoportunity_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.oportunity_idoportunity_seq OWNER TO postgres;

--
-- Name: oportunity; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oportunity (
    idoportunity bigint DEFAULT nextval('oportunity_idoportunity_seq'::regclass) NOT NULL,
    salesorderid bigint,
    quoteid bigint,
    accountid bigint,
    campaignid bigint,
    potentialid bigint,
    contactid bigint,
    invoiceid bigint,
    vendorid bigint,
    productid bigint,
    createdon bigint DEFAULT 0,
    closedon bigint DEFAULT 0,
    potential_amount numeric(14,2) DEFAULT 0,
    b2ccontactid bigint
);


ALTER TABLE public.oportunity OWNER TO postgres;

--
-- Name: poline_idpoline_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE poline_idpoline_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.poline_idpoline_seq OWNER TO postgres;

--
-- Name: poline; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE poline (
    idpoline bigint DEFAULT nextval('poline_idpoline_seq'::regclass) NOT NULL,
    purchaseorderid bigint,
    productid bigint,
    creatorid bigint,
    ownerid bigint,
    contactid bigint,
    vendorid bigint,
    createdon bigint,
    closedon bigint,
    sequence_no integer,
    tax1percent numeric(7,3),
    tax2percent numeric(7,3),
    tax3percent numeric(7,3),
    quantity numeric(25,3),
    unitprice numeric(25,3),
    extendedallowance numeric(25,3),
    extendedcost numeric(25,3),
    extendeddiscountpercent numeric(16,2),
    extendeddiscount numeric(16,2),
    extendedgross numeric(25,3),
    extendednet numeric(25,3),
    contribution numeric(25,3),
    taxtotal numeric(25,3),
    tax1amount numeric(25,3),
    tax2amount numeric(25,3),
    tax3amount numeric(25,3)
);


ALTER TABLE public.poline OWNER TO postgres;

--
-- Name: potential_idpotential_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE potential_idpotential_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.potential_idpotential_seq OWNER TO postgres;

--
-- Name: potential; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE potential (
    idpotential bigint DEFAULT nextval('potential_idpotential_seq'::regclass) NOT NULL,
    createdon bigint,
    creatorid bigint,
    ownerid bigint,
    potentialname character varying(120),
    closedon bigint,
    elapsedtime numeric(10,0),
    stageprospecting integer,
    stageprospectingdate bigint,
    stagequalification integer,
    stagequalificationdate bigint,
    stageneedsanalysis integer,
    stageneedsanalysisdate bigint,
    stagevalueproposition integer,
    stagevaluepropositiondate bigint,
    stageiddecisionmakers integer,
    stageiddecisionmakersdate bigint,
    stageperceptionanalysis integer,
    stageperceptionanalysisdate bigint,
    stagequote integer,
    stagequotedate bigint,
    stagenegotiationreview integer,
    stagenegotiationreviewdate bigint,
    stageclosedwon integer,
    stageclosedwondate bigint,
    stageclosedlost integer,
    stageclosedlostdate bigint,
    crmid bigint,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    accountid bigint,
    currency character varying(20),
    closingdate timestamp without time zone,
    typeofrevenue character varying(50),
    nextstep character varying(100),
    private integer,
    campaignid bigint,
    sales_stage character varying(200),
    potentialtype character varying(200),
    leadsource character varying(200),
    quotationref character varying(50),
    partnercontact character varying(50),
    runtimefee integer,
    followupdate timestamp without time zone,
    evaluationstatus character varying(50),
    forecastcategory integer,
    outcomeanalysis integer,
    amount numeric(14,2),
    probability numeric(7,3),
    won integer DEFAULT 0,
    potentialno character varying(100),
    contactid integer
);


ALTER TABLE public.potential OWNER TO postgres;

--
-- Name: price_idprice_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE price_idprice_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.price_idprice_seq OWNER TO postgres;

--
-- Name: price; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE price (
    idprice bigint DEFAULT nextval('price_idprice_seq'::regclass) NOT NULL,
    vendorid bigint,
    productid bigint,
    pricebookid bigint,
    createdon bigint,
    modifiedon bigint,
    price numeric(25,4),
    creatorid bigint,
    ownerid bigint
);


ALTER TABLE public.price OWNER TO postgres;

--
-- Name: pricebook_idpricebook_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pricebook_idpricebook_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pricebook_idpricebook_seq OWNER TO postgres;

--
-- Name: pricebook; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pricebook (
    idpricebook bigint DEFAULT nextval('pricebook_idpricebook_seq'::regclass) NOT NULL,
    createdon bigint,
    creatorid bigint,
    ownerid bigint,
    crmid bigint,
    name character varying(100),
    active integer,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    pricebookno character varying(100)
);


ALTER TABLE public.pricebook OWNER TO postgres;

--
-- Name: product_idproduct_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_idproduct_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.product_idproduct_seq OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE product (
    idproduct bigint DEFAULT nextval('product_idproduct_seq'::regclass) NOT NULL,
    createdon bigint,
    creatorid bigint,
    ownerid bigint,
    productname character varying(50),
    productcode character varying(40),
    productcategory character varying(200),
    manufacturer character varying(200),
    discontinued integer,
    sales_start_date bigint,
    sales_end_date bigint,
    support_start_date bigint,
    mfr_part_no character varying(200),
    vendor_part_no character varying(200),
    serialno character varying(200),
    pack_size integer,
    crmid bigint,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    vendor_id bigint,
    qty_per_unit numeric(11,2),
    unit_price numeric(25,2),
    weight numeric(11,3),
    support_end_date bigint
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: purchaseorder_idpurchaseorder_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE purchaseorder_idpurchaseorder_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.purchaseorder_idpurchaseorder_seq OWNER TO postgres;

--
-- Name: purchaseorder; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE purchaseorder (
    idpurchaseorder bigint DEFAULT nextval('purchaseorder_idpurchaseorder_seq'::regclass) NOT NULL,
    vendorid bigint,
    contactid bigint,
    subject character varying(100),
    creatorid bigint,
    ownerid bigint,
    createdon bigint,
    requisition_no character varying(100),
    tracking_no character varying(100),
    duedate bigint,
    carrier character varying(200),
    taxtype character varying(25),
    crmid bigint,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    quoteid integer,
    type character varying(100),
    postatus character varying(200),
    adjustment numeric(25,3),
    salescommission numeric(25,3),
    exciseduty numeric(25,3),
    total numeric(25,3),
    subtotal numeric(25,3),
    discount_percent numeric(25,3),
    discount_amount numeric(25,3),
    shipping_amount numeric(25,3),
    tax_amount double precision,
    purchaseorderno character varying(100)
);


ALTER TABLE public.purchaseorder OWNER TO postgres;

--
-- Name: purchaseorderfact_idpurchaseorderfact_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE purchaseorderfact_idpurchaseorderfact_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.purchaseorderfact_idpurchaseorderfact_seq OWNER TO postgres;

--
-- Name: purchaseorderfact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE purchaseorderfact (
    idpurchaseorderfact bigint DEFAULT nextval('purchaseorderfact_idpurchaseorderfact_seq'::regclass) NOT NULL,
    vendorid bigint,
    contactid bigint,
    subject character varying(100),
    creatorid bigint,
    ownerid bigint,
    createdon bigint,
    closedon bigint,
    elapsedtime integer,
    requisition_no character varying(100),
    tracking_no character varying(100),
    duedate bigint,
    st_created integer,
    st_created_date bigint,
    st_approved integer,
    st_approved_date bigint,
    st_delivered integer,
    st_delivered_date bigint,
    st_received integer,
    st_received_date bigint,
    st_cancelled integer,
    st_cancelled_date bigint,
    purchaseorderid bigint,
    quoteid integer,
    postatus character varying(200),
    adjustment numeric(25,3),
    salescommission numeric(25,3),
    exciseduty numeric(25,3),
    total numeric(25,3),
    subtotal numeric(25,3),
    discount_percent numeric(25,3),
    discount_amount numeric(25,3),
    shipping_amount numeric(25,3),
    tax_amount double precision,
    taxtype character varying(25)
);


ALTER TABLE public.purchaseorderfact OWNER TO postgres;

--
-- Name: quote_idquote_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE quote_idquote_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.quote_idquote_seq OWNER TO postgres;

--
-- Name: quote; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quote (
    idquote bigint DEFAULT nextval('quote_idquote_seq'::regclass) NOT NULL,
    potentialid bigint,
    accountid bigint,
    subject character varying(100),
    creatorid bigint,
    ownerid bigint,
    createdon bigint,
    validtill bigint,
    carrier character varying(200),
    shipping character varying(100),
    taxtype character varying(25),
    crmid bigint,
    contactid bigint,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    quotestage character varying(200),
    inventorymanager integer,
    type character varying(100),
    bill_city character varying(30),
    bill_code character varying(30),
    bill_country character varying(30),
    bill_state character varying(30),
    bill_street character varying(250),
    bill_pobox character varying(30),
    ship_city character varying(30),
    ship_code character varying(30),
    ship_country character varying(30),
    ship_state character varying(30),
    ship_street character varying(250),
    ship_pobox character varying(30),
    subtotal numeric(25,3),
    adjustment numeric(25,3),
    total numeric(25,3),
    discount_percent numeric(25,3),
    discount_amount numeric(25,3),
    shipping_amount numeric(25,3),
    tax_amount double precision,
    quoteno character varying(100)
);


ALTER TABLE public.quote OWNER TO postgres;

--
-- Name: quotefact_idquotefact_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE quotefact_idquotefact_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.quotefact_idquotefact_seq OWNER TO postgres;

--
-- Name: quotefact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quotefact (
    idquotefact bigint DEFAULT nextval('quotefact_idquotefact_seq'::regclass) NOT NULL,
    potentialid bigint,
    accountid bigint,
    subject character varying(100),
    creatorid bigint,
    ownerid bigint,
    createdon bigint,
    closedon bigint,
    elapsedtime integer,
    validtill bigint,
    st_created integer,
    st_created_date bigint,
    st_accepted integer,
    st_accepted_date bigint,
    st_delivered integer,
    st_delivered_date bigint,
    st_reviewed integer,
    st_reviewed_date bigint,
    st_rejected integer,
    st_rejected_date bigint,
    taxtype character varying(25),
    quoteid bigint,
    contactid bigint,
    quotestage character varying(200),
    subtotal numeric(25,3),
    adjustment numeric(25,3),
    total numeric(25,3),
    discount_percent numeric(25,3),
    discount_amount numeric(25,3),
    shipping_amount numeric(25,3),
    tax_amount double precision
);


ALTER TABLE public.quotefact OWNER TO postgres;

--
-- Name: quoteline_idquoteline_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE quoteline_idquoteline_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.quoteline_idquoteline_seq OWNER TO postgres;

--
-- Name: quoteline; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quoteline (
    idquoteline bigint DEFAULT nextval('quoteline_idquoteline_seq'::regclass) NOT NULL,
    quoteid bigint,
    productid bigint,
    creatorid bigint,
    ownerid bigint,
    accountid bigint,
    vendorid bigint,
    createdon bigint,
    closedon bigint,
    sequence_no integer,
    tax1percent numeric(7,3),
    tax2percent numeric(7,3),
    tax3percent numeric(7,3),
    quantity numeric(25,3),
    unitprice numeric(25,3),
    extendedallowance numeric(25,3),
    extendedcost numeric(25,3),
    extendeddiscountpercent numeric(16,2),
    extendeddiscount numeric(16,2),
    extendedgross numeric(25,3),
    extendednet numeric(25,3),
    contribution numeric(25,3),
    taxtotal numeric(25,3),
    tax1amount numeric(25,3),
    tax2amount numeric(25,3),
    tax3amount numeric(25,3),
    contactid bigint
);


ALTER TABLE public.quoteline OWNER TO postgres;

--
-- Name: salesorder_idsalesorder_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE salesorder_idsalesorder_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.salesorder_idsalesorder_seq OWNER TO postgres;

--
-- Name: salesorder; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE salesorder (
    idsalesorder bigint DEFAULT nextval('salesorder_idsalesorder_seq'::regclass) NOT NULL,
    potentialid bigint,
    quoteid bigint,
    accountid bigint,
    subject character varying(100),
    customerno character varying(100),
    creatorid bigint,
    ownerid bigint,
    createdon bigint,
    duedate bigint,
    carrier character varying(200),
    taxtype character varying(25),
    crmid bigint,
    contactid bigint,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    vendorterms character varying(100),
    type character varying(100),
    purchaseorder character varying(200),
    sostatus character varying(200),
    bill_city character varying(30),
    bill_code character varying(30),
    bill_country character varying(30),
    bill_state character varying(30),
    bill_street character varying(250),
    bill_pobox character varying(30),
    ship_city character varying(30),
    ship_code character varying(30),
    ship_country character varying(30),
    ship_state character varying(30),
    ship_street character varying(250),
    ship_pobox character varying(30),
    pending character varying(200),
    adjustment numeric(25,3),
    salescommission numeric(25,3),
    exciseduty numeric(25,3),
    total numeric(25,3),
    subtotal numeric(25,3),
    discount_percent numeric(25,3),
    discount_amount numeric(25,3),
    shipping_amount numeric(25,3),
    tax_amount double precision,
    salesorderno character varying(100)
);


ALTER TABLE public.salesorder OWNER TO postgres;

--
-- Name: salesorderfact_idsalesorderfact_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE salesorderfact_idsalesorderfact_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.salesorderfact_idsalesorderfact_seq OWNER TO postgres;

--
-- Name: salesorderfact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE salesorderfact (
    idsalesorderfact bigint DEFAULT nextval('salesorderfact_idsalesorderfact_seq'::regclass) NOT NULL,
    potentialid bigint,
    quoteid bigint,
    accountid bigint,
    subject character varying(100),
    creatorid bigint,
    ownerid bigint,
    createdon bigint,
    closedon bigint,
    elapsedtime integer,
    duedate bigint,
    st_created integer,
    st_created_date bigint,
    st_approved integer,
    st_approved_date bigint,
    st_delivered integer,
    st_delivered_date bigint,
    st_cancelled integer,
    st_cancelled_date bigint,
    taxtype character varying(25),
    salesorderid bigint,
    contactid bigint,
    purchaseorder character varying(200),
    sostatus character varying(200),
    adjustment numeric(25,3),
    salescommission numeric(25,3),
    exciseduty numeric(25,3),
    total numeric(25,3),
    subtotal numeric(25,3),
    discount_percent numeric(25,3),
    discount_amount numeric(25,3),
    shipping_amount numeric(25,3),
    tax_amount double precision
);


ALTER TABLE public.salesorderfact OWNER TO postgres;

--
-- Name: soline_idsoline_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE soline_idsoline_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.soline_idsoline_seq OWNER TO postgres;

--
-- Name: soline; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE soline (
    idsoline bigint DEFAULT nextval('soline_idsoline_seq'::regclass) NOT NULL,
    salesorderid bigint,
    productid bigint,
    creatorid bigint,
    ownerid bigint,
    accountid bigint,
    vendorid bigint,
    createdon bigint,
    closedon bigint,
    sequence_no integer,
    tax1percent numeric(7,3),
    tax2percent numeric(7,3),
    tax3percent numeric(7,3),
    quantity numeric(25,3),
    unitprice numeric(25,3),
    extendedallowance numeric(25,3),
    extendedcost numeric(25,3),
    extendeddiscountpercent numeric(16,2),
    extendeddiscount numeric(16,2),
    extendedgross numeric(25,3),
    extendednet numeric(25,3),
    contribution numeric(25,3),
    taxtotal numeric(25,3),
    tax1amount numeric(25,3),
    tax2amount numeric(25,3),
    tax3amount numeric(25,3),
    contactid bigint
);


ALTER TABLE public.soline OWNER TO postgres;

--
-- Name: support_idsupport_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE support_idsupport_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.support_idsupport_seq OWNER TO postgres;

--
-- Name: support; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE support (
    idsupport bigint DEFAULT nextval('support_idsupport_seq'::regclass) NOT NULL,
    productid bigint,
    vendorid bigint,
    status character varying(200),
    elapsedtime integer,
    waitingtime integer,
    worktime integer,
    creatorid bigint,
    ownerid bigint,
    createdon bigint,
    closedon bigint,
    helpdeskid bigint,
    contactid bigint,
    accountid bigint,
    fechamaxima bigint
);


ALTER TABLE public.support OWNER TO postgres;

--
-- Name: timecard; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE timecard (
    idtimecard bigint NOT NULL,
    ticketid bigint,
    creatorid bigint,
    workerid bigint,
    createdon bigint,
    vendorid bigint,
    productid bigint,
    contactid bigint,
    accountid bigint,
    workdate bigint,
    worktime time without time zone,
    units numeric(10,3),
    type character varying(200)
);


ALTER TABLE public.timecard OWNER TO postgres;

--
-- Name: user_iduser_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_iduser_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.user_iduser_seq OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "user" (
    iduser bigint DEFAULT nextval('user_iduser_seq'::regclass) NOT NULL,
    user_name character varying(255),
    department character varying(50),
    userid bigint,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    address_city character varying(100),
    address_country character varying(25),
    address_postalcode character varying(9),
    address_state character varying(100),
    address_street character varying(150),
    createdon bigint,
    deleted integer,
    email1 character varying(100),
    email2 character varying(100),
    first_name character varying(30),
    is_admin character varying(3),
    last_name character varying(30),
    phone_fax character varying(50),
    phone_home character varying(50),
    phone_mobile character varying(50),
    phone_other character varying(50),
    phone_work character varying(50),
    status character varying(25),
    title character varying(50),
    yahoo_id character varying(100),
    currency_id bigint,
    reports_to_id bigint,
    accesskey character varying(36)
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: vendor_idvendor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vendor_idvendor_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.vendor_idvendor_seq OWNER TO postgres;

--
-- Name: vendor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vendor (
    idvendor bigint DEFAULT nextval('vendor_idvendor_seq'::regclass) NOT NULL,
    createdon bigint,
    creatorid bigint,
    ownerid bigint,
    vendorname character varying(100),
    phone character varying(100),
    email character varying(100),
    website character varying(100),
    category character varying(50),
    city character varying(30),
    state character varying(30),
    country character varying(100),
    crmid bigint,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    glacct character varying(200),
    street character varying(218),
    postalcode character varying(100),
    vendorno character varying(100),
    emailsoporte character varying(50),
    emailtecnico character varying(50)
);


ALTER TABLE public.vendor OWNER TO postgres;

--
-- Name: account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (idaccount);


--
-- Name: campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY campaign
    ADD CONSTRAINT campaign_pkey PRIMARY KEY (idcampaign);


--
-- Name: contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (idcontact);


--
-- Name: currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (idcurrency);


--
-- Name: daytime_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY daytime
    ADD CONSTRAINT daytime_pkey PRIMARY KEY (iddaytime);


--
-- Name: event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_pkey PRIMARY KEY (idevent);


--
-- Name: faq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY faq
    ADD CONSTRAINT faq_pkey PRIMARY KEY (idfaq);


--
-- Name: helpdesk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY helpdesk
    ADD CONSTRAINT helpdesk_pkey PRIMARY KEY (idhelpdesk);


--
-- Name: invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (idinvoice);


--
-- Name: invoicefact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY invoicefact
    ADD CONSTRAINT invoicefact_pkey PRIMARY KEY (idinvoicefact);


--
-- Name: invoiceline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY invoiceline
    ADD CONSTRAINT invoiceline_pkey PRIMARY KEY (idinvoiceline);


--
-- Name: lead_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lead
    ADD CONSTRAINT lead_pkey PRIMARY KEY (idlead);


--
-- Name: marketing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY marketing
    ADD CONSTRAINT marketing_pkey PRIMARY KEY (idmarketing);


--
-- Name: oportunity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oportunity
    ADD CONSTRAINT oportunity_pkey PRIMARY KEY (idoportunity);


--
-- Name: poline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY poline
    ADD CONSTRAINT poline_pkey PRIMARY KEY (idpoline);


--
-- Name: potential_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY potential
    ADD CONSTRAINT potential_pkey PRIMARY KEY (idpotential);


--
-- Name: price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY price
    ADD CONSTRAINT price_pkey PRIMARY KEY (idprice);


--
-- Name: pricebook_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pricebook
    ADD CONSTRAINT pricebook_pkey PRIMARY KEY (idpricebook);


--
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (idproduct);


--
-- Name: purchaseorder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY purchaseorder
    ADD CONSTRAINT purchaseorder_pkey PRIMARY KEY (idpurchaseorder);


--
-- Name: purchaseorderfact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY purchaseorderfact
    ADD CONSTRAINT purchaseorderfact_pkey PRIMARY KEY (idpurchaseorderfact);


--
-- Name: quote_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quote
    ADD CONSTRAINT quote_pkey PRIMARY KEY (idquote);


--
-- Name: quotefact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quotefact
    ADD CONSTRAINT quotefact_pkey PRIMARY KEY (idquotefact);


--
-- Name: quoteline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quoteline
    ADD CONSTRAINT quoteline_pkey PRIMARY KEY (idquoteline);


--
-- Name: salesorder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY salesorder
    ADD CONSTRAINT salesorder_pkey PRIMARY KEY (idsalesorder);


--
-- Name: salesorderfact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY salesorderfact
    ADD CONSTRAINT salesorderfact_pkey PRIMARY KEY (idsalesorderfact);


--
-- Name: soline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY soline
    ADD CONSTRAINT soline_pkey PRIMARY KEY (idsoline);


--
-- Name: support_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY support
    ADD CONSTRAINT support_pkey PRIMARY KEY (idsupport);


--
-- Name: timecard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY timecard
    ADD CONSTRAINT timecard_pkey PRIMARY KEY (idtimecard);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (iduser);


--
-- Name: vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vendor
    ADD CONSTRAINT vendor_pkey PRIMARY KEY (idvendor);


--
-- Name: contact_contact_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX contact_contact_fkindex1 ON contact USING btree (vendorid);


--
-- Name: faq_faq_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX faq_faq_fkindex1 ON faq USING btree (product_id);


--
-- Name: helpdesk_helpdesk_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX helpdesk_helpdesk_fkindex1 ON helpdesk USING btree (creatorid);


--
-- Name: helpdesk_helpdesk_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX helpdesk_helpdesk_fkindex2 ON helpdesk USING btree (ownerid);


--
-- Name: helpdesk_helpdesk_fkindex3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX helpdesk_helpdesk_fkindex3 ON helpdesk USING btree (accountid);


--
-- Name: helpdesk_helpdesk_fkindex4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX helpdesk_helpdesk_fkindex4 ON helpdesk USING btree (contactid);


--
-- Name: helpdesk_helpdesk_fkindex5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX helpdesk_helpdesk_fkindex5 ON helpdesk USING btree (productid);


--
-- Name: helpdesk_helpdesk_fkindex6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX helpdesk_helpdesk_fkindex6 ON helpdesk USING btree (vendorid);


--
-- Name: helpdesk_helpdesk_fkindex8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX helpdesk_helpdesk_fkindex8 ON helpdesk USING btree (createdon);


--
-- Name: idx_account_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_account_lookup ON account USING btree (crmid);


--
-- Name: idx_campaign_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_campaign_lookup ON campaign USING btree (crmid);


--
-- Name: idx_contact_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_contact_lookup ON contact USING btree (crmid);


--
-- Name: idx_currency_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_currency_lookup ON currency USING btree (currencyid);


--
-- Name: idx_event_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_event_lookup ON event USING btree (crmid);


--
-- Name: idx_faq_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_faq_lookup ON faq USING btree (crmid);


--
-- Name: idx_helpdesk_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_helpdesk_lookup ON helpdesk USING btree (crmid);


--
-- Name: idx_invoice_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_invoice_lookup ON invoice USING btree (crmid);


--
-- Name: idx_invoicefact_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_invoicefact_lookup ON invoicefact USING btree (invoiceid);


--
-- Name: idx_invoiceline_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_invoiceline_lookup ON invoiceline USING btree (invoiceid, productid, sequence_no);


--
-- Name: idx_lead_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_lead_lookup ON lead USING btree (crmid);


--
-- Name: idx_poline_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_poline_lookup ON poline USING btree (purchaseorderid, productid, sequence_no);


--
-- Name: idx_potential_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_potential_lookup ON potential USING btree (crmid);


--
-- Name: idx_pricebook_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_pricebook_lookup ON pricebook USING btree (crmid);


--
-- Name: idx_product_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_product_lookup ON product USING btree (crmid);


--
-- Name: idx_purchaseorder_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_purchaseorder_lookup ON purchaseorder USING btree (crmid);


--
-- Name: idx_purchaseorderfact_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_purchaseorderfact_lookup ON purchaseorderfact USING btree (purchaseorderid);


--
-- Name: idx_quote_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_quote_lookup ON quote USING btree (crmid);


--
-- Name: idx_quotefact_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_quotefact_lookup ON quotefact USING btree (quoteid);


--
-- Name: idx_quoteline_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_quoteline_lookup ON quoteline USING btree (quoteid, productid, sequence_no);


--
-- Name: idx_salesorder_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_salesorder_lookup ON salesorder USING btree (crmid);


--
-- Name: idx_salesorderfact_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_salesorderfact_lookup ON salesorderfact USING btree (salesorderid);


--
-- Name: idx_soline_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_soline_lookup ON soline USING btree (salesorderid, productid, sequence_no);


--
-- Name: idx_support_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_support_lookup ON support USING btree (helpdeskid);


--
-- Name: idx_user_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_user_lookup ON "user" USING btree (userid);


--
-- Name: idx_vendor_lookup; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_vendor_lookup ON vendor USING btree (crmid);


--
-- Name: invoice_invoice_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX invoice_invoice_fkindex1 ON invoice USING btree (salesorderid);


--
-- Name: invoiceline_helpdesk_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX invoiceline_helpdesk_fkindex1 ON invoiceline USING btree (creatorid);


--
-- Name: invoiceline_helpdesk_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX invoiceline_helpdesk_fkindex2 ON invoiceline USING btree (ownerid);


--
-- Name: invoiceline_helpdesk_fkindex3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX invoiceline_helpdesk_fkindex3 ON invoiceline USING btree (accountid);


--
-- Name: invoiceline_helpdesk_fkindex5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX invoiceline_helpdesk_fkindex5 ON invoiceline USING btree (productid);


--
-- Name: invoiceline_helpdesk_fkindex6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX invoiceline_helpdesk_fkindex6 ON invoiceline USING btree (vendorid);


--
-- Name: invoiceline_helpdesk_fkindex7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX invoiceline_helpdesk_fkindex7 ON invoiceline USING btree (closedon);


--
-- Name: invoiceline_helpdesk_fkindex8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX invoiceline_helpdesk_fkindex8 ON invoiceline USING btree (createdon);


--
-- Name: invoiceline_invoiceline_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX invoiceline_invoiceline_fkindex2 ON invoiceline USING btree (invoiceid);


--
-- Name: marketing_helpdesk_fkindex5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX marketing_helpdesk_fkindex5 ON marketing USING btree (productid);


--
-- Name: marketing_helpdesk_fkindex6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX marketing_helpdesk_fkindex6 ON marketing USING btree (vendorid);


--
-- Name: marketing_helpdesk_fkindex8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX marketing_helpdesk_fkindex8 ON marketing USING btree (senton);


--
-- Name: marketing_invoiceline_fkindex8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX marketing_invoiceline_fkindex8 ON marketing USING btree (invoiceid);


--
-- Name: marketing_marketing_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX marketing_marketing_fkindex1 ON marketing USING btree (leadid);


--
-- Name: marketing_marketing_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX marketing_marketing_fkindex2 ON marketing USING btree (campaignid);


--
-- Name: marketing_marketing_fkindex3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX marketing_marketing_fkindex3 ON marketing USING btree (invoiceid);


--
-- Name: marketing_marketing_fkindex5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX marketing_marketing_fkindex5 ON marketing USING btree (potentialid);


--
-- Name: marketing_marketing_fkindex6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX marketing_marketing_fkindex6 ON marketing USING btree (productid);


--
-- Name: marketing_marketing_fkindex8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX marketing_marketing_fkindex8 ON marketing USING btree (contactid);


--
-- Name: oportunity_helpdesk_fkindex5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oportunity_helpdesk_fkindex5 ON oportunity USING btree (productid);


--
-- Name: oportunity_helpdesk_fkindex6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oportunity_helpdesk_fkindex6 ON oportunity USING btree (vendorid);


--
-- Name: oportunity_invoiceline_fkindex8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oportunity_invoiceline_fkindex8 ON oportunity USING btree (invoiceid);


--
-- Name: oportunity_marketing_fkindex10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oportunity_marketing_fkindex10 ON oportunity USING btree (campaignid);


--
-- Name: oportunity_marketing_fkindex8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oportunity_marketing_fkindex8 ON oportunity USING btree (contactid);


--
-- Name: oportunity_marketing_fkindex9; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oportunity_marketing_fkindex9 ON oportunity USING btree (potentialid);


--
-- Name: oportunity_oportunity_fkindex10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oportunity_oportunity_fkindex10 ON oportunity USING btree (accountid);


--
-- Name: oportunity_oportunity_fkindex11; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oportunity_oportunity_fkindex11 ON oportunity USING btree (quoteid);


--
-- Name: oportunity_oportunity_fkindex12; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX oportunity_oportunity_fkindex12 ON oportunity USING btree (salesorderid);


--
-- Name: poline_helpdesk_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX poline_helpdesk_fkindex1 ON poline USING btree (creatorid);


--
-- Name: poline_helpdesk_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX poline_helpdesk_fkindex2 ON poline USING btree (ownerid);


--
-- Name: poline_helpdesk_fkindex3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX poline_helpdesk_fkindex3 ON poline USING btree (contactid);


--
-- Name: poline_helpdesk_fkindex5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX poline_helpdesk_fkindex5 ON poline USING btree (productid);


--
-- Name: poline_helpdesk_fkindex6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX poline_helpdesk_fkindex6 ON poline USING btree (vendorid);


--
-- Name: poline_helpdesk_fkindex7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX poline_helpdesk_fkindex7 ON poline USING btree (closedon);


--
-- Name: poline_helpdesk_fkindex8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX poline_helpdesk_fkindex8 ON poline USING btree (createdon);


--
-- Name: poline_poline_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX poline_poline_fkindex2 ON poline USING btree (purchaseorderid);


--
-- Name: price_helpdesk_fkindex5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX price_helpdesk_fkindex5 ON price USING btree (productid);


--
-- Name: price_helpdesk_fkindex6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX price_helpdesk_fkindex6 ON price USING btree (vendorid);


--
-- Name: price_helpdesk_fkindex8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX price_helpdesk_fkindex8 ON price USING btree (createdon);


--
-- Name: price_price_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX price_price_fkindex1 ON price USING btree (pricebookid);


--
-- Name: price_price_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX price_price_fkindex2 ON price USING btree (productid);


--
-- Name: price_price_fkindex3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX price_price_fkindex3 ON price USING btree (vendorid);


--
-- Name: price_timecard_fkindex8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX price_timecard_fkindex8 ON price USING btree (modifiedon);


--
-- Name: purchaseorder_purchaseorder_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX purchaseorder_purchaseorder_fkindex1 ON purchaseorder USING btree (vendorid);


--
-- Name: quote_quote_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quote_quote_fkindex1 ON quote USING btree (potentialid);


--
-- Name: quoteline_helpdesk_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quoteline_helpdesk_fkindex1 ON quoteline USING btree (creatorid);


--
-- Name: quoteline_helpdesk_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quoteline_helpdesk_fkindex2 ON quoteline USING btree (ownerid);


--
-- Name: quoteline_helpdesk_fkindex3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quoteline_helpdesk_fkindex3 ON quoteline USING btree (accountid);


--
-- Name: quoteline_helpdesk_fkindex5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quoteline_helpdesk_fkindex5 ON quoteline USING btree (productid);


--
-- Name: quoteline_helpdesk_fkindex6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quoteline_helpdesk_fkindex6 ON quoteline USING btree (vendorid);


--
-- Name: quoteline_helpdesk_fkindex7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quoteline_helpdesk_fkindex7 ON quoteline USING btree (closedon);


--
-- Name: quoteline_helpdesk_fkindex8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quoteline_helpdesk_fkindex8 ON quoteline USING btree (createdon);


--
-- Name: quoteline_quoteline_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX quoteline_quoteline_fkindex2 ON quoteline USING btree (quoteid);


--
-- Name: salesorder_salesorder_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX salesorder_salesorder_fkindex1 ON salesorder USING btree (quoteid);


--
-- Name: salesorder_salesorder_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX salesorder_salesorder_fkindex2 ON salesorder USING btree (potentialid);


--
-- Name: soline_helpdesk_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX soline_helpdesk_fkindex1 ON soline USING btree (creatorid);


--
-- Name: soline_helpdesk_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX soline_helpdesk_fkindex2 ON soline USING btree (ownerid);


--
-- Name: soline_helpdesk_fkindex3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX soline_helpdesk_fkindex3 ON soline USING btree (accountid);


--
-- Name: soline_helpdesk_fkindex5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX soline_helpdesk_fkindex5 ON soline USING btree (productid);


--
-- Name: soline_helpdesk_fkindex6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX soline_helpdesk_fkindex6 ON soline USING btree (vendorid);


--
-- Name: soline_helpdesk_fkindex7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX soline_helpdesk_fkindex7 ON soline USING btree (closedon);


--
-- Name: soline_helpdesk_fkindex8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX soline_helpdesk_fkindex8 ON soline USING btree (createdon);


--
-- Name: soline_soline_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX soline_soline_fkindex2 ON soline USING btree (salesorderid);


--
-- Name: timecard_helpdesk_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX timecard_helpdesk_fkindex1 ON timecard USING btree (creatorid);


--
-- Name: timecard_helpdesk_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX timecard_helpdesk_fkindex2 ON timecard USING btree (workerid);


--
-- Name: timecard_helpdesk_fkindex3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX timecard_helpdesk_fkindex3 ON timecard USING btree (accountid);


--
-- Name: timecard_helpdesk_fkindex4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX timecard_helpdesk_fkindex4 ON timecard USING btree (contactid);


--
-- Name: timecard_helpdesk_fkindex5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX timecard_helpdesk_fkindex5 ON timecard USING btree (productid);


--
-- Name: timecard_helpdesk_fkindex6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX timecard_helpdesk_fkindex6 ON timecard USING btree (vendorid);


--
-- Name: timecard_helpdesk_fkindex8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX timecard_helpdesk_fkindex8 ON timecard USING btree (createdon);


--
-- Name: timecard_timecard_fkindex8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX timecard_timecard_fkindex8 ON timecard USING btree (workdate);


--
-- Name: timecard_timecard_fkindex9; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX timecard_timecard_fkindex9 ON timecard USING btree (ticketid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

