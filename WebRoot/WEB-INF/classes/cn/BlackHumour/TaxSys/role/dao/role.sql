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
    r_id, r_name, r_state
  </sql>
  <select id="selectByExample" resultMap="BaseResultMap" parameterType="cn.BlackHumour.TaxSys.user.entity.RoleExample" >
    select
    <if test="distinct" >
      distinct
    </if>
    <include refid="Base_Column_List" />
    from role
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
    from role
    where r_id = #{rId,jdbcType=VARCHAR}
  </select>
  <delete id="deleteByPrimaryKey" parameterType="java.lang.String" >
    delete from role
    where r_id = #{rId,jdbcType=VARCHAR}
  </delete>
  <delete id="deleteByExample" parameterType="cn.BlackHumour.TaxSys.user.entity.RoleExample" >
    delete from role
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
  </delete>
  <insert id="insert" parameterType="cn.BlackHumour.TaxSys.user.entity.Role" >
    insert into role (r_id, r_name, r_state
      )
    values (#{rId,jdbcType=VARCHAR}, #{rName,jdbcType=VARCHAR}, #{rState,jdbcType=BIT}
      )
  </insert>
  <insert id="insertSelective" parameterType="cn.BlackHumour.TaxSys.user.entity.Role" >
    insert into role
    <trim prefix="(" suffix=")" suffixOverrides="," >
      <if test="rId != null" >
        r_id,
      </if>
      <if test="rName != null" >
        r_name,
      </if>
      <if test="rState != null" >
        r_state,
      </if>
    </trim>
    <trim prefix="values (" suffix=")" suffixOverrides="," >
      <if test="rId != null" >
        #{rId,jdbcType=VARCHAR},
      </if>
      <if test="rName != null" >
        #{rName,jdbcType=VARCHAR},
      </if>
      <if test="rState != null" >
        #{rState,jdbcType=BIT},
      </if>
    </trim>
  </insert>
  <select id="countByExample" parameterType="cn.BlackHumour.TaxSys.user.entity.RoleExample" resultType="java.lang.Integer" >
    select count(*) from role
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
  </select>
  <update id="updateByExampleSelective" parameterType="map" >
    update role
    <set >
      <if test="record.rId != null" >
        r_id = #{record.rId,jdbcType=VARCHAR},
      </if>
      <if test="record.rName != null" >
        r_name = #{record.rName,jdbcType=VARCHAR},
      </if>
      <if test="record.rState != null" >
        r_state = #{record.rState,jdbcType=BIT},
      </if>
    </set>
    <if test="_parameter != null" >
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByExample" parameterType="map" >
    update role
    set r_id = #{record.rId,jdbcType=VARCHAR},
      r_name = #{record.rName,jdbcType=VARCHAR},
      r_state = #{record.rState,jdbcType=BIT}
    <if test="_parameter != null" >
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByPrimaryKeySelective" parameterType="cn.BlackHumour.TaxSys.user.entity.Role" >
    update role
    <set >
      <if test="rName != null" >
        r_name = #{rName,jdbcType=VARCHAR},
      </if>
      <if test="rState != null" >
        r_state = #{rState,jdbcType=BIT},
      </if>
    </set>
    where r_id = #{rId,jdbcType=VARCHAR}
  </update>
  <update id="updateByPrimaryKey" parameterType="cn.BlackHumour.TaxSys.user.entity.Role" >
    update role
    set r_name = #{rName,jdbcType=VARCHAR},
      r_state = #{rState,jdbcType=BIT}
    where r_id = #{rId,jdbcType=VARCHAR}
  </update>