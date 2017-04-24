/* 회원정보 */
DROP TABLE Member 
   CASCADE CONSTRAINTS;

/* 명함정보 */
DROP TABLE Card 
   CASCADE CONSTRAINTS;

/* 보유명함목록 */
DROP TABLE MyCardIndex 
   CASCADE CONSTRAINTS;

/* 명함 이미지 */
DROP TABLE CardImage 
   CASCADE CONSTRAINTS;

/* 공유 명함첩 */
DROP TABLE CardBooks 
   CASCADE CONSTRAINTS;

/* 공유 명함 목록 */
DROP TABLE SharedCard 
   CASCADE CONSTRAINTS;

/* 공유 명함 상세 */
DROP TABLE Reply 
   CASCADE CONSTRAINTS;

/* 명함 메모 */
DROP TABLE CardNote 
   CASCADE CONSTRAINTS;

/* 메시지 */
DROP TABLE Message 
   CASCADE CONSTRAINTS;

/* 공유 게시판 */
DROP TABLE Board 
   CASCADE CONSTRAINTS;

/* OCR매칭정보 */
DROP TABLE OCRMachining 
   CASCADE CONSTRAINTS;

/* 명함첩 회원 */
DROP TABLE CardBookMembers 
   CASCADE CONSTRAINTS;
   
DROP SEQUENCE cardnum_seq;
DROP SEQUENCE replynum_seq;
DROP SEQUENCE board_seq;
DROP SEQUENCE cardbooks_seq;
DROP SEQUENCE shared_cardnum_seq;

/* 이 밑부터 테이블 생성 */

/* 회원정보 */
CREATE TABLE Member (
   m_id VARCHAR2(20) NOT NULL, /* 아이디 */
   m_password VARCHAR2(20) NOT NULL, /* 비밀번호 */
   m_email VARCHAR2(40) NOT NULL, /* 이메일 */
   m_name VARCHAR2(20) NOT NULL /* 이름 */
);

ALTER TABLE Member
   ADD
      CONSTRAINT PK_Member
      PRIMARY KEY (
         m_id
      );

ALTER TABLE Member
   ADD
      CONSTRAINT UK_Member
      UNIQUE (
         m_email
      );

/* 명함정보 */
CREATE TABLE Card (
   cardnum NUMBER NOT NULL, /* 일련번호 */
   name VARCHAR2(50) NOT NULL, /* 이름 */
   company VARCHAR2(50) NOT NULL, /* 회사명 */
   depart VARCHAR2(20), /* 부서 */
   position VARCHAR2(20), /* 직위 */
   address VARCHAR2(255), /* 주소 */
   email VARCHAR2(40), /* 이메일 */
   telephone VARCHAR2(30), /* 전화번호 */
   fax VARCHAR2(30), /* 팩스 */
   mobile VARCHAR2(30) NOT NULL, /* 휴대폰 */
   language VARCHAR2(20) NOT NULL, /* 해당언어 */
   logoimg VARCHAR2(200) /* 로고 */
);

ALTER TABLE Card
   ADD
      CONSTRAINT UK_Card
      UNIQUE (
         cardnum
      );

/* 보유명함목록 */
CREATE TABLE MyCardIndex (
   m_id VARCHAR2(20) NOT NULL, /* 아이디 */
   cardnum NUMBER NOT NULL, /* 일련번호 */
   inputdate DATE DEFAULT sysdate NOT NULL /* 등록날짜 */
);

/* 명함 이미지 */
CREATE TABLE CardImage (
   cardnum NUMBER NOT NULL, /* 일련번호 */
   m_id VARCHAR2(20) NOT NULL, /* 아이디 */
   cardtype VARCHAR2(10) NOT NULL, /* 구분 */
   imagePath VARCHAR2(200) DEFAULT sysdate NOT NULL, /* 명함경로 */
   inputdate DATE DEFAULT sysdate NOT NULL, /* 등록날짜 */
   shared VARCHAR2(5) DEFAULT 'n' NOT NULL, /* 공개 여부 */
   layout_num NUMBER(1) NOT NULL /* 레이아웃번호 */
);

ALTER TABLE CardImage
   ADD
      CONSTRAINT PK_CardImage
      PRIMARY KEY (
         cardnum
      );

