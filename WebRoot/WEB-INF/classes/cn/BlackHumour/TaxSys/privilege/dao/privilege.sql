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
    p_code, p_name
  </sql>
  <select id="selectByExample" resultMap="BaseResultMap" parameterType="cn.BlackHumour.TaxSys.privilege.entity.PrivilegeExample" >
    select
    <if test="distinct" >
      distinct
    </if>
    <include refid="Base_Column_List" />
    from privilege
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
    <if test="orderByClause != null" >
      order by ${orderByClause}
    </if>
  </select>
  <select id="selectByPrimaryKey" resultMap="BaseResultMap" parameterType="java.lang.String" >
    select 
    <include refid="Base_Column_List" />
    from privilege
    where p_code = #{pCode,jdbcType=VARCHAR}
  </select>
  <delete id="deleteByPrimaryKey" parameterType="java.lang.String" >
    delete from privilege
    where p_code = #{pCode,jdbcType=VARCHAR}
  </delete>
  <delete id="deleteByExample" parameterType="cn.BlackHumour.TaxSys.privilege.entity.PrivilegeExample" >
    delete from privilege
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
  </delete>
  <insert id="insert" parameterType="cn.BlackHumour.TaxSys.privilege.entity.Privilege" >
    insert into privilege (p_code, p_name)
    values (#{pCode,jdbcType=VARCHAR}, #{pName,jdbcType=VARCHAR})
  </insert>
  <insert id="insertSelective" parameterType="cn.BlackHumour.TaxSys.privilege.entity.Privilege" >
    insert into privilege
    <trim prefix="(" suffix=")" suffixOverrides="," >
      <if test="pCode != null" >
        p_code,
      </if>
      <if test="pName != null" >
        p_name,
      </if>
    </trim>
    <trim prefix="values (" suffix=")" suffixOverrides="," >
      <if test="pCode != null" >
        #{pCode,jdbcType=VARCHAR},
      </if>
      <if test="pName != null" >
        #{pName,jdbcType=VARCHAR},
      </if>
    </trim>
  </insert>
  <select id="countByExample" parameterType="cn.BlackHumour.TaxSys.privilege.entity.PrivilegeExample" resultType="java.lang.Integer" >
    select count(*) from privilege
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
  </select>
  <update id="updateByExampleSelective" parameterType="map" >
    update privilege
    <set >
      <if test="record.pCode != null" >
        p_code = #{record.pCode,jdbcType=VARCHAR},
      </if>
      <if test="record.pName != null" >
        p_name = #{record.pName,jdbcType=VARCHAR},
      </if>
    </set>
    <if test="_parameter != null" >
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByExample" parameterType="map" >
    update privilege
    set p_code = #{record.pCode,jdbcType=VARCHAR},
      p_name = #{record.pName,jdbcType=VARCHAR}
    <if test="_parameter != null" >
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByPrimaryKeySelective" parameterType="cn.BlackHumour.TaxSys.privilege.entity.Privilege" >
    update privilege
    <set >
      <if test="pName != null" >
        p_name = #{pName,jdbcType=VARCHAR},
      </if>
    </set>
    where p_code = #{pCode,jdbcType=VARCHAR}
  </update>
  <update id="updateByPrimaryKey" parameterType="cn.BlackHumour.TaxSys.privilege.entity.Privilege" >
    update privilege
    set p_name = #{pName,jdbcType=VARCHAR}
    where p_code = #{pCode,jdbcType=VARCHAR}
  </update>