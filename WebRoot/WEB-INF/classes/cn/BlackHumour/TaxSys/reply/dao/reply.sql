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
    reply_id, c_id, reply_er, reply_dept, reply_time, reply_content
  </sql>
  <select id="selectByExample" resultMap="BaseResultMap" parameterType="cn.BlackHumour.TaxSys.reply.entity.replyExample" >
    select
    <if test="distinct" >
      distinct
    </if>
    <include refid="Base_Column_List" />
    from reply
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
    from reply
    where reply_id = #{replyId,jdbcType=VARCHAR}
  </select>
  <delete id="deleteByPrimaryKey" parameterType="java.lang.String" >
    delete from reply
    where reply_id = #{replyId,jdbcType=VARCHAR}
  </delete>
  <delete id="deleteByExample" parameterType="cn.BlackHumour.TaxSys.reply.entity.replyExample" >
    delete from reply
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
  </delete>
  <insert id="insert" parameterType="cn.BlackHumour.TaxSys.reply.entity.reply" >
    insert into reply (reply_id, c_id, reply_er, 
      reply_dept, reply_time, reply_content
      )
    values (#{replyId,jdbcType=VARCHAR}, #{cId,jdbcType=VARCHAR}, #{replyEr,jdbcType=VARCHAR}, 
      #{replyDept,jdbcType=VARCHAR}, #{replyTime,jdbcType=TIMESTAMP}, #{replyContent,jdbcType=VARCHAR}
      )
  </insert>
  <insert id="insertSelective" parameterType="cn.BlackHumour.TaxSys.reply.entity.reply" >
    insert into reply
    <trim prefix="(" suffix=")" suffixOverrides="," >
      <if test="replyId != null" >
        reply_id,
      </if>
      <if test="cId != null" >
        c_id,
      </if>
      <if test="replyEr != null" >
        reply_er,
      </if>
      <if test="replyDept != null" >
        reply_dept,
      </if>
      <if test="replyTime != null" >
        reply_time,
      </if>
      <if test="replyContent != null" >
        reply_content,
      </if>
    </trim>
    <trim prefix="values (" suffix=")" suffixOverrides="," >
      <if test="replyId != null" >
        #{replyId,jdbcType=VARCHAR},
      </if>
      <if test="cId != null" >
        #{cId,jdbcType=VARCHAR},
      </if>
      <if test="replyEr != null" >
        #{replyEr,jdbcType=VARCHAR},
      </if>
      <if test="replyDept != null" >
        #{replyDept,jdbcType=VARCHAR},
      </if>
      <if test="replyTime != null" >
        #{replyTime,jdbcType=TIMESTAMP},
      </if>
      <if test="replyContent != null" >
        #{replyContent,jdbcType=VARCHAR},
      </if>
    </trim>
  </insert>
  <select id="countByExample" parameterType="cn.BlackHumour.TaxSys.reply.entity.replyExample" resultType="java.lang.Integer" >
    select count(*) from reply
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
  </select>
  <update id="updateByExampleSelective" parameterType="map" >
    update reply
    <set >
      <if test="record.replyId != null" >
        reply_id = #{record.replyId,jdbcType=VARCHAR},
      </if>
      <if test="record.cId != null" >
        c_id = #{record.cId,jdbcType=VARCHAR},
      </if>
      <if test="record.replyEr != null" >
        reply_er = #{record.replyEr,jdbcType=VARCHAR},
      </if>
      <if test="record.replyDept != null" >
        reply_dept = #{record.replyDept,jdbcType=VARCHAR},
      </if>
      <if test="record.replyTime != null" >
        reply_time = #{record.replyTime,jdbcType=TIMESTAMP},
      </if>
      <if test="record.replyContent != null" >
        reply_content = #{record.replyContent,jdbcType=VARCHAR},
      </if>
    </set>
    <if test="_parameter != null" >
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByExample" parameterType="map" >
    update reply
    set reply_id = #{record.replyId,jdbcType=VARCHAR},
      c_id = #{record.cId,jdbcType=VARCHAR},
      reply_er = #{record.replyEr,jdbcType=VARCHAR},
      reply_dept = #{record.replyDept,jdbcType=VARCHAR},
      reply_time = #{record.replyTime,jdbcType=TIMESTAMP},
      reply_content = #{record.replyContent,jdbcType=VARCHAR}
    <if test="_parameter != null" >
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  <update id="updateByPrimaryKeySelective" parameterType="cn.BlackHumour.TaxSys.reply.entity.reply" >
    update reply
    <set >
      <if test="cId != null" >
        c_id = #{cId,jdbcType=VARCHAR},
      </if>
      <if test="replyEr != null" >
        reply_er = #{replyEr,jdbcType=VARCHAR},
      </if>
      <if test="replyDept != null" >
        reply_dept = #{replyDept,jdbcType=VARCHAR},
      </if>
      <if test="replyTime != null" >
        reply_time = #{replyTime,jdbcType=TIMESTAMP},
      </if>
      <if test="replyContent != null" >
        reply_content = #{replyContent,jdbcType=VARCHAR},
      </if>
    </set>
    where reply_id = #{replyId,jdbcType=VARCHAR}
  </update>
  <update id="updateByPrimaryKey" parameterType="cn.BlackHumour.TaxSys.reply.entity.reply" >
    update reply
    set c_id = #{cId,jdbcType=VARCHAR},
      reply_er = #{replyEr,jdbcType=VARCHAR},
      reply_dept = #{replyDept,jdbcType=VARCHAR},
      reply_time = #{replyTime,jdbcType=TIMESTAMP},
      reply_content = #{replyContent,jdbcType=VARCHAR}
    where reply_id = #{replyId,jdbcType=VARCHAR}
  </update>