/* 공유 명함첩 */
CREATE TABLE CardBooks (
   book_num NUMBER NOT NULL, /* 명함첩번호 */
   book_name VARCHAR2(50) NOT NULL, /* 방이름 */
   inputdate DATE DEFAULT sysdate NOT NULL, /* 생성날짜 */
   book_master VARCHAR2(20) NOT NULL /* 방장 */
);

ALTER TABLE CardBooks
   ADD
      CONSTRAINT PK_CardBooks
      PRIMARY KEY (
         book_num
      );

/* 공유 명함 목록 */
CREATE TABLE SharedCard (
   shared_cardnum <지정 되지 않음> NOT NULL, /* 공유 명함 카드 */
   book_num NUMBER NOT NULL, /* 명함첩번호 */
   cardnum NUMBER NOT NULL, /* 일련번호 */
   m_id VARCHAR2(20) NOT NULL, /* 아이디 */
   inputdate DATE DEFAULT sysdate NOT NULL /* 등록날짜 */
);

ALTER TABLE SharedCard
   ADD
      CONSTRAINT PK_SharedCard
      PRIMARY KEY (
         shared_cardnum
      );

/* 공유 명함 상세 */
CREATE TABLE Reply (
   reply_num NUMBER NOT NULL, /* 댓글번호 */
   shared_cardnum <지정 되지 않음> NOT NULL, /* 공유 명함 카드 */
   cardnum NUMBER NOT NULL, /* 일련번호 */
   m_id VARCHAR2(20) NOT NULL, /* 아이디 */
   inputdate DATE DEFAULT sysdate NOT NULL, /* 등록날짜 */
   reply VARCHAR2(100) NOT NULL /* 댓글 */
);

ALTER TABLE Reply
   ADD
      CONSTRAINT PK_Reply
      PRIMARY KEY (
         reply_num
      );

/* 명함 메모 */
CREATE TABLE CardNote (
   cardnum NUMBER NOT NULL, /* 일련번호 */
   m_id VARCHAR2(20) NOT NULL, /* 아이디 */
   inputdate DATE DEFAULT sysdate
 NOT NULL, /* 등록날짜 */
   startdate DATE, /* 이벤트시작 */
   enddate DATE, /* 이벤트종료 */
   note VARCHAR2(2000) NOT NULL /* 메모 */
);

/* 메시지 */
CREATE TABLE Message (
   targetid VARCHAR2(20) NOT NULL, /* 받는아이디 */
   sender VARCHAR2(20) NOT NULL, /* 보내는아이디 */
   message VARCHAR2(2000) NOT NULL, /* 내용 */
   senddate DATE DEFAULT sysdate NOT NULL, /* 보낸날 */
   opendate DATE, /* 연날 */
   type VARCHAR2(20), /* 초대장구분 */
   book_num NUMBER /* 명합첩번호 */
);

/* 공유 게시판 */
CREATE TABLE Board (
   boardnum NUMBER NOT NULL, /* 게시판 번호 */
   book_num NUMBER NOT NULL, /* 명함첩번호 */
   m_id VARCHAR2(20) NOT NULL, /* 아이디 */
   board_title VARCHAR2(100) NOT NULL, /* 게시판 제목 */
   board_content VARCHAR2(2000) NOT NULL, /* 게시판 내용 */
   inputdate DATE DEFAULT sysdate NOT NULL, /* 등록날짜 */
   board_hits NUMBER DEFAULT 0 NOT NULL /* 게시판 조회수 */
);

ALTER TABLE Board
   ADD
      CONSTRAINT PK_Board
      PRIMARY KEY (
         boardnum
      );

/* OCR매칭정보 */
CREATE TABLE OCRMachining (
   mach VARCHAR2(50), /* 명함 판별 */
   name VARCHAR2(50), /* 이름 */
   company VARCHAR2(50), /* 회사명 */
   depart VARCHAR2(20), /* 부서 */
   position VARCHAR2(20), /* 직위 */
   address VARCHAR2(255), /* 주소 */
   email VARCHAR2(40), /* 이메일 */
   telephone VARCHAR2(30), /* 전화번호 */
   fax VARCHAR2(30), /* 팩스 */
   mobile VARCHAR2(30) /* 휴대폰 */
);

