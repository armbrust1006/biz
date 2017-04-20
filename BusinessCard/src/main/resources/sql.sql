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
	m_id VARCHAR2(20) NOT NULL, /* 아이디 */
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
		CONSTRAINT PK_Card
		PRIMARY KEY (
			m_id,
			cardnum
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

ALTER TABLE MyCardIndex
	ADD
		CONSTRAINT PK_MyCardIndex
		PRIMARY KEY (
			cardnum
		);

/* 명함 이미지 */
CREATE TABLE CardImage (
	m_id VARCHAR2(20) NOT NULL, /* 아이디 */
	cardnum NUMBER NOT NULL, /* 일련번호 */
	cardtype VARCHAR2(5) NOT NULL, /* 구분 */
	imagePath VARCHAR2(200) DEFAULT sysdate NOT NULL, /* 명함경로 */
	inputdate DATE DEFAULT sysdate NOT NULL, /* 등록날짜 */
	shared VARCHAR2(5) DEFAULT 'n' NOT NULL /* 공개 여부 */
);

ALTER TABLE CardImage
	ADD
		CONSTRAINT PK_CardImage
		PRIMARY KEY (
			m_id,
			cardnum
		);

ALTER TABLE CardImage
	ADD
		CONSTRAINT UK_CardImage
		UNIQUE (
			cardnum
		);

/* 공유 명함첩 */
CREATE TABLE CardBooks (
	book_num NUMBER NOT NULL, /* 명함첩번호 */
	m_id VARCHAR2(20) NOT NULL, /* 아이디 */
	book_name VARCHAR2(50) NOT NULL, /* 방이름 */
	grade VARCHAR2(20) NOT NULL, /* 회원등급 */
	inputdate DATE DEFAULT sysdate /* 등록날짜 */
);

ALTER TABLE CardBooks
	ADD
		CONSTRAINT PK_CardBooks
		PRIMARY KEY (
			book_num,
			m_id
		);

/* 공유 명함 목록 */
CREATE TABLE SharedCard (
	book_num NUMBER NOT NULL, /* 명함첩번호 */
	m_id VARCHAR2(20) NOT NULL, /* 아이디 */
	cardnum NUMBER NOT NULL, /* 일련번호 */
	inputdate DATE DEFAULT sysdate NOT NULL /* 등록날짜 */
);

ALTER TABLE SharedCard
	ADD
		CONSTRAINT PK_SharedCard
		PRIMARY KEY (
			book_num
		);

/* 공유 명함 상세 */
CREATE TABLE Reply (
	book_num NUMBER NOT NULL, /* 명함첩번호 */
	m_id VARCHAR2(20) NOT NULL, /* 아이디 */
	cardnum NUMBER NOT NULL, /* 일련번호 */
	reply_num NUMBER NOT NULL, /* 댓글번호 */
	inputdate DATE DEFAULT sysdate NOT NULL, /* 등록날짜 */
	reply VARCHAR2(100) NOT NULL /* 댓글 */
);

ALTER TABLE Reply
	ADD
		CONSTRAINT PK_Reply
		PRIMARY KEY (
			book_num
		);

ALTER TABLE Reply
	ADD
		CONSTRAINT UK_Reply
		UNIQUE (
			reply_num
		);

/* 명함 메모 */
CREATE TABLE CardNote (
	m_id VARCHAR2(20) NOT NULL, /* 아이디 */
	cardnum NUMBER NOT NULL, /* 일련번호 */
	inputdate DATE DEFAULT sysdate
 NOT NULL, /* 등록날짜 */
	startdate DATE, /* 이벤트시작 */
	enddate DATE, /* 이벤트종료 */
	note VARCHAR2(2000) NOT NULL /* 메모 */
);

ALTER TABLE CardNote
	ADD
		CONSTRAINT PK_CardNote
		PRIMARY KEY (
			m_id
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

ALTER TABLE Message
	ADD
		CONSTRAINT PK_Message
		PRIMARY KEY (
			targetid
		);

/* 공유 게시판 */
CREATE TABLE Board (
	book_num NUMBER NOT NULL, /* 명함첩번호 */
	m_id VARCHAR2(20) NOT NULL, /* 아이디 */
	boardnum NUMBER NOT NULL, /* 게시판 번호 */
	board_title VARCHAR2(100) NOT NULL, /* 게시판 제목 */
	board_content VARCHAR2(2000) NOT NULL, /* 게시판 내용 */
	inputdate DATE DEFAULT sysdate, /* 등록날짜 */
	board_hits NUMBER /* 게시판 조회수 */
);

ALTER TABLE Board
	ADD
		CONSTRAINT PK_Board
		PRIMARY KEY (
			book_num
		);

/* OCR매칭정보 */
CREATE TABLE OCRMachingData (
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

ALTER TABLE Card
	ADD
		CONSTRAINT FK_CardImage_TO_Card
		FOREIGN KEY (
			m_id,
			cardnum
		)
		REFERENCES CardImage (
			m_id,
			cardnum
		);

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

ALTER TABLE MyCardIndex
	ADD
		CONSTRAINT FK_CardImage_TO_MyCardIndex
		FOREIGN KEY (
			m_id,
			cardnum
		)
		REFERENCES CardImage (
			m_id,
			cardnum
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

ALTER TABLE CardBooks
	ADD
		CONSTRAINT FK_Member_TO_CardBooks
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
			book_num,
			m_id
		)
		REFERENCES CardBooks (
			book_num,
			m_id
		)
		ON DELETE CASCADE;

ALTER TABLE Reply
	ADD
		CONSTRAINT FK_SharedCard_TO_Reply
		FOREIGN KEY (
			book_num
		)
		REFERENCES SharedCard (
			book_num
		)
		ON DELETE CASCADE;

ALTER TABLE CardNote
	ADD
		CONSTRAINT FK_CardImage_TO_CardNote
		FOREIGN KEY (
			m_id,
			cardnum
		)
		REFERENCES CardImage (
			m_id,
			cardnum
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
			book_num,
			m_id
		)
		REFERENCES CardBooks (
			book_num,
			m_id
		)
		ON DELETE CASCADE;
    
		
/* 시퀸스 */
drop SEQUENCE cardnum_seq;
drop SEQUENCE replynum_seq;
drop SEQUENCE board_seq;
drop SEQUENCE cardbooks_seq;

CREATE SEQUENCE cardnum_seq;
CREATE SEQUENCE replynum_seq;
CREATE SEQUENCE board_seq;
CREATE SEQUENCE cardbooks_seq;