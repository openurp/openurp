
alter schema edu_innovation rename to prac_innovation;
alter schema edu_award rename to stu_award;
alter schema std_job rename to stu_job;
alter schema edu_student rename to std_info;

alter schema edu_fee rename to std_fee;

create schema std_register;
alter table edu_student.registers set schema std_register;

create schema std_alter;
alter table edu_student.std_alteration_items set schema std_alter;
alter table edu_student.std_alterations set schema std_alter;

create schema std_transfer;
alter table edu_student.transfer_applies set schema std_transfer;
alter table edu_student.transfer_options set schema std_transfer;
alter table edu_student.transfer_schemes set schema std_transfer;
alter table edu_student.transfer_scopes set schema std_transfer;
alter table edu_student.transfer_scopes_grades set schema std_transfer;
alter table edu_student.transfer_scopes_majors set schema std_transfer;

create table std_fee.bills (semester_id integer not null, updated_at timestamp not null, payed integer not null, pay_at timestamp, std_id bigint not null, amount integer not null, id bigint not null, created_at timestamp not null, fee_type_id integer not null, depart_id integer not null, updated_by varchar(255) not null, invoice_code varchar(255), remark varchar(255));
create table std_fee.fee_types (id integer not null, begin_on date not null, end_on date, updated_at timestamp not null, code varchar(20) not null unique, en_name varchar(300), name varchar(100) not null, remark varchar(200));
create table std_fee.orders (pay_at timestamp, std_id bigint not null, amount integer not null, code varchar(50) not null unique, id bigint not null, bill_id bigint not null, status varchar(255) not null, created_at timestamp not null, pay_url varchar(500) not null, expired_at timestamp not null, channel varchar(255), remark varchar(255), paid boolean not null);
create table std_fee.tuition_configs (to_grade varchar(255) not null, amount integer not null, department_id integer, id integer not null, remark varchar(255), from_grade varchar(255) not null, fee_type_id integer not null, major_id bigint, level_id integer not null);