/* 명함첩 회원 */
CREATE TABLE CardBookMembers (
   m_id VARCHAR2(20) NOT NULL, /* 아이디 */
   book_num NUMBER NOT NULL, /* 명함첩번호 */
   inputdate DATE DEFAULT sysdate NOT NULL, /* 가입날짜 */
   grade VARCHAR2(20) NOT NULL /* 회원등급 */
);

ALTER TABLE CardBookMembers
   ADD
      CONSTRAINT PK_CardBookMembers
      PRIMARY KEY (
      );

ALTER TABLE Card
   ADD
      CONSTRAINT FK_CardImage_TO_Card
      FOREIGN KEY (
         cardnum
      )
      REFERENCES CardImage (
         cardnum
      )
      ON DELETE CASCADE;

ALTER TABLE MyCardIndex
   ADD
      CONSTRAINT FK_CardImage_TO_MyCardIndex
      FOREIGN KEY (
         cardnum
      )
      REFERENCES CardImage (
         cardnum
      )
      ON DELETE CASCADE;

ALTER TABLE MyCardIndex
   ADD
      CONSTRAINT FK_Member_TO_MyCardIndex
      FOREIGN KEY (
         m_id
      )
      REFERENCES Member (
         m_id
      )
      ON DELETE CASCADE;

ALTER TABLE CardImage
   ADD
      CONSTRAINT FK_Member_TO_CardImage
      FOREIGN KEY (
         m_id
      )
      REFERENCES Member (
         m_id
      )
      ON DELETE CASCADE;

ALTER TABLE SharedCard
   ADD
      CONSTRAINT FK_CardBooks_TO_SharedCard
      FOREIGN KEY (
         book_num
      )
      REFERENCES CardBooks (
         book_num
      )
      ON DELETE CASCADE;

ALTER TABLE SharedCard
   ADD
      CONSTRAINT FK_CardImage_TO_SharedCard
      FOREIGN KEY (
         cardnum
      )
      REFERENCES CardImage (
         cardnum
      )
      ON DELETE CASCADE;

ALTER TABLE Reply
   ADD
      CONSTRAINT FK_SharedCard_TO_Reply
      FOREIGN KEY (
         shared_cardnum
      )
      REFERENCES SharedCard (
         shared_cardnum
      )
      ON DELETE CASCADE;

ALTER TABLE CardNote
   ADD
      CONSTRAINT FK_CardImage_TO_CardNote
      FOREIGN KEY (
         cardnum
      )
      REFERENCES CardImage (
         cardnum
      )
      ON DELETE CASCADE;

ALTER TABLE CardNote
   ADD
      CONSTRAINT FK_Member_TO_CardNote
      FOREIGN KEY (
         m_id
      )
      REFERENCES Member (
         m_id
      )
      ON DELETE CASCADE;

ALTER TABLE Message
   ADD
      CONSTRAINT FK_Member_TO_Message
      FOREIGN KEY (
         targetid
      )
      REFERENCES Member (
         m_id
      )
      ON DELETE CASCADE;

ALTER TABLE Board
   ADD
      CONSTRAINT FK_CardBooks_TO_Board
      FOREIGN KEY (
         book_num
      )
      REFERENCES CardBooks (
         book_num
      )
      ON DELETE CASCADE;

ALTER TABLE CardBookMembers
   ADD
      CONSTRAINT FK_CardBooks_TO_CardBookMembers
      FOREIGN KEY (
         book_num
      )
      REFERENCES CardBooks (
         book_num
      )
      ON DELETE CASCADE;

ALTER TABLE CardBookMembers
   ADD
      CONSTRAINT FK_Member_TO_CardBookMembers
      FOREIGN KEY (
         m_id
      )
      REFERENCES Member (
         m_id
      )
      ON DELETE CASCADE;
      
/* 시퀸스 */
CREATE SEQUENCE cardnum_seq;
CREATE SEQUENCE replynum_seq;
CREATE SEQUENCE board_seq;
CREATE SEQUENCE cardbooks_seq;
CREATE SEQUENCE shared_cardnum_seq;