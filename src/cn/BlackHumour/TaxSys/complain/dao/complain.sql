 <resultMap id="ResultMapWithBLOBs" type="cn.BlackHumour.TaxSys.complain.entity.Complain" extends="BaseResultMap" >
    <result column="c_content" property="cContent" jdbcType="LONGVARCHAR" />
  </resultMap>
  <sql id="Example_Where_Clause" >
    <where >
      <foreach collection="oredCriteria" item="criteria" separator="or" >
        <if test="criteria.valid" >
          <trim prefix="(" suffix=")" prefixOverrides="and" >
            <foreach collection="criteria.criteria" item="criterion" >
              <choose >
                <when test="criterion.noValue" >
                  and ${criterion.condition}
                </when>
                <when test="criterion.singleValue" >
                  and ${criterion.condition} #{criterion.value}
                </when>
                <when test="criterion.betweenValue" >
                  and ${criterion.condition} #{criterion.value} and #{criterion.secondValue}
                </when>
                <when test="criterion.listValue" >
                  and ${criterion.condition}
                  <foreach collection="criterion.value" item="listItem" open="(" close=")" separator="," >
                    #{listItem}
                  </foreach>
                </when>
              </choose>
            </foreach>
          </trim>
        </if>
      </foreach>
    </where>
  </sql>
  <sql id="Update_By_Example_Where_Clause" >
    <where >
      <foreach collection="example.oredCriteria" item="criteria" separator="or" >
        <if test="criteria.valid" >
          <trim prefix="(" suffix=")" prefixOverrides="and" >
            <foreach collection="criteria.criteria" item="criterion" >
              <choose >
                <when test="criterion.noValue" >
                  and ${criterion.condition}
                </when>
                <when test="criterion.singleValue" >
                  and ${criterion.condition} #{criterion.value}
                </when>
                <when test="criterion.betweenValue" >
                  and ${criterion.condition} #{criterion.value} and #{criterion.secondValue}
                </when>
                <when test="criterion.listValue" >
                  and ${criterion.condition}
                  <foreach collection="criterion.value" item="listItem" open="(" close=")" separator="," >
                    #{listItem}
                  </foreach>
                </when>
              </choose>
            </foreach>
          </trim>
        </if>
      </foreach>
    </where>
  </sql>
  <sql id="Base_Column_List" >
    c_id, c_company, c_mobile, c_state, c_isNM, c_time, c_title, c_toName, c_todept, 
    c_name
  </sql>
  <sql id="Blob_Column_List" >
    c_content
  </sql>
  <select id="selectByExampleWithBLOBs" resultMap="ResultMapWithBLOBs" parameterType="cn.BlackHumour.TaxSys.complain.entity.ComplainExample" >
    select
    <if test="distinct" >
      distinct
    </if>
    <include refid="Base_Column_List" />
    ,
    <include refid="Blob_Column_List" />
    from complain
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
    <if test="orderByClause != null" >
      order by ${orderByClause}
    </if>
  </select>
  <select id="selectByExample" resultMap="BaseResultMap" parameterType="cn.BlackHumour.TaxSys.complain.entity.ComplainExample" >
    select
    <if test="distinct" >
      distinct
    </if>
    <include refid="Base_Column_List" />
    from complain
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
    <if test="orderByClause != null" >
      order by ${orderByClause}
    </if>
  </select>
  <select id="selectByPrimaryKey" resultMap="ResultMapWithBLOBs" parameterType="java.lang.String" >
    select 
    <include refid="Base_Column_List" />
    ,
    <include refid="Blob_Column_List" />
    from complain
    where c_id = #{cId,jdbcType=VARCHAR}
  </select>
  <delete id="deleteByPrimaryKey" parameterType="java.lang.String" >
    delete from complain
    where c_id = #{cId,jdbcType=VARCHAR}
  </delete>
  <delete id="deleteByExample" parameterType="cn.BlackHumour.TaxSys.complain.entity.ComplainExample" >
    delete from complain
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
  </delete>
  <insert id="insert" parameterType="cn.BlackHumour.TaxSys.complain.entity.Complain" >
    insert into complain (c_id, c_company, c_mobile, 
      c_state, c_isNM, c_time, 
      c_title, c_toName, c_todept, 
      c_name, c_content)
    values (#{cId,jdbcType=VARCHAR}, #{cCompany,jdbcType=VARCHAR}, #{cMobile,jdbcType=VARCHAR}, 
      #{cState,jdbcType=VARCHAR}, #{cIsnm,jdbcType=BIT}, #{cTime,jdbcType=TIMESTAMP}, 
      #{cTitle,jdbcType=VARCHAR}, #{cToname,jdbcType=VARCHAR}, #{cTodept,jdbcType=VARCHAR}, 
      #{cName,jdbcType=VARCHAR}, #{cContent,jdbcType=LONGVARCHAR})
  </insert>
  <insert id="insertSelective" parameterType="cn.BlackHumour.TaxSys.complain.entity.Complain" >
    insert into complain
    <trim prefix="(" suffix=")" suffixOverrides="," >
      <if test="cId != null" >
        c_id,
      </if>
      <if test="cCompany != null" >
        c_company,
      </if>
      <if test="cMobile != null" >
        c_mobile,
      </if>
      <if test="cState != null" >
        c_state,
      </if>
      <if test="cIsnm != null" >
        c_isNM,
      </if>
      <if test="cTime != null" >
        c_time,
      </if>
      <if test="cTitle != null" >
        c_title,
      </if>
      <if test="cToname != null" >
        c_toName,
      </if>
      <if test="cTodept != null" >
        c_todept,
      </if>
      <if test="cName != null" >
        c_name,
      </if>
      <if test="cContent != null" >
        c_content,
      </if>
    </trim>
    <trim prefix="values (" suffix=")" suffixOverrides="," >
      <if test="cId != null" >
        #{cId,jdbcType=VARCHAR},
      </if>
      <if test="cCompany != null" >
        #{cCompany,jdbcType=VARCHAR},
      </if>
      <if test="cMobile != null" >
        #{cMobile,jdbcType=VARCHAR},
      </if>
      <if test="cState != null" >
        #{cState,jdbcType=VARCHAR},
      </if>
      <if test="cIsnm != null" >
        #{cIsnm,jdbcType=BIT},
      </if>
      <if test="cTime != null" >
        #{cTime,jdbcType=TIMESTAMP},
      </if>
      <if test="cTitle != null" >
        #{cTitle,jdbcType=VARCHAR},
      </if>
      <if test="cToname != null" >
        #{cToname,jdbcType=VARCHAR},
      </if>
      <if test="cTodept != null" >
        #{cTodept,jdbcType=VARCHAR},
      </if>
      <if test="cName != null" >
        #{cName,jdbcType=VARCHAR},
      </if>
      <if test="cContent != null" >
        #{cContent,jdbcType=LONGVARCHAR},
      </if>
    </trim>
  </insert>
  <select id="countByExample" parameterType="cn.BlackHumour.TaxSys.complain.entity.ComplainExample" resultType="java.lang.Integer" >
    select count(*) from complain
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
  </select>
  <update id="updateByExampleSelective" parameterType="map" >
    update complain
    <set >
      <if test="record.cId != null" >
        c_id = #{record.cId,jdbcType=VARCHAR},
      </if>
      <if test="record.cCompany != null" >
        c_company = #{record.cCompany,jdbcType=VARCHAR},
      </if>
      <if test="record.cMobile != null" >
        c_mobile = #{record.cMobile,jdbcType=VARCHAR},
      </if>
      <if test="record.cState != null" >
        c_state = #{record.cState,jdbcType=VARCHAR},
      </if>
      <if test="record.cIsnm != null" >
        c_isNM = #{record.cIsnm,jdbcType=BIT},
      </if>
      <if test="record.cTime != null" >
        c_time = #{record.cTime,jdbcType=TIMESTAMP},
      </if>
      <if test="record.cTitle != null" >
        c_title = #{record.cTitle,jdbcType=VARCHAR},
      </if>
      <if test="record.cToname != null" >
        c_toName = #{record.cToname,jdbcType=VARCHAR},
      </if>
      <if test="record.cTodept != null" >
        c_todept = #{record.cTodept,jdbcType=VARCHAR},
      </if>
      <if test="record.cName != null" >
        c_name = #{record.cName,jdbcType=VARCHAR},
      </if>
      <if test="record.cContent != null" >
        c_content = #{record.cContent,jdbcType=LONGVARCHAR},
      </if>
    </set>
    <if test="_parameter != null" >
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByExampleWithBLOBs" parameterType="map" >
    update complain
    set c_id = #{record.cId,jdbcType=VARCHAR},
      c_company = #{record.cCompany,jdbcType=VARCHAR},
      c_mobile = #{record.cMobile,jdbcType=VARCHAR},
      c_state = #{record.cState,jdbcType=VARCHAR},
      c_isNM = #{record.cIsnm,jdbcType=BIT},
      c_time = #{record.cTime,jdbcType=TIMESTAMP},
      c_title = #{record.cTitle,jdbcType=VARCHAR},
      c_toName = #{record.cToname,jdbcType=VARCHAR},
      c_todept = #{record.cTodept,jdbcType=VARCHAR},
      c_name = #{record.cName,jdbcType=VARCHAR},
      c_content = #{record.cContent,jdbcType=LONGVARCHAR}
    <if test="_parameter != null" >
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByExample" parameterType="map" >
    update complain
    set c_id = #{record.cId,jdbcType=VARCHAR},
      c_company = #{record.cCompany,jdbcType=VARCHAR},
      c_mobile = #{record.cMobile,jdbcType=VARCHAR},
      c_state = #{record.cState,jdbcType=VARCHAR},
      c_isNM = #{record.cIsnm,jdbcType=BIT},
      c_time = #{record.cTime,jdbcType=TIMESTAMP},
      c_title = #{record.cTitle,jdbcType=VARCHAR},
      c_toName = #{record.cToname,jdbcType=VARCHAR},
      c_todept = #{record.cTodept,jdbcType=VARCHAR},
      c_name = #{record.cName,jdbcType=VARCHAR}
    <if test="_parameter != null" >
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByPrimaryKeySelective" parameterType="cn.BlackHumour.TaxSys.complain.entity.Complain" >
    update complain
    <set >
      <if test="cCompany != null" >
        c_company = #{cCompany,jdbcType=VARCHAR},
      </if>
      <if test="cMobile != null" >
        c_mobile = #{cMobile,jdbcType=VARCHAR},
      </if>
      <if test="cState != null" >
        c_state = #{cState,jdbcType=VARCHAR},
      </if>
      <if test="cIsnm != null" >
        c_isNM = #{cIsnm,jdbcType=BIT},
      </if>
      <if test="cTime != null" >
        c_time = #{cTime,jdbcType=TIMESTAMP},
      </if>
      <if test="cTitle != null" >
        c_title = #{cTitle,jdbcType=VARCHAR},
      </if>
      <if test="cToname != null" >
        c_toName = #{cToname,jdbcType=VARCHAR},
      </if>
      <if test="cTodept != null" >
        c_todept = #{cTodept,jdbcType=VARCHAR},
      </if>
      <if test="cName != null" >
        c_name = #{cName,jdbcType=VARCHAR},
      </if>
      <if test="cContent != null" >
        c_content = #{cContent,jdbcType=LONGVARCHAR},
      </if>
    </set>
    where c_id = #{cId,jdbcType=VARCHAR}
  </update>
  <update id="updateByPrimaryKeyWithBLOBs" parameterType="cn.BlackHumour.TaxSys.complain.entity.Complain" >
    update complain
    set c_company = #{cCompany,jdbcType=VARCHAR},
      c_mobile = #{cMobile,jdbcType=VARCHAR},
      c_state = #{cState,jdbcType=VARCHAR},
      c_isNM = #{cIsnm,jdbcType=BIT},
      c_time = #{cTime,jdbcType=TIMESTAMP},
      c_title = #{cTitle,jdbcType=VARCHAR},
      c_toName = #{cToname,jdbcType=VARCHAR},
      c_todept = #{cTodept,jdbcType=VARCHAR},
      c_name = #{cName,jdbcType=VARCHAR},
      c_content = #{cContent,jdbcType=LONGVARCHAR}
    where c_id = #{cId,jdbcType=VARCHAR}
  </update>
  <update id="updateByPrimaryKey" parameterType="cn.BlackHumour.TaxSys.complain.entity.Complain" >
    update complain
    set c_company = #{cCompany,jdbcType=VARCHAR},
      c_mobile = #{cMobile,jdbcType=VARCHAR},
      c_state = #{cState,jdbcType=VARCHAR},
      c_isNM = #{cIsnm,jdbcType=BIT},
      c_time = #{cTime,jdbcType=TIMESTAMP},
      c_title = #{cTitle,jdbcType=VARCHAR},
      c_toName = #{cToname,jdbcType=VARCHAR},
      c_todept = #{cTodept,jdbcType=VARCHAR},
      c_name = #{cName,jdbcType=VARCHAR}
    where c_id = #{cId,jdbcType=VARCHAR}
  </update>