alter table edu_exam.exam_activities alter depart_arranged drop not null;
alter table edu_grade.ga_grade_states drop end_on cascade;
alter table edu_grade.ga_grade_states drop begin_on cascade;
alter table edu_grade.course_audit_results add column terms integer;
alter table edu_grade.course_audit_results alter terms set not null;
alter table edu_grade.course_grade_states drop begin_on cascade;
alter table edu_grade.course_grade_states drop end_on cascade;
alter table edu_grade.course_grade_states add column inputer_id bigint;
alter table edu_grade.course_grade_states add constraint fk_fp6qwhpeppjechny9bhtk0l2f foreign key (inputer_id) references base.users (id);
alter table edu_grade.group_audit_results add column remark varchar(255);
alter table edu_grade.plan_audit_results alter updates drop not null;
alter table edu_grade.exam_grade_states drop end_on cascade;
alter table edu_grade.exam_grade_states drop begin_on cascade;
alter table edu_grade.ga_grades add column remark varchar(255);
alter table edu_course.syllabuses add column audit_at timestamp;
alter table edu_course.syllabuses add column end_on date;
alter table edu_course.syllabuses alter end_on set not null;
alter table edu_course.syllabuses add column begin_on date;
alter table edu_course.syllabuses alter begin_on set not null;
alter table edu_course.syllabuses add column auditor_id bigint;
alter table edu_course.syllabuses alter passed drop not null;
alter table edu_course.syllabuses add constraint fk_982kh3ctxgx53t7ponrklk1sk foreign key (auditor_id) references base.users (id);
alter table base.rooms drop capacity cascade;
alter table base.users add column gender_id integer;
update base.users u set gender_id=(select p.gender_id from base.people p ,edu_base.students std where std.user_id=u.id and std.person_id=p.id);
update base.users u set gender_id=1 where gender_id is null;
alter table base.users alter gender_id set not null;
alter table base.users add column en_name varchar(255);
alter table base.users add constraint fk_tjqd54krxpiam3m1xb1mdp64f foreign key (gender_id) references code_gb.genders (id);
create table code_hb.fee_origins (id integer not null, begin_on date not null, code varchar(20) not null unique, en_name varchar(300), end_on date, name varchar(100) not null, remark varchar(200), updated_at timestamp not null);
comment on table code_hb.fee_origins is '费用来源';
comment on column code_hb.fee_origins.id is '非业务主键:auto_increment';
comment on column code_hb.fee_origins.begin_on is '生效日期';
comment on column code_hb.fee_origins.code is '代码';
comment on column code_hb.fee_origins.en_name is '英文名称';
comment on column code_hb.fee_origins.end_on is '失效日期';
comment on column code_hb.fee_origins.name is '名称';
comment on column code_hb.fee_origins.remark is '备注';
comment on column code_hb.fee_origins.updated_at is '修改时间';
alter table code_hb.fee_origins add constraint pk_pjb9g9qkf41txh2q10u0knayp primary key (id);
create table code_hb.unregistered_reasons (id integer not null, begin_on date not null, code varchar(20) not null unique, en_name varchar(300), end_on date, name varchar(100) not null, remark varchar(200), updated_at timestamp not null);
comment on table code_hb.unregistered_reasons is '未注册原因';
comment on column code_hb.unregistered_reasons.id is '非业务主键:auto_increment';
comment on column code_hb.unregistered_reasons.begin_on is '生效日期';
comment on column code_hb.unregistered_reasons.code is '代码';
comment on column code_hb.unregistered_reasons.en_name is '英文名称';
comment on column code_hb.unregistered_reasons.end_on is '失效日期';
comment on column code_hb.unregistered_reasons.name is '名称';
comment on column code_hb.unregistered_reasons.remark is '备注';
comment on column code_hb.unregistered_reasons.updated_at is '修改时间';
alter table code_hb.unregistered_reasons add constraint pk_a05jbnwecpcjh1vca74kq4u39 primary key (id);
create table code_hb.uncheckin_reasons (id integer not null, begin_on date not null, code varchar(20) not null unique, en_name varchar(300), end_on date, name varchar(100) not null, remark varchar(200), updated_at timestamp not null);
comment on table code_hb.uncheckin_reasons is '未报到原因';
comment on column code_hb.uncheckin_reasons.id is '非业务主键:auto_increment';
comment on column code_hb.uncheckin_reasons.begin_on is '生效日期';
comment on column code_hb.uncheckin_reasons.code is '代码';
comment on column code_hb.uncheckin_reasons.en_name is '英文名称';
comment on column code_hb.uncheckin_reasons.end_on is '失效日期';
comment on column code_hb.uncheckin_reasons.name is '名称';
comment on column code_hb.uncheckin_reasons.remark is '备注';
comment on column code_hb.uncheckin_reasons.updated_at is '修改时间';
alter table code_hb.uncheckin_reasons add constraint pk_b2456k7m08w83dfw2ofx5yvx primary key (id);
alter table code_hb.day_parts add column color varchar(255);
alter table code_hb.day_parts alter color set not null;
create table edu_program.program_doc_templates_types (program_doc_template_id integer not null, std_type_id integer not null);
comment on table edu_program.program_doc_templates_types is '文档对应学生类别';
comment on column edu_program.program_doc_templates_types.program_doc_template_id is '培养方案文档模板ID';
comment on column edu_program.program_doc_templates_types.std_type_id is '学生类别ID';
alter table edu_program.program_doc_templates_types add constraint pk_lwfg2w960gakch3fo4djc31d7 primary key (program_doc_template_id,std_type_id);
create index idx_q0vt9i2ql8fjenu8ldm8fm5wu on edu_program.program_doc_templates_types (program_doc_template_id);
alter table edu_program.program_doc_templates_types add constraint fk_jedlxpuxehpy3ji0yfhm2a0q7 foreign key (program_doc_template_id) references edu_program.program_doc_templates (id);
alter table edu_program.program_doc_templates_types add constraint fk_fuww87g53wh0qmo8fdws3xuh foreign key (std_type_id) references edu_base.std_types (id);
create table edu_program.program_doc_sections (id bigint not null, contents varchar(10000) not null, doc_id bigint not null, indexno varchar(255) not null, name varchar(255) not null, parent_id bigint);
comment on table edu_program.program_doc_sections is '培养方案文档章节';
comment on column edu_program.program_doc_sections.id is '非业务主键:datetime';
comment on column edu_program.program_doc_sections.contents is '内容';
comment on column edu_program.program_doc_sections.doc_id is '培养方案文档ID';
comment on column edu_program.program_doc_sections.indexno is '顺序号';
comment on column edu_program.program_doc_sections.name is '名称';
comment on column edu_program.program_doc_sections.parent_id is '培养方案文档章节ID';
alter table edu_program.program_doc_sections add constraint pk_7f7k9q32r86m55a0r93h2uflm primary key (id);
create index idx_jfn7je4lfhja46qtvdeka1dut on edu_program.program_doc_sections (parent_id);
create index idx_lkchplwh47vmakls9riujfgrw on edu_program.program_doc_sections (doc_id);
alter table edu_program.program_doc_sections add constraint fk_gg4dh1idchc0dpmdlftk6wd8t foreign key (parent_id) references edu_program.program_doc_sections (id);
alter table edu_program.program_doc_sections add constraint fk_46gbs7xngpyw938o4916n9soy foreign key (doc_id) references edu_program.program_docs (id);
create table edu_program.program_doc_metas (id integer not null, indexno varchar(255) not null, maxlength integer not null, name varchar(255) not null, template_id integer not null);
comment on table edu_program.program_doc_metas is '培养方案章节定义';
comment on column edu_program.program_doc_metas.id is '非业务主键:auto_increment';
comment on column edu_program.program_doc_metas.indexno is '章节编号';
comment on column edu_program.program_doc_metas.maxlength is '最大长度';
comment on column edu_program.program_doc_metas.name is '名称';
comment on column edu_program.program_doc_metas.template_id is '培养方案文档模板ID';
alter table edu_program.program_doc_metas add constraint pk_rt39x9dho1u8xtaov9jms7p94 primary key (id);
create index idx_d69hctw0adiwc375iducsqovm on edu_program.program_doc_metas (template_id);
alter table edu_program.program_doc_metas add constraint fk_m1vrqjy2yfp0tncdk6y0wdi5m foreign key (template_id) references edu_program.program_doc_templates (id);
alter table edu_program.std_course_groups add column given_name varchar(255);
alter table edu_program.program_doc_templates add column project_id integer;
alter table edu_program.program_doc_templates alter project_id set not null;
alter table edu_program.program_doc_templates add column updated_at timestamp;
alter table edu_program.program_doc_templates alter updated_at set not null;
alter table edu_program.program_doc_templates add constraint fk_l0gmpbto7t72cuf2shuvc7ylr foreign key (project_id) references edu_base.projects (id);
alter table edu_program.std_alt_courses add column remark varchar(255);
alter table edu_program.share_plans alter end_on drop not null;
alter table edu_program.major_alt_courses add column remark varchar(255);
create table edu_room.apply_depart_checks (id bigint not null, apply_id bigint not null, approved boolean not null, checked_at timestamp not null, checked_by_id bigint not null, opinions varchar(100));
comment on table edu_room.apply_depart_checks is '归口审核';
comment on column edu_room.apply_depart_checks.id is '非业务主键:datetime';
comment on column edu_room.apply_depart_checks.apply_id is '教室借用ID';
comment on column edu_room.apply_depart_checks.approved is '是否审核通过';
comment on column edu_room.apply_depart_checks.checked_at is '审核时间';
comment on column edu_room.apply_depart_checks.checked_by_id is '审核人ID';
comment on column edu_room.apply_depart_checks.opinions is '具体意见';
alter table edu_room.apply_depart_checks add constraint pk_6w1n3ng89llvco6c5gwu8js1d primary key (id);
alter table edu_room.apply_depart_checks add constraint fk_5rqqkq7gslufl9irv3flcdomg foreign key (apply_id) references edu_room.room_applies (id);
alter table edu_room.apply_depart_checks add constraint fk_6kai721b7f77w1syw0l85d1w6 foreign key (checked_by_id) references base.users (id);
create table edu_room.room_applies (id bigint not null, activity_name varchar(255) not null, activity_type_id integer not null, applicant varchar(255) not null, apply_at timestamp not null, apply_by_id bigint not null, approved boolean, attendance varchar(255) not null, attendance_num integer not null, begin_on date not null, campus_id integer not null, depart_check_id bigint, department_id integer not null, email varchar(255), end_on date not null, final_check_id bigint, minutes integer not null, mobile varchar(255) not null, require_multimedia boolean not null, room_comment varchar(255), school_id integer not null, speaker varchar(255) not null, time_comment varchar(255), unit_attendance integer not null);
comment on table edu_room.room_applies is '教室借用';
comment on column edu_room.room_applies.id is '非业务主键:datetime';
comment on column edu_room.room_applies.activity_name is '活动名称';
comment on column edu_room.room_applies.activity_type_id is '活动类型ID';
comment on column edu_room.room_applies.applicant is '借用人';
comment on column edu_room.room_applies.apply_at is '申请时间';
comment on column edu_room.room_applies.apply_by_id is '通用人员信息ID';
comment on column edu_room.room_applies.approved is '是否审核通过';
comment on column edu_room.room_applies.attendance is '出席对象';
comment on column edu_room.room_applies.attendance_num is '出席人数';
comment on column edu_room.room_applies.begin_on is '开始日期';
comment on column edu_room.room_applies.campus_id is '校区信息ID';
comment on column edu_room.room_applies.depart_check_id is '归口审核ID';
comment on column edu_room.room_applies.department_id is '借用人部门ID';
comment on column edu_room.room_applies.email is '电子邮件';
comment on column edu_room.room_applies.end_on is '结束日期';
comment on column edu_room.room_applies.final_check_id is '最终审核ID';
comment on column edu_room.room_applies.minutes is '借用时长(分钟)';
comment on column edu_room.room_applies.mobile is '移动电话';
comment on column edu_room.room_applies.require_multimedia is '是否使用多媒体设备';
comment on column edu_room.room_applies.room_comment is '借用场所要求';
comment on column edu_room.room_applies.school_id is '学校信息ID';
comment on column edu_room.room_applies.speaker is '主讲人';
comment on column edu_room.room_applies.time_comment is '借用时间要求';
comment on column edu_room.room_applies.unit_attendance is '每个教室单元需要的座位数';
alter table edu_room.room_applies add constraint pk_bc80rnoxs22g3i49cprrotgaq primary key (id);
alter table edu_room.room_applies add constraint fk_5c4e72iuk8knlqt9b2bnp49ur foreign key (activity_type_id) references code_hb.activity_types (id);
alter table edu_room.room_applies add constraint fk_bder5hiniytppyemmjpxbe26n foreign key (school_id) references base.schools (id);
alter table edu_room.room_applies add constraint fk_62jrt2d5fqdd1pemvaox7r5jq foreign key (department_id) references base.departments (id);
alter table edu_room.room_applies add constraint fk_f2bae216b0ksd7i7yubivtl0j foreign key (final_check_id) references edu_room.apply_final_checks (id);
alter table edu_room.room_applies add constraint fk_20id4cb1d1x6200p623rlmfvk foreign key (apply_by_id) references base.users (id);
alter table edu_room.room_applies add constraint fk_3aeoyormiqlanhahh275e24af foreign key (campus_id) references base.campuses (id);
alter table edu_room.room_applies add constraint fk_hrdbttbgm820xfqg28vby4m4c foreign key (depart_check_id) references edu_room.apply_depart_checks (id);
create table edu_room.available_times (id bigint not null, begin_at smallint not null, end_at smallint not null, project_id integer not null, room_id bigint not null, start_on date not null, updated_at timestamp not null, weekstate bigint not null);
comment on table edu_room.available_times is '教室可用时间';
comment on column edu_room.available_times.id is '非业务主键:datetime';
comment on column edu_room.available_times.begin_at is '开始时间';
comment on column edu_room.available_times.end_at is '结束时间';
comment on column edu_room.available_times.project_id is '项目ID';
comment on column edu_room.available_times.room_id is '教室ID';
comment on column edu_room.available_times.start_on is '开始日期';
comment on column edu_room.available_times.updated_at is '更新时间';
comment on column edu_room.available_times.weekstate is '周状态';
alter table edu_room.available_times add constraint pk_8110ur4lpu6jgidotr5o22x0b primary key (id);
alter table edu_room.available_times add constraint fk_nfxet639psyta7k9c4s6c7lgs foreign key (project_id) references edu_base.projects (id);
alter table edu_room.available_times add constraint fk_5dx5on9etwpt5ih0whvyjqow4 foreign key (room_id) references edu_base.classrooms (id);
create table edu_room.apply_final_checks (id bigint not null, apply_id bigint not null, approved boolean not null, checked_at timestamp not null, checked_by_id bigint not null, opinions varchar(100));
comment on table edu_room.apply_final_checks is '最终审核';
comment on column edu_room.apply_final_checks.id is '非业务主键:datetime';
comment on column edu_room.apply_final_checks.apply_id is '教室借用ID';
comment on column edu_room.apply_final_checks.approved is '是否审核通过';
comment on column edu_room.apply_final_checks.checked_at is '审核时间';
comment on column edu_room.apply_final_checks.checked_by_id is '审核人ID';
comment on column edu_room.apply_final_checks.opinions is '具体意见';
alter table edu_room.apply_final_checks add constraint pk_j60mj9ihq0fjm4jo49xfw9x2v primary key (id);
alter table edu_room.apply_final_checks add constraint fk_91digo316rq3atlerysskmecx foreign key (apply_id) references edu_room.room_applies (id);
alter table edu_room.apply_final_checks add constraint fk_2b8hsw3njvdb4advr7t5ad82b foreign key (checked_by_id) references base.users (id);
create table edu_room.room_applies_times (begin_at smallint not null, end_at smallint not null, room_apply_id bigint not null, start_on date not null, weekstate bigint not null);
comment on table edu_room.room_applies_times is '申请借用时间';
comment on column edu_room.room_applies_times.begin_at is '开始时间';
comment on column edu_room.room_applies_times.end_at is '结束时间';
comment on column edu_room.room_applies_times.room_apply_id is '教室借用ID';
comment on column edu_room.room_applies_times.start_on is '开始日期';
comment on column edu_room.room_applies_times.weekstate is '周状态';
alter table edu_room.room_applies_times add constraint pk_gut4id17joy6x8d5psmvc1pd2 primary key (room_apply_id,weekstate,begin_at,start_on,end_at);
create index idx_oaii80w561p28ji3r86pv8djo on edu_room.room_applies_times (room_apply_id);
alter table edu_room.room_applies_times add constraint fk_qpapnbbq74r8lwfljrwobal9j foreign key (room_apply_id) references edu_room.room_applies (id);
alter table edu_room.occupancies drop user_app_id cascade;
alter table edu_room.occupancies add column app_id bigint;
alter table edu_room.occupancies alter app_id set not null;
alter table edu_room.occupancies alter room_id type bigint;
alter table edu_room.occupancies drop constraint fk_1cjsr1m8n9vqaw4rj0r3xj0fm cascade;
alter table edu_room.occupancies drop constraint fk_5tyfmv9xpwuh3qmtskpy62ah cascade;
alter table edu_room.occupancies add constraint fk_murkxio6v49ybbgf2n5s1pcu5 foreign key (app_id) references edu_room.user_apps (id);
alter table edu_room.occupancies add constraint fk_cxcnxdgl2tss3ved9eqe00oq9 foreign key (room_id) references edu_base.classrooms (id);
create table edu_clazz.clazzes_ability_rates (clazz_id bigint not null, course_ability_rate_id integer not null);
comment on table edu_clazz.clazzes_ability_rates is '要求课程能力等级';
comment on column edu_clazz.clazzes_ability_rates.clazz_id is '教学任务ID';
comment on column edu_clazz.clazzes_ability_rates.course_ability_rate_id is '课程能力等级ID';
alter table edu_clazz.clazzes_ability_rates add constraint pk_kx0jp80tganm39yvlc4lewj74 primary key (clazz_id,course_ability_rate_id);
create index idx_dtwnr7ysxuukruvulscomb6on on edu_clazz.clazzes_ability_rates (clazz_id);
alter table edu_clazz.clazzes_ability_rates add constraint fk_b8unl65rdwbtkvgou7sf2s58r foreign key (clazz_id) references edu_clazz.clazzes (id);
alter table edu_clazz.clazzes_ability_rates add constraint fk_9x9tus6jwmygbpg7he75889wl foreign key (course_ability_rate_id) references edu_base.course_ability_rates (id);
create table edu_clazz.std_course_abilities (id bigint not null, rate_id integer not null, score float4, std_id bigint not null, updated_at timestamp not null);
comment on table edu_clazz.std_course_abilities is '学生课程能力';
comment on column edu_clazz.std_course_abilities.id is '非业务主键:datetime';
comment on column edu_clazz.std_course_abilities.rate_id is '课程能力等级ID';
comment on column edu_clazz.std_course_abilities.score is '分数';
comment on column edu_clazz.std_course_abilities.std_id is '学籍信息实现ID';
comment on column edu_clazz.std_course_abilities.updated_at is '更新时间';
alter table edu_clazz.std_course_abilities add constraint pk_ctriq5lvqq54p8st9q7qkkg20 primary key (id);
alter table edu_clazz.std_course_abilities add constraint fk_7q7mrns33elrcpminu6waryj7 foreign key (std_id) references edu_base.students (id);
alter table edu_clazz.std_course_abilities add constraint fk_c7ddhnmuoymrsl7rj8dce3nmg foreign key (rate_id) references edu_base.course_ability_rates (id);
alter table edu_clazz.materials add column audit_at timestamp;
alter table edu_clazz.materials rename column adoption_state to adoption;
alter table edu_graduation.graduate_results alter passed drop not null;
alter table edu_graduation.graduate_results alter education_result_id drop not null;
create table edu_base.teaching_groups (id bigint not null, begin_on date not null, code varchar(255) not null, department_id integer not null, director_id bigint, end_on date, name varchar(255) not null, updated_at timestamp not null);
comment on table edu_base.teaching_groups is '教研室';
comment on column edu_base.teaching_groups.id is '非业务主键:datetime';
comment on column edu_base.teaching_groups.begin_on is '生效日期';
comment on column edu_base.teaching_groups.code is '代码';
comment on column edu_base.teaching_groups.department_id is '部门组织机构信息ID';
comment on column edu_base.teaching_groups.director_id is '负责人ID';
comment on column edu_base.teaching_groups.end_on is '失效日期';
comment on column edu_base.teaching_groups.name is '名称';
comment on column edu_base.teaching_groups.updated_at is '更新时间';
alter table edu_base.teaching_groups add constraint pk_thpvr5c5xh504xd17xk5lf4lc primary key (id);
alter table edu_base.teaching_groups add constraint fk_lkn8530n7fsqpp1nmxhv3yvt5 foreign key (director_id) references base.users (id);
alter table edu_base.teaching_groups add constraint fk_5rs93ldrv95ih1457dghf1bjd foreign key (department_id) references base.departments (id);
create table edu_base.classrooms_projects (classroom_id bigint not null, project_id integer not null);
comment on table edu_base.classrooms_projects is '使用项目';
comment on column edu_base.classrooms_projects.classroom_id is '教室ID';
comment on column edu_base.classrooms_projects.project_id is '项目ID';
alter table edu_base.classrooms_projects add constraint pk_cjgojafxa077u3fb2vicargx primary key (classroom_id,project_id);
create index idx_3y1hwcx0xh0apfawnr099698f on edu_base.classrooms_projects (classroom_id);
alter table edu_base.classrooms_projects add constraint fk_fgiktidt9t5160vtodc3olj5j foreign key (classroom_id) references edu_base.classrooms (id);
alter table edu_base.classrooms_projects add constraint fk_i4kfwi4ifex3emo0xsda5iuk1 foreign key (project_id) references edu_base.projects (id);
create table edu_base.teaching_groups_members (teaching_group_id bigint not null, user_id bigint not null);
comment on table edu_base.teaching_groups_members is '成员';
comment on column edu_base.teaching_groups_members.teaching_group_id is '教研室ID';
comment on column edu_base.teaching_groups_members.user_id is '通用人员信息ID';
alter table edu_base.teaching_groups_members add constraint pk_lvc9u5f05kfqngpayj3fm9txi primary key (teaching_group_id,user_id);
create index idx_kpw6oy9d7vq7egphmp4jfnwm2 on edu_base.teaching_groups_members (teaching_group_id);
alter table edu_base.teaching_groups_members add constraint fk_ds144gybw1j01p5tui9rxik03 foreign key (teaching_group_id) references edu_base.teaching_groups (id);
alter table edu_base.teaching_groups_members add constraint fk_cq7obp51a646gpd06biqp6tp0 foreign key (user_id) references base.users (id);
alter table edu_base.students drop code cascade;
alter table edu_base.students alter person_id drop not null;
alter table edu_base.students drop constraint uk_pulf69umve57yxwhc23yly481 cascade;
alter table edu_base.students add constraint uk_7olmoqml89w2merfrxmturwa5 unique (user_id,project_id);
alter table edu_base.teachers drop constraint uk_8nuoilfumlhqhym43rybd3tj cascade;
alter table edu_base.teachers add constraint uk_oa2tjed13a1wvudv8ce1b71fg unique (user_id,project_id);
alter table edu_base.classrooms drop room_id cascade;
alter table edu_base.classrooms drop project_id cascade;
alter table edu_base.classrooms add column room_no varchar(20);
alter table edu_base.classrooms add column school_id integer;
alter table edu_base.classrooms alter school_id set not null;
alter table edu_base.classrooms add column building_id integer;
alter table edu_base.classrooms add column floor_no integer;
alter table edu_base.classrooms alter floor_no set not null;
alter table edu_base.classrooms add column capacity integer;
alter table edu_base.classrooms alter capacity set not null;
alter table edu_base.classrooms drop constraint fk_imfvwrw46p6vc698n7vl2305l cascade;
alter table edu_base.classrooms drop constraint fk_4msji5x9bfek4i65cmeqjpjgc cascade;
alter table edu_base.classrooms add constraint fk_p169e84csib3wbj8ipuh3omkg foreign key (building_id) references base.buildings (id);
alter table edu_base.classrooms add constraint fk_stm3c7u1s7l0t42gywsldaani foreign key (school_id) references base.schools (id);
alter table edu_base.classrooms drop constraint uk_odyfmsy18wrf9vl0xvhejepy8 cascade;
alter table edu_base.squads add column en_name varchar(255);
alter table edu_base.squads alter name type varchar(100);
alter table edu_base.squads alter end_on set not null;
comment on column edu_base.squads.end_on is '结束日期';
alter table edu_base.courses add column teaching_group_id bigint;
alter table edu_base.courses add constraint fk_14wuu3b6ddvtef8fcw0goydeg foreign key (teaching_group_id) references edu_base.teaching_groups (id);
alter table edu_base.projects_properties rename column value to value_;
alter table edu_grade.course_grade_states rename column extra_inputer_id to inputer_id;
