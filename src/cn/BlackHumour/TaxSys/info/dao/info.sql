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
    i_id, i_type, i_source, i_title, i_content, i_memo, i_creator, i_createtime, i_state
  </sql>
  <select id="selectByExample" resultMap="BaseResultMap" parameterType="cn.BlackHumour.TaxSys.info.entity.InfoExample" >
    select
    <if test="distinct" >
      distinct
    </if>
    <include refid="Base_Column_List" />
    from info
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
    from info
    where i_id = #{iId,jdbcType=VARCHAR}
  </select>
  <delete id="deleteByPrimaryKey" parameterType="java.lang.String" >
    delete from info
    where i_id = #{iId,jdbcType=VARCHAR}
  </delete>
  <delete id="deleteByExample" parameterType="cn.BlackHumour.TaxSys.info.entity.InfoExample" >
    delete from info
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
  </delete>
  <insert id="insert" parameterType="cn.BlackHumour.TaxSys.info.entity.Info" >
    insert into info (i_id, i_type, i_source, 
      i_title, i_content, i_memo, 
      i_creator, i_createtime, i_state
      )
    values (#{iId,jdbcType=VARCHAR}, #{iType,jdbcType=VARCHAR}, #{iSource,jdbcType=VARCHAR}, 
      #{iTitle,jdbcType=VARCHAR}, #{iContent,jdbcType=VARCHAR}, #{iMemo,jdbcType=VARCHAR}, 
      #{iCreator,jdbcType=VARCHAR}, #{iCreatetime,jdbcType=TIMESTAMP}, #{iState,jdbcType=BIT}
      )
  </insert>
  <insert id="insertSelective" parameterType="cn.BlackHumour.TaxSys.info.entity.Info" >
    insert into info
    <trim prefix="(" suffix=")" suffixOverrides="," >
      <if test="iId != null" >
        i_id,
      </if>
      <if test="iType != null" >
        i_type,
      </if>
      <if test="iSource != null" >
        i_source,
      </if>
      <if test="iTitle != null" >
        i_title,
      </if>
      <if test="iContent != null" >
        i_content,
      </if>
      <if test="iMemo != null" >
        i_memo,
      </if>
      <if test="iCreator != null" >
        i_creator,
      </if>
      <if test="iCreatetime != null" >
        i_createtime,
      </if>
      <if test="iState != null" >
        i_state,
      </if>
    </trim>
    <trim prefix="values (" suffix=")" suffixOverrides="," >
      <if test="iId != null" >
        #{iId,jdbcType=VARCHAR},
      </if>
      <if test="iType != null" >
        #{iType,jdbcType=VARCHAR},
      </if>
      <if test="iSource != null" >
        #{iSource,jdbcType=VARCHAR},
      </if>
      <if test="iTitle != null" >
        #{iTitle,jdbcType=VARCHAR},
      </if>
      <if test="iContent != null" >
        #{iContent,jdbcType=VARCHAR},
      </if>
      <if test="iMemo != null" >
        #{iMemo,jdbcType=VARCHAR},
      </if>
      <if test="iCreator != null" >
        #{iCreator,jdbcType=VARCHAR},
      </if>
      <if test="iCreatetime != null" >
        #{iCreatetime,jdbcType=TIMESTAMP},
      </if>
      <if test="iState != null" >
        #{iState,jdbcType=BIT},
      </if>
    </trim>
  </insert>
  <select id="countByExample" parameterType="cn.BlackHumour.TaxSys.info.entity.InfoExample" resultType="java.lang.Integer" >
    select count(*) from info
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
  </select>
  <update id="updateByExampleSelective" parameterType="map" >
    update info
    <set >
      <if test="record.iId != null" >
        i_id = #{record.iId,jdbcType=VARCHAR},
      </if>
      <if test="record.iType != null" >
        i_type = #{record.iType,jdbcType=VARCHAR},
      </if>
      <if test="record.iSource != null" >
        i_source = #{record.iSource,jdbcType=VARCHAR},
      </if>
      <if test="record.iTitle != null" >
        i_title = #{record.iTitle,jdbcType=VARCHAR},
      </if>
      <if test="record.iContent != null" >
        i_content = #{record.iContent,jdbcType=VARCHAR},
      </if>
      <if test="record.iMemo != null" >
        i_memo = #{record.iMemo,jdbcType=VARCHAR},
      </if>
      <if test="record.iCreator != null" >
        i_creator = #{record.iCreator,jdbcType=VARCHAR},
      </if>
      <if test="record.iCreatetime != null" >
        i_createtime = #{record.iCreatetime,jdbcType=TIMESTAMP},
      </if>
      <if test="record.iState != null" >
        i_state = #{record.iState,jdbcType=BIT},
      </if>
    </set>
    <if test="_parameter != null" >
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByExample" parameterType="map" >
    update info
    set i_id = #{record.iId,jdbcType=VARCHAR},
      i_type = #{record.iType,jdbcType=VARCHAR},
      i_source = #{record.iSource,jdbcType=VARCHAR},
      i_title = #{record.iTitle,jdbcType=VARCHAR},
      i_content = #{record.iContent,jdbcType=VARCHAR},
      i_memo = #{record.iMemo,jdbcType=VARCHAR},
      i_creator = #{record.iCreator,jdbcType=VARCHAR},
      i_createtime = #{record.iCreatetime,jdbcType=TIMESTAMP},
      i_state = #{record.iState,jdbcType=BIT}
    <if test="_parameter != null" >
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByPrimaryKeySelective" parameterType="cn.BlackHumour.TaxSys.info.entity.Info" >
    update info
    <set >
      <if test="iType != null" >
        i_type = #{iType,jdbcType=VARCHAR},
      </if>
      <if test="iSource != null" >
        i_source = #{iSource,jdbcType=VARCHAR},
      </if>
      <if test="iTitle != null" >
        i_title = #{iTitle,jdbcType=VARCHAR},
      </if>
      <if test="iContent != null" >
        i_content = #{iContent,jdbcType=VARCHAR},
      </if>
      <if test="iMemo != null" >
        i_memo = #{iMemo,jdbcType=VARCHAR},
      </if>
      <if test="iCreator != null" >
        i_creator = #{iCreator,jdbcType=VARCHAR},
      </if>
      <if test="iCreatetime != null" >
        i_createtime = #{iCreatetime,jdbcType=TIMESTAMP},
      </if>
      <if test="iState != null" >
        i_state = #{iState,jdbcType=BIT},
      </if>
    </set>
    where i_id = #{iId,jdbcType=VARCHAR}
  </update>
  <update id="updateByPrimaryKey" parameterType="cn.BlackHumour.TaxSys.info.entity.Info" >
    update info
    set i_type = #{iType,jdbcType=VARCHAR},
      i_source = #{iSource,jdbcType=VARCHAR},
      i_title = #{iTitle,jdbcType=VARCHAR},
      i_content = #{iContent,jdbcType=VARCHAR},
      i_memo = #{iMemo,jdbcType=VARCHAR},
      i_creator = #{iCreator,jdbcType=VARCHAR},
      i_createtime = #{iCreatetime,jdbcType=TIMESTAMP},
      i_state = #{iState,jdbcType=BIT}
    where i_id = #{iId,jdbcType=VARCHAR}
  </update>